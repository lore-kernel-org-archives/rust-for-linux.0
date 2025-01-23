Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2088.outbound.protection.outlook.com [40.107.104.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222EA1BC3F
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625181; cv=fail; b=Im4TJDKymyI/+zLwaVO4N7n4xYBQGHrFcHtBv24luLHQ6/1ioF4wz1lnC3EYf195GtWV1mobzrn6siKvdcWQKzLMd4/5VTid78HHI8Tx/p+7Sq/3Q0UnF7Cxhcy93i0GsOV3iC/ukkY1UrDryXKgo/z4bBZnqzN6AgPah37khls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625181; c=relaxed/simple;
	bh=2nJk2ATb2homVkCIYT7vyywZ/+jX6pEJjGfkliG0lTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bWPUQuBnLeWyh+mW9J3rERWOlAMqYRdxndVJiYjvkxQpyRakMUvZpgYmLrxtW+62BmE5Dwn59d7UEBDnn4Q4J/wZko7yqdn9fw4qRyT3tH3U3bn+vlxGp2xkHJ2qSKo+u1L4nfWeo6DYDQ/VwBd6/qGzLQCgX/1Ej7e/GhJK7nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=grsNAxlf; arc=fail smtp.client-ip=40.107.104.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="grsNAxlf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZY1olsVbLV/5j4rJaqnCMKLppnUXbPrHxqKHtTXbtp2sZGuQc4pa309l1jyWPPYPiWf+mqeR25Rx9Kafy3W5t9ypKgacCgj7/VVmhj9bFigjaramMpxdb7SNI3+tDwhRg79jiSVHrzkkPsr59iClM3+a0J3+24NFs2pApbgTjLmehRe86pRMbpYyBe/i9qDVBswq8C2E7BrQfKhfwH5BguI5CebovswtKgDTwL+JUYoBjvirywzpSEheVxO69Iuc3MIWCRF6yN1qESU3LIGIpOjwkQET8aJrCyz2c7zFuIbV4zk2VoUVWftAFf8lBYhM/Yn/TS9RDrx1dr1uW0pjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RT99tGE0pnY6/ETt/RSpIFRVFcYGRLszLk5oiRsN/w=;
 b=lF6g2FkovjqMdcAubbAED3Stz79v4jkSoYGmufDupjxv4u4aZeU5L4ypAxye/TmKZGy4pZ5Vedpb4HDwj+tdlfqWWSpskoze03CPdBstqnAuosHHgzlFc4u7wBFbSgnUsXHgpE1s9/jqUhmwOJh8ua2w+zyHvKgcnaBBqdP4pP33Ms06lKfJtnRI6r3HJT2sRvKQCfWla+5v7L1t1DxYvH9njZ2vTKjkuEOChc7GDWpc0RlaL7HwOmgiUaYy0VOJzU0zwVDrH1Gqsw91i7boJ853DHC5oQ2LPzJhGXeIM5wXuuWyGE0Nhf2RTunFmx+0HmOmfpuLaF2oJAUmeG0h7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RT99tGE0pnY6/ETt/RSpIFRVFcYGRLszLk5oiRsN/w=;
 b=grsNAxlfVNmr4D/Lip/jvG/N6lBhLEHmmxaFSIjmo0mD386TLAIDrcFeVIayPlAGGEzHTZk9irAWWEJ2vSNYjSxGDzUNf2yyeI6MOEB6c9GPA6Xdnv5VRz4mRbIb2Rel8865wEHoH/YsMTbarTBJyfcRMZ5rvlStR8ot/Md1hIBFqmnudglN+GmkfzXifTDhLqAIl0SOXOS6mhZomP5SBkM8lVBkjcwc7gKRsIRqZLAmkl+xgpzDdn3/yn/ty3d6s7FGqlhyyV3si3k2ZmcS4mN9BiYbMz/NZoJLe2T96yxCVLuM0QEoaTIoqTbtVHTeor3uR0FLHBlV6ILcagQBYg==
Received: from AM6PR08CA0004.eurprd08.prod.outlook.com (2603:10a6:20b:b2::16)
 by DB8PR10MB3321.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 09:39:35 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:b2:cafe::fa) by AM6PR08CA0004.outlook.office365.com
 (2603:10a6:20b:b2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.18 via Frontend Transport; Thu,
 23 Jan 2025 09:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 09:39:35 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 23 Jan
 2025 10:39:18 +0100
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Thu, 23 Jan
 2025 10:39:18 +0100
Message-ID: <71894c34-7b30-47e5-9e3c-659f8a94f2b4@de.bosch.com>
Date: Thu, 23 Jan 2025 10:39:17 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH] rust: types: extend `Opaque` documentation
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>,
	<aliceryhl@google.com>, <daniel.almeida@collabora.com>, <gary@garyguo.net>,
	<boqun.feng@gmail.com>
