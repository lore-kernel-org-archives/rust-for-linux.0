Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020085.outbound.protection.outlook.com [52.101.195.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDAC43C05D;
	Fri, 10 Jul 2026 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700485; cv=fail; b=gLlUmUjml/jBsaFcUoAWTL1a8JoIflmCLvUoIgEDyhkP2PKBeS3Hbd83RdgIZDLuqOnfdpFbgmoOMMT/sk4ehNfUkHGbGkmOZUA4LR9dFd5bDufRRA5ZN85EmuOG59PVFXKCchY92wShez74DJBWgoADnVilvkUDKinxFG5xBa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700485; c=relaxed/simple;
	bh=fOCUjOy0SxtLukY0xK9+PaUoylzfsxRkglrt4vHj6us=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N0eNGESvi8Ty1Svj52HJQTUmMEKFEmXAkkwnzBf6ZCKzQ4Y2IAkVhSFrtCMeMgBXLPsK9bXR1vdTjUGdL04gxEAggYMAAAOOtn4zknBIxTkyrNTfaDK00fhFrcbZTcajoGZEV86nVDlJ2BG4WNdvl+iIFFNsY5TPLXRGaVRr5Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wE5EWKqP; arc=fail smtp.client-ip=52.101.195.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wE5EWKqP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmoVCqHKLlvYY/KeW68KN/mbWZMSojnJXe9jq/NFcr11LTP99C0E/jrs2TAyHFXXsGVWbFfDpSG1ujbjy5D8oFXTaaw+ecTdI4LcR0i0D6BMGdAILrOAU2aYsgdxOT+Go2WdifOK0qcA5jFLXTOi4QWzwQM52vAFSatZuqQVIxlNKnLwL+eO2BkIJ/xzAeOu/m6l+jpZPCYL0+IMlfSw0Vo/gpjDGB0y0kHiSNLMlIx0c+Nh9VAnvAEoKPg96AA5MBG5MPGr1jdgJL/MzKSsAuqLBxT0dVxFn1ji7qVQPDQ5X8J+c52zYWXLUQ4CccZKhSu2s5WaFHYIfL/+0GWYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mn0DE+pSBZRwD063GrBxlB5CLXX8aZ0qe/59RPb9O9I=;
 b=magTimwA4U1pGDfkJbRGs+MO0MoocT750U8JGPd+6x6jJpLi3ukvhjzdQqu7RBz/1FkVHP2iVqTFmxVh5Y5Oq03u9+PjN09FuatjhpMUGw9TnS4ViVDyj+db1yDx3NNiJvWkHSapdervu5Tv/uQuSGE40m3zwjVd4GpeiXc4b7+qG1el0ng16iD+TK38l3jgcWbEbU/Nha6hnlVvNqYtob73GINYC+2bCtkGCetlo1fW89N1ICdwG+cJbQ/w3gWGB3DUeGL7lxjXC2SiGx3dT3TZMDb7gBM9q6NQ1/LAZHP+RMXFYuyfhZSOdVVlBqlne5tbrNKs4+iV/ZbJ1oTHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mn0DE+pSBZRwD063GrBxlB5CLXX8aZ0qe/59RPb9O9I=;
 b=wE5EWKqPcLuOMuyse3Sdvu+HW1IcpeKzVh26R1HHeDgwB3vCBR50CS1PparNXfRagcPBjWZ+dvwUHLQns9mJrMHKWXHS8uT7DAE4IOGgRCJrNDVxqhiIPZZOTRvIPVW9PdwFK2tY6dt5XvpEB1UhrNKi0iN/fsrT2XBoSCyRD/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7266.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:225::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:20:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 16:20:51 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 10 Jul 2026 17:20:36 +0100
Subject: [PATCH 6/7] rust: pin-init: make `[pin_]init_array_from_fn` unwind
 safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-pin-init-sync-v1-6-8fa16cde87ae@garyguo.net>
References: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
In-Reply-To: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Mirko Adzic <adzicmirko97@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783700449; l=7461;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=rQ+MnvNqn1jtIwqCTQm4U7WKlOHdU3kowiyLT1NMIgI=;
 b=XLo6BZpDXzzMGXjW7pzRccNrj5X9bzA7dG/iRkQowZjCLhi06UWmYvn0CadxSnBt+qJCYeXX+
 kUAxHiaeDsaBZ+9j2ImQev4K6Twtjf0Eh6AsEEqFXir37gqSXEpE8Ff
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 791580ed-1330-42bb-94ce-08dede9f35b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|5023799004|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ORaYpphDrwyLzSBfywtuEtI/dohehobJaZKrR9KAumL6XzkgqeIlt0swztmXqH8sP6nPpNa1yighLlnjf4T2FK+WcAeEHsmzKRyggugIm7Ta9DJkjFeVmFmisX/+DBnp97n6PBXIdGLiQic/BHZkTgXZff1TEz0HAhY/mo8tLtGBu9GD+xehxvzKLBHU5Ky5yj1zLB2fQ5kGKGA/M2dtpnlYdbT3MjphWqGZred/nkUEl9x35mzSyeNspnFRoGU0XLWowd2nBrL80VgBI5Yfo+WlKLSasYNMP/IASUoLskjRpIfu5/oUl4lz6Ks/VSyxQLK6no3SNwo8+WBdiDm0xaxNwmYY9cN8Y8dCwKeCaQKIibj/3dSGaloQk0E4MNvgKBNbZhM8mPltRti8mS4aT46o/uK8bXBvI3hnE91C+L2+AJjEO2XRxlX6RClP3XX3nnKb8oZ9G2Q21D/aKOvdxAnNf6tx1b180G1QB+QAvt2IZ7Mo/dIaKjw4R1kmbsqEVraWYn7xHXExWclAGriDZ09u8gZRuvdv1lPEF9rGevEPxMD3amsUbywGsV8fum7UMz1PmtnR1w4leiflhf2ePt2s03LsAirzH0rhZs4BUdOkjCR5k3Y3mQ3ozy9/49dMTKyQ9HMAaR3319XLTsEuYOVAwbMfelY9z0Zqgmki/GQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(5023799004)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUZJdDRxYkhvZm9UWkM0cnZIb3ArV0kwUy9TV3lZWE9aL1ZianZzUEo0YkpG?=
 =?utf-8?B?TGwrQnAwNE9mU3pDYkt5a2NjZGJhbk5hWkVTSnZkRlkzbzVNQ0tzdEZRREtz?=
 =?utf-8?B?L0R3QjludXVGNmgva3hQN3N6bFEzbzdxZWkvRCtjU2NaMUlOeG1zOFRZOVU3?=
 =?utf-8?B?YlFPajZ1OTljRmRHYWNxTE02UHo3SEljV2YweWsyWk1veTJ5ajh3a1VCY2J0?=
 =?utf-8?B?M0tPbVdNMVRCZzA4dUNmOUZ5OVYvb0EySHAxc0FxZkoyeWlYajVKTlNhNzFB?=
 =?utf-8?B?STNJWDQ4ajNWK1B3WWc3cm51L2lKNjJnYjYzNnVyT2c3SjltWEpJazJGcU5N?=
 =?utf-8?B?RWpMR2FOd2RDZU9YQnlFZGdWNER3MFQ4b2MrVjltTUFvNlE3M3U2cEx1aDJj?=
 =?utf-8?B?bndIVzlVTDdobC8xTDc4ajhIRjhKazRPd1Ridk14Q1ZJMEhNdW03U0RJcnU3?=
 =?utf-8?B?VnVDRE1iSmhKQVVtZUF4UGlzdVVuVU1hQmxOVnpIYjNYNTF4OTJYV2NYcHJV?=
 =?utf-8?B?ek80RllYRUxpdVN5TVNCeVdZMFkvZnN0WVpPWE5HNjRGTEN4c3R3MVJRdWhC?=
 =?utf-8?B?YzEvRzJOalZlRzBaVGRUQ1NZbTVLNWRocmE3Vm5pUk5nS3djTTlXU3p2eUlM?=
 =?utf-8?B?K3QwU0FlZklBT2VYUnM0bS80ZGVjWFBiak1iSjVSUGJ5b2RBVjJKU2ZRYWlP?=
 =?utf-8?B?Z2txNmtFSU5HLzVmb0NXY01EV1VxWHU2SzZKTlNqWGIzbTNhTGg3N3Y5Vktl?=
 =?utf-8?B?amJMRmRSa1BtZmQ1QXhIQ0V6aWVoYTdhblFYMTlSTVV3UjVCNWtDeFM5bXlS?=
 =?utf-8?B?VVVzYytKak4ySnFvMDR6Q0JNNmFBTXlRZkgzOFRLcWs2amdaRk50Vzhydjgz?=
 =?utf-8?B?c0N3cVloaWlEenloZHlKNG55RmRqaUxUQ1J6Y1VCbzFZZnNqN3NMUEJsTUxm?=
 =?utf-8?B?SVM2TVB3L2tHVEZQQ1g2RWZDVkYybm9nNGlWSzBqU2V1SDBLZ2VHTk5XS0JN?=
 =?utf-8?B?bUlValQ1K1Z3Um1KVURFa1pSMEY1Tm5TUlo5RE05U2g0OGJpbGJCWnM2elJl?=
 =?utf-8?B?dkUxNm5ucFJjQ1ZUZXFJKzJabWtuUDlTcFNqd3hHeExzOGFvbzd5YjBUaEtB?=
 =?utf-8?B?WjVHWGVGWU9zYlBSbE1TaFFxMSs2d1BOaHhOVlBpM0hCS2dKczNicURocGJD?=
 =?utf-8?B?RlVxVGdhSEgxRk13Z29NMk5VNStRZXJqYXVHMmNCVmxlcG41SVBMNFBFeHJh?=
 =?utf-8?B?UzQ0Nzhibm5sdWNHaW5uNXpqc1k5Lzc2MXcxNGZoendJbkxxU1UvWkRxYURj?=
 =?utf-8?B?S2QwL0ZCZXN5ZnphYSs5dWJPcEJLZFg3K3hVSTZScXNXZm1NZGtseHFGRUgy?=
 =?utf-8?B?dkp5bDV4TU9BNUJ4OThRZjNHRWxLTWt1K3M0Ymhpc282T2RPRWtyeDJUaCt2?=
 =?utf-8?B?YUFQenpIZ3h1TXJxbmttWVZteUdGUHBqbEVhUnp5cWtZVkh5U0RNUzh0NkVX?=
 =?utf-8?B?T0NJV3ZPSG9TaExDclFzaDJJY3piVmVKN2VFQkV0dEdXZGc2UDZ1YURHd013?=
 =?utf-8?B?cjBOVlRlbm9xcm80ZjlJU2lYRGRSYkd3K04vaWtHN0s4a2VTbmYyOHVrcFYv?=
 =?utf-8?B?ZkZZMUh3NFpSM2NlRDVoKytTeSs4Z3Ftay9vbkZOMmhLaG1QaDJaNHREUW5G?=
 =?utf-8?B?Q3IyY0pZdnBNbXpjTG9xT0ZwOHRmTlZ6NXJVOUg5VUNCMTVra1RlZ3R5RHlJ?=
 =?utf-8?B?QzFLZmx6SmFGcVZpaTFaWm91WHplaWZ4Q0wvZkZ6VUlQQTVCZ2ZEcjN0bHlJ?=
 =?utf-8?B?empCb09Dc0VML0p2RGQ3bVJQMmJadFFESWNreGlXS0JFQ2c2QU1PS05JWkdX?=
 =?utf-8?B?QlpMTzFaVFYrY3NVbG8wTHlzVmhWSDErNkZTVkxrTWxBaUEwNlZXcktQbEQ2?=
 =?utf-8?B?RkJVTU5wTXlUWW1Fa05heE9IZmdKM25GdzQwZ3RWVjA5bndiQ0s3N3RtNERn?=
 =?utf-8?B?QjdlRTFWTEFUOUlyK25HT0xiZ2d1NEIvNWVsTlBMQkpnRWM3QXBralZ1cjRj?=
 =?utf-8?B?NnNjRUlwUEl3bERZcFk1K0pNVHZSVVFiZEtPYTNGRDJROTcrVEl0L0dtblBx?=
 =?utf-8?B?NFFwb213Uk13a09jK1VRSGZZTUpXWXBBQTlaZ01DSldzSjBXZi9rRjFKYk9h?=
 =?utf-8?B?RmNDS3RLTnJRYWZIdlNsTEdpdGovWDNMYjZ2djYvenFkSDQ5Nks2ODFZUnhZ?=
 =?utf-8?B?K0swbkxCemJHMHVLNXAvV0tGTS9oYW03OFl3T1lDVDRnRlBaMGsvVjVZWUNQ?=
 =?utf-8?B?MTREL2NreGE1SUNqMVVocnAxblpYVXVtWXR4dVRzL0RhYVJuaGdtUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 791580ed-1330-42bb-94ce-08dede9f35b0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:20:51.5613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iy2Use7ODUjkWSB7fWwgCx9urvaL5/5BQxSUHLne/ki9QmMuRgIm0KpnEbq2wTGTSBzyPPYQ0/7rM2KKPExyPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7266

From: Mirko Adzic <adzicmirko97@gmail.com>

The previous code only ran cleanup on the explicit error path. If the per-
element initializer panicked partway through, the elements already written
into the array would be leaked: their `Drop` impls would never run. This
violates the pinning requirement.

Fix the unwind safety issue by adding a guard type that drops element on
both error and panic path.

To avoid having to duplicate code between `pin_init_array_from_fn` and the
non-pin variant, extract the code to a shared `ArrayInit` type; this type
is internal and not visible via API.

Reported-by: Gary Guo <gary@garyguo.net>
Closes: https://github.com/Rust-for-Linux/pin-init/issues/136
Signed-off-by: Mirko Adzic <adzicmirko97@gmail.com>
[ Split guard type and the initializer type, move the guard type to be
  within __pinned_init. - Gary ]
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 122 +++++++++++++++++++++++++++++++----------------
 1 file changed, 80 insertions(+), 42 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 90e9d501d44a..3fc4a674a487 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1186,6 +1186,82 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
     unsafe { init_from_closure(|_| Ok(())) }
 }
 
