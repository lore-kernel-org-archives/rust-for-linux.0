Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2058.outbound.protection.outlook.com [40.107.105.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C471DB546
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888521; cv=fail; b=uLbV80g1TYTAKUNWFH7iWm+wzzEmTQMyGQE95FTuCexpYgwIXbMA2tnKW0s/+lAghDt1uAxAjcbFxtfL2hjMPCj0PYrrWJdVsaxDl4wSfGxixC4nHEd7VhOrRKLsdHUtyDaE48CbQQKitbBswqPGe0xc9LgW+Xvo5qxGVGwfNTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888521; c=relaxed/simple;
	bh=0K8u6LH4EbWz61CPddcz4COF4eSdeuF2PVyUW4WHG00=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rwQ2Oc8/thE3tsGABgabo5nhdd1fHG0JpgP9ITmXYw9fhc3CsvnvpQcAB9jDOlaYG2eAC5VvZhcoPmdFr7cnYPShIc6kwPHCQFKxbWk478hXHkpMfPpGUUrLEnY4L0hOgEUV3phuEeO0a5kIIkNYWplT9UWBCShW4lB6mvsvF0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=fuMkW6Cu; arc=fail smtp.client-ip=40.107.105.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="fuMkW6Cu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahlLEpEwQrHFIATt9CZ5wDUQJDDHKebuI8XXvGntVEoXnrGgmlHAW2sE0iTNGT08f7Cf2PLQzeJOeeU9I5l4iFOg2+G1p3T0J9WWvEFV/CB08GIH1GxWHO/ZCX+A8y3Umwf3agqE5AyILZDxkAOWM6xn7nj914cqOydob72DaKqwKogl1lJHcNenNvvx5xt2faVBkIYUieDxhC1b9KNn7/CiquMalYB3jFkg6cQt4GtjcXORdRi+Q1ttLpj5bHpqy3LDVo4UBSx9k14grxGdz6RPNeCqkgHc/HNErLiMpj3CKXxC5kRERC9jFv54u/3yDzvY8PIWvY1f3xlEEJXSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi/B5Y117tcLqriKiFFjQo/en3TCty4A4FPUzF9DSm4=;
 b=WhhAK7xDZ82F/i2MIoffcvxGp72AR0gA8FUyTW6kQO/vUuxdDfUVt7McFOOgFbjDg/dqm0dw4lLSPPybe3DglfWRsGWTYd7WfZKcPAKH9gfRc60tcZjsQ7nk2s0fSgkWh7bPru9IwTMuemPjoE+xwEpXwKfHwEr6hp9hzFsUI557jcel+dAdlj8H/UdVapHuYqS18yhJabe2sWsq/9Rc9ybsYFlAMBy2Y4zTkk95WJzPj1yBNRNgUKccX2DEo1rD+cfkeFBA9ieq3lua8RNjFgG81EKouwxRzKEdkMD14hQ/zZpEiVkf0kxQ+31XNEpzReK22+LUT5k75gxRkCF7vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi/B5Y117tcLqriKiFFjQo/en3TCty4A4FPUzF9DSm4=;
 b=fuMkW6Cuwi2tQeJ/hmpKTjd0ikZ5uNE8xDOLHrhiOYjMCdWTxMJY6L0Y2AKZT7VBDxHW5PprO+IiCRB9i7Pvfkpe8W1nnS3YrQm8TCLXNDVnlq9wwGaXXtAtfkCe3qKzhNlF96xsmfpSHGts8PmBuPozBSC2RH1HF3Ec4iAK8V/X90msehUU5twADv6fiIzawgezmZ3hN07u1apEl+BstMm5Bgxs9fHPJ5CfEBa0AbgrGK2EGhVGbdcBnIep/K8/D0PTX0QhUUJT+mpWXVYgozYxa6ARxY4firhDnKWkTpiGF84nduwugZjFK8Etf80plP9QC2pFaKoWA+4ro+RQ6A==
Received: from AM0PR10CA0068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::21)
 by VI0PR10MB8425.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:21c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 10:21:52 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:208:15:cafe::2a) by AM0PR10CA0068.outlook.office365.com
 (2603:10a6:208:15::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 10:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 10:21:52 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 6 Nov
 2024 11:21:21 +0100
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 6 Nov
 2024 11:21:20 +0100
Message-ID: <459782fe-afca-4fe6-8ffb-ba7c7886de0a@de.bosch.com>
Date: Wed, 6 Nov 2024 11:21:14 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Abdiel Janulgue
	<abdiel.janulgue@gmail.com>
CC: <rust-for-linux@vger.kernel.org>, <aliceryhl@google.com>,
	<daniel.almeida@collabora.com>, <a.hindborg@kernel.org>, <dakr@redhat.com>,
	<airlied@redhat.com>, <wedsonaf@gmail.com>, <a.hindborg@samsung.com>
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
 <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
 <CANiq72nLNQD6f_Y2+jdcn3w_K0oXaEX-Y+mUE6Nco565m8Jzgw@mail.gmail.com>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <CANiq72nLNQD6f_Y2+jdcn3w_K0oXaEX-Y+mUE6Nco565m8Jzgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A8:EE_|VI0PR10MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 0967e807-96d1-40d0-c0cd-08dcfe4cd512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlRtcFNUcXZDOTU0N0JldG14VzJKUkhCZ2pVeHY4Mkd5S0Mzb00xNjJkcjly?=
 =?utf-8?B?SWtYR1BqaWFzMDhwd3pGR296b3diVGJyZ0dlM1VVeXN0SDBKclM3L1dEbEFW?=
 =?utf-8?B?SFdtQTBiTEo5SDIwRmlZb1MwQXl1Zy91UXI0ckpsNm9XN0FhSWh0NGpzcVpT?=
 =?utf-8?B?b0YxSjJwUkFUNi9qTWl6UG0wRUw0aGJjbVl6QWswRUtQS3lkS2NQVXdzVkhk?=
 =?utf-8?B?a2hpeDd6RGxCdTJiM0tVc2tNT010RE1mZC8zYmRqUHpLdlpNaWFObmhiNUV3?=
 =?utf-8?B?ZTJlaTRRK0crS3YxNDJweHV6V3VkUmIyOVdTWkRuMWNFN2IxVnRNMlpzdFZC?=
 =?utf-8?B?REQzZDd4aWRjN21GRk54UFliVDU5dzZ2VXRXQm1WQVRObHlJUllqUEdrdkFG?=
 =?utf-8?B?RnAwMzZLUkxoUjQxS2hMaC8xNXIvVUhiY3lmTkwzanh5V1hGMFIzRjcxcXZl?=
 =?utf-8?B?N0QrcFNxNldtNEQ3SisyMkZvV3o0cVlSKzVHUWs4Z1BUZ2QyOUZEUVJsY2Vy?=
 =?utf-8?B?S1p5SmthOURIT1ZwUGV2RnYxdEkvaW5obzRzd09heW5YMHY1RmlWSGhpRzBT?=
 =?utf-8?B?ZXJKL1JlbjJkaExqM3lXaHdyS09VUWRIQXprYXk3Zzh0emhYT3htZjFEWDlL?=
 =?utf-8?B?QkJWMm56ZzVrNUVsMyswT2RuYktwM1Z1UFkrWGxpL1JzUVd3VjNDVWNiU05k?=
 =?utf-8?B?T05rSFJYQUQ0c1d2dklXbTlaSEhaelFTb0FlaHRLdWtueG9iL2pSelVqaWR0?=
 =?utf-8?B?TXFnakNmai9PdmpqUHpBVjBXdExBR1ZxL1Uya0ZtdGptNTkzUmRHWThibUds?=
 =?utf-8?B?dFQ1U1hZTVAxckR6Zkd2UzZHbXJ3NGp0TzhZM0dMZDdmandiVWJqcys3a1pX?=
 =?utf-8?B?Q1ZtdWpzSklZWGJKMHQxNmpxM0VIN3hGc2w5SDBVbklkQXVvaGNQdjFCU2t4?=
 =?utf-8?B?UkhXWTBpdUo1d2c4K0tDNTByazdmODQ1TThQWml2WktFMWROMy9KZXA5UU44?=
 =?utf-8?B?emZyNktxTFF3eTFWTGwyZVJDSDdFT2VwZ1RHU0kzemVCOEc1T0FTTXg2ZXB1?=
 =?utf-8?B?cTNOem1nZ1d3b2VDOGlhVGZqaFdreDJYM3Frb3ZvQnQ1QWh1RU1nM2VnQjM0?=
 =?utf-8?B?NHdxT3ZZNGZsc3pFV1Znc0VWVktIc2F0aE5lcG1taWcva0hZRXpxalBUTFlW?=
 =?utf-8?B?WmFwOGVWb3YvbU5kWDQ0T0dXcm1mckxlOWxYRkFoTTFnbUl2dTd2NXQ5MUdP?=
 =?utf-8?B?eEJZbzBBTEdJUEFjZVB0TzVweTlkdk9PM1JTeDNrdkZLVXBIVG1mRDY4Q0Q2?=
 =?utf-8?B?aFUwcnJLWjZ4Z2Jydm11UG5Nb2JnYnJyQ0lZYWZUWS9KVWpIU002RDFwU09l?=
 =?utf-8?B?SUdlaXVCZlM3ejZ2bkNiVzcyN0pmVXNTZk1uSDZFSDhRazgraURCald5blI1?=
 =?utf-8?B?cVlYZ2llazI1bHg2RVJHS1RSd2Njckk0M3pqOUovYkRQc3ZKdEFYWldZYUps?=
 =?utf-8?B?OWhTclRRSFRkSStZVGRyOGplV09GYXJ0U2xQRjQ1WFI0M2ZPUERnb2NMT3B2?=
 =?utf-8?B?RCtjanAzcjRlQWFyRUFDVWpycGltQXljcFU5MTZONXNLWmlCS0ZyR1h0WlFV?=
 =?utf-8?B?Ri9yNVJwZG5CVk1aT1dSVVpOWXR0RmVFb0xGYUd2VUJReFhNL0JQMlp5dGxV?=
 =?utf-8?B?U051dXErQUdKbGhYSmhUZnZZTjlTMCtXeENGQXdLRzJhVk9kV3M4NzF5R1p2?=
 =?utf-8?B?blc3YXV6Zk9WTms2R21qd1pBQTRvb3NDS0pEOVRnckVOK0hkT1luNkFDdlJG?=
 =?utf-8?B?QXpsUE1wMW50TjIzWGpac1d0MGE4bytsK3ZPNVY0ZExaWEJCSUEyWUxVL3Nk?=
 =?utf-8?B?N3N4RFpGQjVPWGF1REN5MUtBRVhEZ3g0d2pSM28yazlPQWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 10:21:52.4732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0967e807-96d1-40d0-c0cd-08dcfe4cd512
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8425

Hi Miguel,

On 05.11.2024 12:23, Miguel Ojeda wrote:
> Hi Abdiel,
> 
> Some quick comments on the docs I noticed.
....
>> +    /// # fn dox(dev: &Device) -> Result<()> {
> 
> Can we avoid this, i.e. use the `# Ok::<(), ...>(())` approach instead?
> 
> I see we got another `dox()` function in `page.rs`, which I guess is
> where you got it from, but I think those should be cleaned up too,
> unless I am missing something.

Are we talking about something like [1]?

While reading this I was looking at something similar to get rid of some 
.unwrap(). Would something like [2] be acceptable as well?

Thanks

Dirk


[1]

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index fdac6c375fe46..5f0347f9cd548 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -57,9 +57,8 @@ impl Page {
      /// ```
      /// use kernel::page::Page;
      ///
-    /// # fn dox() -> Result<(), kernel::alloc::AllocError> {
      /// let page = Page::alloc_page(GFP_KERNEL)?;
-    /// # Ok(()) }
+    /// # Ok::<(), Error>(())
      /// ```
      ///
      /// Allocate memory for a page and zero its contents.
@@ -67,9 +66,8 @@ impl Page {
      /// ```
      /// use kernel::page::Page;
      ///
-    /// # fn dox() -> Result<(), kernel::alloc::AllocError> {
      /// let page = Page::alloc_page(GFP_KERNEL | __GFP_ZERO)?;
-    /// # Ok(()) }
+    /// # Ok::<(), Error>(())
      /// ```
      pub fn alloc_page(flags: Flags) -> Result<Self, AllocError> {
          // SAFETY: Depending on the value of `gfp_flags`, this call 
may sleep. Other than that, it


[2]

index c9919ba0b6836..ff249c98b53c3 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -390,7 +390,8 @@ macro_rules! stack_try_pin_init {
  ///     },
  /// });
  /// # initializer }
-/// # KBox::pin_init(demo(), GFP_KERNEL).unwrap();
+/// # KBox::pin_init(demo(), GFP_KERNEL)?;
+/// # Ok::<(), Error>(())
  /// ```
  ///
  /// Arbitrary Rust expressions can be used to set the value of a variable.
@@ -1076,8 +1077,9 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, 
E> {
  /// ```rust
  /// use kernel::{alloc::KBox, error::Error, init::init_array_from_fn};
  /// let array: KBox<[usize; 1_000]> =
-///     KBox::init::<Error>(init_array_from_fn(|i| i), 
GFP_KERNEL).unwrap();
+///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL)?;
  /// assert_eq!(array.len(), 1_000);
+/// # Ok::<(), Error>(())
  /// ```
  pub fn init_array_from_fn<I, const N: usize, T, E>(
      mut make_init: impl FnMut(usize) -> I,
@@ -1120,8 +1122,9 @@ pub fn init_array_from_fn<I, const N: usize, T, E>(
  /// ```rust
  /// use kernel::{sync::{Arc, Mutex}, init::pin_init_array_from_fn, 
new_mutex};
  /// let array: Arc<[Mutex<usize>; 1_000]> =
-///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), 
GFP_KERNEL).unwrap();
+///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), 
GFP_KERNEL)?;
  /// assert_eq!(array.len(), 1_000);
+/// # Ok::<(), Error>(())
  /// ```
  pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
      mut make_init: impl FnMut(usize) -> I,