References: <20250122055347.597798-1-dirk.behme@de.bosch.com>
 <CANiq72=o1ouGc4ScvDkz_uMnEfM+D47YQTMh0jTC=Go4tvQvkg@mail.gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <CANiq72=o1ouGc4ScvDkz_uMnEfM+D47YQTMh0jTC=Go4tvQvkg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|DB8PR10MB3321:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc67ce7-08b2-452a-4d98-08dd3b91d90d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWV4MTBhOFlCRkNXZ2oybm5GZGRtbDkrRWlqSkJHQXZkQnR2SGhlanNJUGFn?=
 =?utf-8?B?aFphN2g0WEp0Q0o5Q09KNWtTYXB4Rklmc2FKdFlvOVY0Tlg0bW1nQ0JOcEZB?=
 =?utf-8?B?bC9KVmdsbjMxOXAxWE1GNkNPamxBdG85bGZmamxySFRhNHBneFE1M0FiWkN1?=
 =?utf-8?B?V0ZBQUtOOUgvWldTMkNyZUVwUDZ2bm9rU256M2FwWEVjZUZTT1daQ3VCMVhL?=
 =?utf-8?B?eUpQRC9JOXJ4KzFtd21GLzhSUUdFS1BrQUtXKzBXa2l0NkIrN3A0R1VDN2RC?=
 =?utf-8?B?OVMzM0RYTzJ4Vnc5V3cyZzJ6aEdxbnNLUkJrcENkdXlJTWFJbEFzTzAybnN2?=
 =?utf-8?B?OFBoclBYS1N4dXhjbmNhOHpWZFR0RndwbWU5Mm5mRWhRcWdqZmh2YnUzM3cz?=
 =?utf-8?B?VDNWYlpkZUxzbThvbnN2eTRteFlyakU0a3pzVXlrQ2J2WjRSVEtiaVF5bFVF?=
 =?utf-8?B?VWtlZVZqREd2dmJHdnNzRVNkNElZclJVMm13by9xeE02OURKcjU3R3B2Ujcv?=
 =?utf-8?B?WTYwRSt6NEtmYndOcTVPTFJhaUFTZ01oajVqRXBac0s0a1FVdTR2ZlFkcDFo?=
 =?utf-8?B?WUZrWk43VUMydThqZDRpNDJNWHJ4UHZQSUhnYjVZRmpHNWxoSkh6cXVMV2lS?=
 =?utf-8?B?eFlaZEhNcW9qQUZvaEdGQy9MSVVZZHhYTWU3Y0Q2Y1lCWlU1SzRDZnEwYVdX?=
 =?utf-8?B?L2M4OXlCTXhiMWZVN1Ixc0Y4ZGdZRDR2ZVpPZUxnMm9aOEw0Ym9aWkFPZHpI?=
 =?utf-8?B?Ym5mQ1RUT25sQ1VvcUNWRHc4bHN1T3QweGI2RnRpaGJjMzE1ckZJL2VLc1ZH?=
 =?utf-8?B?QVdPZlJIbTBkTkN4K2dQNHlxTkpHcVRCTUJ4ZXBGTFB3U28yZTRTUitmRTRv?=
 =?utf-8?B?Q3A5ekZwOGwyME1GYnU2Vm84bHIvTjBaNDFYK0R6MUhqdVFQd2YvU2dxV25L?=
 =?utf-8?B?YWZBTmRmNnQwV1grZHJaWW9QS1lPaGJvYWY2UnVrUy80YUlJNkFLVlZBU2V3?=
 =?utf-8?B?WHA3MWZxbWFQc1BLaWgyZ1AwaFp1d3ZFZjlVNnhNRExqTUxLYkh6QzdPaStq?=
 =?utf-8?B?a2dsMDh4d1RTMEt4eFJnYjg1bmVmREZXaC9TUk10bWh4ZXNFeWJWWWw2VUNP?=
 =?utf-8?B?N3doa21qbHBFYWpkQ2R0UWRHdndTa3RrN2p6U1d4ZzFCZ2ZYTkRIRm85VkNj?=
 =?utf-8?B?MU00aE1uSEdQME91RFc5VFVZeFpqazJ1TFVGSTNtZENvYXZ0c3dDeGRmdGFF?=
 =?utf-8?B?NG8vTjFnVWZIN2tmRXZHcUFXNWpxa2FVY21WdkJzR3ZBa2RHNjI5NmtZY0dE?=
 =?utf-8?B?SXhwcjR3MzZjMDRtM1I4bkQ1SjF1SDF0NVA5ZmFKUjc5cWd2Z2crUXVSWDFt?=
 =?utf-8?B?Zk9NUEJlcjFzbnpHSHJFbnBXSGtqWm5ZcC9sOFFCb2xGT095TWlQRmZLdjJM?=
 =?utf-8?B?T2lWbmFhUi9ROUhUblhSK0ROM1kzaUh1elFZTVRPQm5wSXY1WE1ORkZCSzFV?=
 =?utf-8?B?U0ExK1A3MjdlOW9pN2JLenJsWTdObSsrZUFGQmNuQjkwSFAxNWFVL0tQWjUx?=
 =?utf-8?B?STNIam1jcll5TTFTa2V4ZEZBdXRvR1N5V00yc1lJejVRdVovV2NqUURBbm5M?=
 =?utf-8?B?TUhCbVZqUDRBNVAzR0p6clBhaXVnc1dxdm5oSXByRFo5ZitsS0VrVGtld09Y?=
 =?utf-8?B?VEErWGN4V1lqdjZIZmNrYVRQNW0wOGZmRE9vS3MvSHpJWG53VmVNdHN5alFM?=
 =?utf-8?B?dE9GQlB0YVZrQ1NrU1FFc1ZYaHZ0YzdFT0pmRTg3Ulg3SGtPWVNIT01paDJz?=
 =?utf-8?B?VlJ3M2cxTXRKV3NMRlo2UEZreHBNUit3WFMxMFVNa3NhWm5mL1NHak9xSmhI?=
 =?utf-8?B?SzhIVENPZzBTWVBaTHpGeDljU3AwMVEyRlArTnVvR3F5elhPVW8wNExNUlg1?=
 =?utf-8?B?YmdIOWhVb0pKeDZrbVNmbEEyclpiOE1XTm5NZE8zWmZXSEY3VE9RaXRnQWlN?=
 =?utf-8?Q?I460RHJA2Zr/hH0m0iHpRbPUVXhDPA=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 09:39:35.3677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc67ce7-08b2-452a-4d98-08dd3b91d90d
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3321