+/// Array initializer from element initializer.
+struct ArrayInit<T: ?Sized, F>(F, __internal::PhantomInvariant<T>);
+
+// SAFETY: On success, all `N` elements of the array have been initialized. On error or panic, the
+// elements that have been initialized so far are dropped, thus leaving the array uninitialized and
+// ready to deallocate.
+unsafe impl<T, F, I, E, const N: usize> PinInit<[T; N], E> for ArrayInit<T, F>
+where
+    F: FnMut(usize) -> I,
+    I: PinInit<T, E>,
+{
+    unsafe fn __pinned_init(mut self, slot: *mut [T; N]) -> Result<(), E> {
+        /// # Invariants
+        ///
+        /// - `ptr[..num_init]` contains initialized elements of type `T`
+        /// - `ptr[num_init..N]` (where N is the size of the array) contains uninitialized memory
+        struct ArrayInitGuard<T> {
+            /// A pointer to the first element of the array.
+            ptr: *mut T,
+            /// The number of initialized elements in the array.
+            num_init: usize,
+        }
+
+        impl<T> Drop for ArrayInitGuard<T> {
+            #[inline]
+            fn drop(&mut self) {
+                // SAFETY: Per type invariant, `self.ptr[..self.num_init]` are initialized.
+                unsafe {
+                    core::ptr::drop_in_place(core::ptr::slice_from_raw_parts_mut(
+                        self.ptr,
+                        self.num_init,
+                    ))
+                };
+            }
+        }
+
+        // INVARIANT: nothing is initialized yet.
+        let mut guard = ArrayInitGuard {
+            ptr: slot.cast::<T>(),
+            num_init: 0,
+        };
+
+        for i in 0..N {
+            // INVARIANT: Elements `self.ptr[..self.num_init]` have been initialized
+            // thus far. This holds true for every `self.num_init = i`.
+            guard.num_init = i;
+
+            let init = (self.0)(i);
+            // SAFETY:
+            // - The subslot is derived from `slot` with a valid offset.
+            // - If `Err` is touched, the subslot is not touched further, the guard will drop
+            //   previously initialized elements only.
+            // - `slot` is pinned so is the subslot.
+            unsafe { init.__pinned_init(&raw mut (*slot)[i]) }?;
+        }
+
+        // Dismiss the drop guard now that all elements are initialized.
+        core::mem::forget(guard);
+        Ok(())
+    }
+}
+
+// SAFETY: Follows the `PinInit` impl. `__init` executes the same code as `__pinned_init`.
+unsafe impl<T, F, I, E, const N: usize> Init<[T; N], E> for ArrayInit<T, F>
+where
+    F: FnMut(usize) -> I,
+    I: Init<T, E>,
+{
+    #[inline(always)]
+    unsafe fn __init(self, slot: *mut [T; N]) -> Result<(), E> {
+        // SAFETY: `I: Init` cancels out the pinning requirement on subslots. The other safety
+        // requirements follow that of `__init`.
+        unsafe { self.__pinned_init(slot) }
+    }
+}
+
 /// Initializes an array by initializing each element via the provided initializer.
 ///
 /// # Examples
