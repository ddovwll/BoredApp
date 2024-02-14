; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [134 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [268 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 39109920, ; 1: Newtonsoft.Json.dll => 0x254c520 => 48
	i32 42244203, ; 2: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 122
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 5: Microsoft.Maui.Graphics.dll => 0x44bb714 => 47
	i32 83839681, ; 6: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 115559751, ; 7: BoredApp => 0x6e34d47 => 82
	i32 117431740, ; 8: System.Runtime.InteropServices => 0x6ffddbc => 114
	i32 136584136, ; 9: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 10: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 11: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 58
	i32 182336117, ; 12: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 76
	i32 205061960, ; 13: System.ComponentModel => 0xc38ff48 => 90
	i32 230752869, ; 14: Microsoft.CSharp.dll => 0xdc10265 => 83
	i32 246610117, ; 15: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 111
	i32 317674968, ; 16: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 17: Xamarin.AndroidX.Activity.dll => 0x13031348 => 54
	i32 321963286, ; 18: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 19: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 65
	i32 347068432, ; 20: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 52
	i32 379916513, ; 21: System.Threading.Thread.dll => 0x16a510e1 => 122
	i32 385762202, ; 22: System.Memory.dll => 0x16fe439a => 101
	i32 395744057, ; 23: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 24: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 25: System.Collections => 0x1a61054f => 87
	i32 450948140, ; 26: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 64
	i32 456227837, ; 27: System.Web.HttpUtility.dll => 0x1b317bfd => 124
	i32 459347974, ; 28: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 117
	i32 469710990, ; 29: System.dll => 0x1bff388e => 128
	i32 489220957, ; 30: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 31: System.ObjectModel => 0x1dbae811 => 106
	i32 513247710, ; 32: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 42
	i32 538707440, ; 33: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 34: Microsoft.Extensions.Logging => 0x20216150 => 39
	i32 627609679, ; 35: Xamarin.AndroidX.CustomView => 0x2568904f => 62
	i32 627931235, ; 36: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 37: System.Collections.Concurrent => 0x2814a96c => 84
	i32 690569205, ; 38: System.Xml.Linq.dll => 0x29293ff5 => 125
	i32 748832960, ; 39: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 50
	i32 759454413, ; 40: System.Net.Requests => 0x2d445acd => 104
	i32 775507847, ; 41: System.IO.Compression => 0x2e394f87 => 98
	i32 777317022, ; 42: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 43: Microsoft.Extensions.Options => 0x2f0980eb => 41
	i32 804715423, ; 44: System.Data.Common => 0x2ff6fb9f => 92
	i32 823281589, ; 45: System.Private.Uri.dll => 0x311247b5 => 107
	i32 830298997, ; 46: System.IO.Compression.Brotli => 0x317d5b75 => 97
	i32 869139383, ; 47: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 48: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 49: System.ComponentModel.Primitives.dll => 0x35e25008 => 88
	i32 918734561, ; 50: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 955402788, ; 51: Newtonsoft.Json => 0x38f24a24 => 48
	i32 961460050, ; 52: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 53: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 65
	i32 975874589, ; 54: System.Xml.XDocument => 0x3a2aaa1d => 127
	i32 990727110, ; 55: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 56: System.Collections.dll => 0x3b2c715c => 87
	i32 1012816738, ; 57: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 75
	i32 1019214401, ; 58: System.Drawing => 0x3cbffa41 => 96
	i32 1028951442, ; 59: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 38
	i32 1035644815, ; 60: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 55
	i32 1036536393, ; 61: System.Drawing.Primitives.dll => 0x3dc84a49 => 95
	i32 1043950537, ; 62: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 63: System.Linq.Expressions.dll => 0x3e444eb4 => 99
	i32 1052210849, ; 64: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 67
	i32 1082857460, ; 65: System.ComponentModel.TypeConverter => 0x408b17f4 => 89
	i32 1084122840, ; 66: Xamarin.Kotlin.StdLib => 0x409e66d8 => 80
	i32 1098259244, ; 67: System => 0x41761b2c => 128
	i32 1108272742, ; 68: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 69: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 70: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 71: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 72: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 72
	i32 1260983243, ; 73: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 74: SQLitePCLRaw.core.dll => 0x4d0585a0 => 51
	i32 1293217323, ; 75: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 63
	i32 1308624726, ; 76: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 77: System.Linq => 0x4eed2679 => 100
	i32 1336711579, ; 78: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 79: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 80: Xamarin.AndroidX.SavedState => 0x52114ed3 => 75
	i32 1406073936, ; 81: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 59
	i32 1408764838, ; 82: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 116
	i32 1430672901, ; 83: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 84: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 85: System.IO.Compression.dll => 0x57261233 => 98
	i32 1469204771, ; 86: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 56
	i32 1470490898, ; 87: Microsoft.Extensions.Primitives => 0x57a5e912 => 42
	i32 1480492111, ; 88: System.IO.Compression.Brotli.dll => 0x583e844f => 97
	i32 1526286932, ; 89: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 90: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 121
	i32 1622152042, ; 91: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 69
	i32 1624863272, ; 92: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 78
	i32 1636350590, ; 93: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 61
	i32 1639515021, ; 94: System.Net.Http.dll => 0x61b9038d => 102
	i32 1639986890, ; 95: System.Text.RegularExpressions => 0x61c036ca => 121
	i32 1657153582, ; 96: System.Runtime => 0x62c6282e => 118
	i32 1658251792, ; 97: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 79
	i32 1677501392, ; 98: System.Net.Primitives.dll => 0x63fca3d0 => 103
	i32 1679769178, ; 99: System.Security.Cryptography => 0x641f3e5a => 119
	i32 1711441057, ; 100: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 52
	i32 1729485958, ; 101: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 57
	i32 1743415430, ; 102: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 103: System.Diagnostics.TraceSource.dll => 0x69239124 => 94
	i32 1766324549, ; 104: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 76
	i32 1770582343, ; 105: Microsoft.Extensions.Logging.dll => 0x6988f147 => 39
	i32 1780572499, ; 106: Mono.Android.Runtime.dll => 0x6a216153 => 132
	i32 1782862114, ; 107: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 108: Xamarin.AndroidX.Fragment => 0x6a96652d => 64
	i32 1793755602, ; 109: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 110: Xamarin.AndroidX.Loader => 0x6bcd3296 => 69
	i32 1813058853, ; 111: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 80
	i32 1813201214, ; 112: Xamarin.Google.Android.Material => 0x6c13413e => 79
	i32 1818569960, ; 113: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 73
	i32 1824175904, ; 114: System.Text.Encoding.Extensions => 0x6cbab720 => 120
	i32 1824722060, ; 115: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 116
	i32 1828688058, ; 116: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 40
	i32 1853025655, ; 117: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 118: System.Linq.Expressions => 0x6ec71a65 => 99
	i32 1870277092, ; 119: System.Reflection.Primitives => 0x6f7a29e4 => 112
	i32 1875935024, ; 120: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 121: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 122: System.Collections.NonGeneric.dll => 0x71dc7c8b => 85
	i32 1939592360, ; 123: System.Private.Xml.Linq => 0x739bd4a8 => 108
	i32 1953182387, ; 124: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 125: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 35
	i32 2003115576, ; 126: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 127: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 67
	i32 2045470958, ; 128: System.Private.Xml => 0x79eb68ee => 109
	i32 2055257422, ; 129: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 66
	i32 2066184531, ; 130: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 131: System.Diagnostics.TraceSource => 0x7b6f419e => 94
	i32 2079903147, ; 132: System.Runtime.dll => 0x7bf8cdab => 118
	i32 2090596640, ; 133: System.Numerics.Vectors => 0x7c9bf920 => 105
	i32 2103459038, ; 134: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 53
	i32 2127167465, ; 135: System.Console => 0x7ec9ffe9 => 91
	i32 2142473426, ; 136: System.Collections.Specialized => 0x7fb38cd2 => 86
	i32 2159891885, ; 137: Microsoft.Maui => 0x80bd55ad => 45
	i32 2169148018, ; 138: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 139: Microsoft.Extensions.Options.dll => 0x820d22b3 => 41
	i32 2192057212, ; 140: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 40
	i32 2193016926, ; 141: System.ObjectModel.dll => 0x82b6c85e => 106
	i32 2201107256, ; 142: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 81
	i32 2201231467, ; 143: System.Net.Http => 0x8334206b => 102
	i32 2207618523, ; 144: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 145: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 36
	i32 2279755925, ; 146: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 74
	i32 2303942373, ; 147: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 148: System.Private.CoreLib.dll => 0x896b7878 => 130
	i32 2340441535, ; 149: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 113
	i32 2353062107, ; 150: System.Net.Primitives => 0x8c40e0db => 103
	i32 2366048013, ; 151: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 152: System.Xml.ReaderWriter.dll => 0x8d24e767 => 126
	i32 2371007202, ; 153: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 35
	i32 2395872292, ; 154: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 155: System.Web.HttpUtility => 0x8f24faee => 124
	i32 2427813419, ; 156: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 157: System.Console.dll => 0x912896e5 => 91
	i32 2465273461, ; 158: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 50
	i32 2471841756, ; 159: netstandard.dll => 0x93554fdc => 129
	i32 2475788418, ; 160: Java.Interop.dll => 0x93918882 => 131
	i32 2480646305, ; 161: Microsoft.Maui.Controls => 0x93dba8a1 => 43
	i32 2503351294, ; 162: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2538310050, ; 163: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 111
	i32 2550873716, ; 164: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 165: Microsoft.CSharp => 0x98ba5a04 => 83
	i32 2576534780, ; 166: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2585220780, ; 167: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 120
	i32 2593496499, ; 168: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 169: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 81
	i32 2617129537, ; 170: System.Private.Xml.dll => 0x9bfe3a41 => 109
	i32 2620871830, ; 171: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 61
	i32 2626831493, ; 172: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2664396074, ; 173: System.Xml.XDocument.dll => 0x9ecf752a => 127
	i32 2665622720, ; 174: System.Drawing.Primitives => 0x9ee22cc0 => 95
	i32 2676780864, ; 175: System.Data.Common.dll => 0x9f8c6f40 => 92
	i32 2724373263, ; 176: System.Runtime.Numerics.dll => 0xa262a30f => 115
	i32 2732626843, ; 177: Xamarin.AndroidX.Activity => 0xa2e0939b => 54
	i32 2737747696, ; 178: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 56
	i32 2740698338, ; 179: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 180: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 181: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 44
	i32 2764765095, ; 182: Microsoft.Maui.dll => 0xa4caf7a7 => 45
	i32 2778768386, ; 183: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 77
	i32 2785988530, ; 184: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 185: Microsoft.Maui.Graphics => 0xa7008e0b => 47
	i32 2810250172, ; 186: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 59
	i32 2814304133, ; 187: BoredApp.dll => 0xa7bedf85 => 82
	i32 2853208004, ; 188: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 77
	i32 2861189240, ; 189: Microsoft.Maui.Essentials => 0xaa8a4878 => 46
	i32 2909740682, ; 190: System.Private.CoreLib => 0xad6f1e8a => 130
	i32 2916838712, ; 191: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 78
	i32 2919462931, ; 192: System.Numerics.Vectors.dll => 0xae037813 => 105
	i32 2959614098, ; 193: System.ComponentModel.dll => 0xb0682092 => 90
	i32 2978675010, ; 194: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 63
	i32 3038032645, ; 195: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 196: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 197: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 70
	i32 3059408633, ; 198: Mono.Android.Runtime => 0xb65adef9 => 132
	i32 3059793426, ; 199: System.ComponentModel.Primitives => 0xb660be12 => 88
	i32 3159123045, ; 200: System.Reflection.Primitives.dll => 0xbc4c6465 => 112
	i32 3178803400, ; 201: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 71
	i32 3220365878, ; 202: System.Threading => 0xbff2e236 => 123
	i32 3258312781, ; 203: Xamarin.AndroidX.CardView => 0xc235e84d => 57
	i32 3286872994, ; 204: SQLite-net.dll => 0xc3e9b3a2 => 49
	i32 3305363605, ; 205: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 206: System.Net.Requests.dll => 0xc5b097e4 => 104
	i32 3317135071, ; 207: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 62
	i32 3346324047, ; 208: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 72
	i32 3357674450, ; 209: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3360279109, ; 210: SQLitePCLRaw.core => 0xc849ca45 => 51
	i32 3362522851, ; 211: Xamarin.AndroidX.Core => 0xc86c06e3 => 60
	i32 3366347497, ; 212: Java.Interop => 0xc8a662e9 => 131
	i32 3374999561, ; 213: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 74
	i32 3381016424, ; 214: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 215: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 37
	i32 3430777524, ; 216: netstandard => 0xcc7d82b4 => 129
	i32 3458724246, ; 217: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 218: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 89
	i32 3476120550, ; 219: Mono.Android => 0xcf3163e6 => 133
	i32 3484440000, ; 220: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3509114376, ; 221: System.Xml.Linq => 0xd128d608 => 125
	i32 3580758918, ; 222: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 223: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 224: System.Linq.dll => 0xd715a361 => 100
	i32 3624195450, ; 225: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 113
	i32 3641597786, ; 226: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 66
	i32 3643446276, ; 227: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 228: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 71
	i32 3657292374, ; 229: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 36
	i32 3672681054, ; 230: Mono.Android.dll => 0xdae8aa5e => 133
	i32 3724971120, ; 231: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 70
	i32 3748608112, ; 232: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 93
	i32 3751619990, ; 233: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3754567612, ; 234: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 53
	i32 3786282454, ; 235: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 58
	i32 3792276235, ; 236: System.Collections.NonGeneric => 0xe2098b0b => 85
	i32 3802395368, ; 237: System.Collections.Specialized.dll => 0xe2a3f2e8 => 86
	i32 3823082795, ; 238: System.Security.Cryptography.dll => 0xe3df9d2b => 119
	i32 3841636137, ; 239: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 38
	i32 3849253459, ; 240: System.Runtime.InteropServices.dll => 0xe56ef253 => 114
	i32 3876362041, ; 241: SQLite-net => 0xe70c9739 => 49
	i32 3896106733, ; 242: System.Collections.Concurrent.dll => 0xe839deed => 84
	i32 3896760992, ; 243: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 60
	i32 3920221145, ; 244: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 245: System.Xml.ReaderWriter => 0xea213423 => 126
	i32 3931092270, ; 246: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 73
	i32 3955647286, ; 247: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 55
	i32 4025784931, ; 248: System.Memory => 0xeff49a63 => 101
	i32 4046471985, ; 249: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 44
	i32 4054681211, ; 250: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 110
	i32 4068434129, ; 251: System.Private.Xml.Linq.dll => 0xf27f60d1 => 108
	i32 4073602200, ; 252: System.Threading.dll => 0xf2ce3c98 => 123
	i32 4091086043, ; 253: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 254: Microsoft.Maui.Essentials.dll => 0xf40add04 => 46
	i32 4099507663, ; 255: System.Drawing.dll => 0xf45985cf => 96
	i32 4100113165, ; 256: System.Private.Uri => 0xf462c30d => 107
	i32 4103439459, ; 257: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 258: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 37
	i32 4147896353, ; 259: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 110
	i32 4150914736, ; 260: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 261: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 117
	i32 4182413190, ; 262: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 68
	i32 4213026141, ; 263: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 93
	i32 4249188766, ; 264: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 265: Microsoft.Maui.Controls.dll => 0xfea12dee => 43
	i32 4274976490, ; 266: System.Runtime.Numerics => 0xfecef6ea => 115
	i32 4292120959 ; 267: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 68
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [268 x i32] [
	i32 0, ; 0
	i32 48, ; 1
	i32 9, ; 2
	i32 122, ; 3
	i32 33, ; 4
	i32 47, ; 5
	i32 17, ; 6
	i32 82, ; 7
	i32 114, ; 8
	i32 32, ; 9
	i32 25, ; 10
	i32 58, ; 11
	i32 76, ; 12
	i32 90, ; 13
	i32 83, ; 14
	i32 111, ; 15
	i32 30, ; 16
	i32 54, ; 17
	i32 8, ; 18
	i32 65, ; 19
	i32 52, ; 20
	i32 122, ; 21
	i32 101, ; 22
	i32 34, ; 23
	i32 28, ; 24
	i32 87, ; 25
	i32 64, ; 26
	i32 124, ; 27
	i32 117, ; 28
	i32 128, ; 29
	i32 6, ; 30
	i32 106, ; 31
	i32 42, ; 32
	i32 27, ; 33
	i32 39, ; 34
	i32 62, ; 35
	i32 19, ; 36
	i32 84, ; 37
	i32 125, ; 38
	i32 50, ; 39
	i32 104, ; 40
	i32 98, ; 41
	i32 25, ; 42
	i32 41, ; 43
	i32 92, ; 44
	i32 107, ; 45
	i32 97, ; 46
	i32 10, ; 47
	i32 24, ; 48
	i32 88, ; 49
	i32 21, ; 50
	i32 48, ; 51
	i32 14, ; 52
	i32 65, ; 53
	i32 127, ; 54
	i32 23, ; 55
	i32 87, ; 56
	i32 75, ; 57
	i32 96, ; 58
	i32 38, ; 59
	i32 55, ; 60
	i32 95, ; 61
	i32 4, ; 62
	i32 99, ; 63
	i32 67, ; 64
	i32 89, ; 65
	i32 80, ; 66
	i32 128, ; 67
	i32 26, ; 68
	i32 20, ; 69
	i32 16, ; 70
	i32 22, ; 71
	i32 72, ; 72
	i32 2, ; 73
	i32 51, ; 74
	i32 63, ; 75
	i32 11, ; 76
	i32 100, ; 77
	i32 31, ; 78
	i32 32, ; 79
	i32 75, ; 80
	i32 59, ; 81
	i32 116, ; 82
	i32 0, ; 83
	i32 6, ; 84
	i32 98, ; 85
	i32 56, ; 86
	i32 42, ; 87
	i32 97, ; 88
	i32 30, ; 89
	i32 121, ; 90
	i32 69, ; 91
	i32 78, ; 92
	i32 61, ; 93
	i32 102, ; 94
	i32 121, ; 95
	i32 118, ; 96
	i32 79, ; 97
	i32 103, ; 98
	i32 119, ; 99
	i32 52, ; 100
	i32 57, ; 101
	i32 1, ; 102
	i32 94, ; 103
	i32 76, ; 104
	i32 39, ; 105
	i32 132, ; 106
	i32 17, ; 107
	i32 64, ; 108
	i32 9, ; 109
	i32 69, ; 110
	i32 80, ; 111
	i32 79, ; 112
	i32 73, ; 113
	i32 120, ; 114
	i32 116, ; 115
	i32 40, ; 116
	i32 26, ; 117
	i32 99, ; 118
	i32 112, ; 119
	i32 8, ; 120
	i32 2, ; 121
	i32 85, ; 122
	i32 108, ; 123
	i32 13, ; 124
	i32 35, ; 125
	i32 5, ; 126
	i32 67, ; 127
	i32 109, ; 128
	i32 66, ; 129
	i32 4, ; 130
	i32 94, ; 131
	i32 118, ; 132
	i32 105, ; 133
	i32 53, ; 134
	i32 91, ; 135
	i32 86, ; 136
	i32 45, ; 137
	i32 12, ; 138
	i32 41, ; 139
	i32 40, ; 140
	i32 106, ; 141
	i32 81, ; 142
	i32 102, ; 143
	i32 14, ; 144
	i32 36, ; 145
	i32 74, ; 146
	i32 18, ; 147
	i32 130, ; 148
	i32 113, ; 149
	i32 103, ; 150
	i32 12, ; 151
	i32 126, ; 152
	i32 35, ; 153
	i32 13, ; 154
	i32 124, ; 155
	i32 10, ; 156
	i32 91, ; 157
	i32 50, ; 158
	i32 129, ; 159
	i32 131, ; 160
	i32 43, ; 161
	i32 16, ; 162
	i32 111, ; 163
	i32 11, ; 164
	i32 83, ; 165
	i32 15, ; 166
	i32 120, ; 167
	i32 20, ; 168
	i32 81, ; 169
	i32 109, ; 170
	i32 61, ; 171
	i32 15, ; 172
	i32 127, ; 173
	i32 95, ; 174
	i32 92, ; 175
	i32 115, ; 176
	i32 54, ; 177
	i32 56, ; 178
	i32 1, ; 179
	i32 21, ; 180
	i32 44, ; 181
	i32 45, ; 182
	i32 77, ; 183
	i32 27, ; 184
	i32 47, ; 185
	i32 59, ; 186
	i32 82, ; 187
	i32 77, ; 188
	i32 46, ; 189
	i32 130, ; 190
	i32 78, ; 191
	i32 105, ; 192
	i32 90, ; 193
	i32 63, ; 194
	i32 34, ; 195
	i32 7, ; 196
	i32 70, ; 197
	i32 132, ; 198
	i32 88, ; 199
	i32 112, ; 200
	i32 71, ; 201
	i32 123, ; 202
	i32 57, ; 203
	i32 49, ; 204
	i32 7, ; 205
	i32 104, ; 206
	i32 62, ; 207
	i32 72, ; 208
	i32 24, ; 209
	i32 51, ; 210
	i32 60, ; 211
	i32 131, ; 212
	i32 74, ; 213
	i32 3, ; 214
	i32 37, ; 215
	i32 129, ; 216
	i32 22, ; 217
	i32 89, ; 218
	i32 133, ; 219
	i32 23, ; 220
	i32 125, ; 221
	i32 31, ; 222
	i32 33, ; 223
	i32 100, ; 224
	i32 113, ; 225
	i32 66, ; 226
	i32 28, ; 227
	i32 71, ; 228
	i32 36, ; 229
	i32 133, ; 230
	i32 70, ; 231
	i32 93, ; 232
	i32 3, ; 233
	i32 53, ; 234
	i32 58, ; 235
	i32 85, ; 236
	i32 86, ; 237
	i32 119, ; 238
	i32 38, ; 239
	i32 114, ; 240
	i32 49, ; 241
	i32 84, ; 242
	i32 60, ; 243
	i32 19, ; 244
	i32 126, ; 245
	i32 73, ; 246
	i32 55, ; 247
	i32 101, ; 248
	i32 44, ; 249
	i32 110, ; 250
	i32 108, ; 251
	i32 123, ; 252
	i32 5, ; 253
	i32 46, ; 254
	i32 96, ; 255
	i32 107, ; 256
	i32 29, ; 257
	i32 37, ; 258
	i32 110, ; 259
	i32 29, ; 260
	i32 117, ; 261
	i32 68, ; 262
	i32 93, ; 263
	i32 18, ; 264
	i32 43, ; 265
	i32 115, ; 266
	i32 68 ; 267
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