On 22/01/2025 10:41, Miguel Ojeda wrote:
> On Wed, Jan 22, 2025 at 6:54 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>
>> This is marked as RFC as it mainly takes some statements from
>> the linked discussion. Let us take this as a starting point
>> to discuss how we want to extend the `Opaque` documentation.
> 
> Thanks Dirk for this sort of patch -- I think it is important to lift
> some comments from the mailing list and distill them into
> documentation as time permits, so thanks.
> 
> The docs already list the requirements that `Opaque` lifts. What we
> could do, perhaps, is expand each bullet point on that list to mention
> e.g. how that is done and link to the relevant docs.
> 
> To try to explain what I mean, for instance, in the bullet point:
> 
>     * The value is allowed to be uninitialized (for example have
> invalid bit patterns: `3` for a [`bool`]).
> 
> perhaps we could add some of what you wrote here, or simply mention
> and link to `MaybeUninit`'s relevant docs on it.
> 
> The destruction part of the paragraph could also be there in that
> bullet point as another paragraph, or could be kept at the end of the
> docs as a separate note to highlight it a bit more, e.g.
> 
>     Note that the destructor of [`Opaque<T>`] does _not_ run the destructor
>     of `T`, as `T` may be uninitialized, as described above.

Thanks!

Next proposal [1] (with some `Opaque<T>` -> [`Opaque<T>`] replacements).

Cheers

Dirk

[1]

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 994e504ca9075..60c5f6b9f402d 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -226,22 +226,27 @@ fn drop(&mut self) {

 /// Stores an opaque value.
 ///
-/// `Opaque<T>` is meant to be used with FFI objects that are never
interpreted by Rust code.
+/// [`Opaque<T>`] is meant to be used with FFI objects that are never
interpreted by Rust code.
 ///
 /// It is used to wrap structs from the C side, like for example
`Opaque<bindings::mutex>`.
-/// It gets rid of all the usual assumptions that Rust has for a value:
-///
-/// * The value is allowed to be uninitialized (for example have
invalid bit patterns: `3` for a
-///   [`bool`]).
-/// * The value is allowed to be mutated, when a `&Opaque<T>` exists on
the Rust side.
+/// This is useful for C structs that are not fully initialized (yet)
or might change their
+/// content from C side at runtime. [`Opaque<T>`] gets rid of all the
usual assumptions that
+/// Rust has for a value of type `T`:
+///
+/// * `T` is allowed to be uninitialized or invalid (for example have
invalid bit patterns:
+///   `3` for a [`bool`]). By dereferencing a raw pointer to `T` you
are unsafely asserting
+///    that `T` is valid *right now*.
+/// * `T` is allowed to be mutated, when a `&Opaque<T>` exists on the
Rust side.
 /// * No uniqueness for mutable references: it is fine to have multiple
`&mut Opaque<T>` point to
 ///   the same value.
-/// * The value is not allowed to be shared with other threads (i.e. it
is `!Sync`).
+/// * `T` is not allowed to be shared with other threads (i.e. it is
`!Sync`).
+/// * The destructor of [`Opaque<T>`] does *not* run the destructor of
`T`, as `T` may
+///   be uninitialized, as described above.
 ///
 /// This has to be used for all values that the C side has access to,
because it can't be ensured
 /// that the C side is adhering to the usual constraints that Rust needs.
 ///
-/// Using `Opaque<T>` allows to continue to use references on the Rust
side even for values shared
+/// Using [`Opaque<T>`] allows to continue to use references on the
Rust side even for values shared
 /// with C.
 ///
 /// # Examples