@@ -1197,31 +1273,12 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
 /// assert_eq!(array.len(), 1_000);
 /// ```
 pub fn init_array_from_fn<I, const N: usize, T, E>(
-    mut make_init: impl FnMut(usize) -> I,
+    make_init: impl FnMut(usize) -> I,
 ) -> impl Init<[T; N], E>
 where
     I: Init<T, E>,
 {
-    let init = move |slot: *mut [T; N]| {
-        let slot = slot.cast::<T>();
-        for i in 0..N {
-            let init = make_init(i);
-            // SAFETY: Since 0 <= `i` < N, it is still in bounds of `[T; N]`.
-            let ptr = unsafe { slot.add(i) };
-            // SAFETY: The pointer is derived from `slot` and thus satisfies the `__init`
-            // requirements.
-            if let Err(e) = unsafe { init.__init(ptr) } {
-                // SAFETY: The loop has initialized the elements `slot[0..i]` and since we return
-                // `Err` below, `slot` will be considered uninitialized memory.
-                unsafe { ptr::drop_in_place(ptr::slice_from_raw_parts_mut(slot, i)) };
-                return Err(e);
-            }
-        }
-        Ok(())
-    };
-    // SAFETY: The initializer above initializes every element of the array. On failure it drops
-    // any initialized elements and returns `Err`.
-    unsafe { init_from_closure(init) }
+    ArrayInit(make_init, __internal::PhantomInvariant::new())
 }
 
 /// Initializes an array by initializing each element via the provided initializer.
@@ -1240,31 +1297,12 @@ pub fn init_array_from_fn<I, const N: usize, T, E>(
 /// assert_eq!(array.len(), 1_000);
 /// ```
 pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
-    mut make_init: impl FnMut(usize) -> I,
+    make_init: impl FnMut(usize) -> I,
 ) -> impl PinInit<[T; N], E>
 where
     I: PinInit<T, E>,
 {
-    let init = move |slot: *mut [T; N]| {
-        let slot = slot.cast::<T>();
-        for i in 0..N {
-            let init = make_init(i);
-            // SAFETY: Since 0 <= `i` < N, it is still in bounds of `[T; N]`.
-            let ptr = unsafe { slot.add(i) };
-            // SAFETY: The pointer is derived from `slot` and thus satisfies the `__init`
-            // requirements.
-            if let Err(e) = unsafe { init.__pinned_init(ptr) } {
-                // SAFETY: The loop has initialized the elements `slot[0..i]` and since we return
-                // `Err` below, `slot` will be considered uninitialized memory.
-                unsafe { ptr::drop_in_place(ptr::slice_from_raw_parts_mut(slot, i)) };
-                return Err(e);
-            }
-        }
-        Ok(())
-    };
-    // SAFETY: The initializer above initializes every element of the array. On failure it drops
-    // any initialized elements and returns `Err`.
-    unsafe { pin_init_from_closure(init) }
+    ArrayInit(make_init, __internal::PhantomInvariant::new())
 }
 
 /// Construct an initializer in a closure and run it.

-- 
2.54.0

