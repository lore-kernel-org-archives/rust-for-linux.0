Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020129.outbound.protection.outlook.com [52.101.195.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7C4E3225;
	Wed, 30 Sep 2026 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776913; cv=fail; b=mzJpeluY35phx8xx6pG5atJY42kAf9+Lx/+C4dGJuA9qBiLF0N+RvfRzMmKgQcaKCspkWvVNBtHf2HV1JJAdbSYQjfRbYntwpVwcca2rYSIHe0vv4EFOnkRJy7Qg09THrAqh6aEoX17CbS4XbUQwS50EuGsS3afUc/zG6yLH0Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776913; c=relaxed/simple;
	bh=4aLMJY4Jq1dTWeXaHS0ZHjF58uDKFH4kk1FzTTavAvQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=nxCAThapnVUnwUx+MwO6Aw5BSXtQ0SBBTzAvK8JT++/nlKJvt0l7Ujd7Cmq+rrOj9PsfEnXTUKjrYIIR3iTYaqIMgQC5l7/oAJlwjxAlUbOg/WOpR9CBan3EvSsLt+G7/pbqXfCHeZdAmhFYy2QAr1ULV7q9TJqT0HOOCXtq31Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=R7dVNJBs; arc=fail smtp.client-ip=52.101.195.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="R7dVNJBs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jS1LZZ0l+LpU/w1Y8jkhkXo+a6vrsl849e4uoXjpNQnNKjKV+1x72gplrZ25zVk1ZOP+rI4kkQ2zURgfQysswbVbasuLvL929lC8Mm4WCeEqhjQXOKn72yc1f0iusizLq2GMmn4CO1OkSnk5fCz1dJ0OChNBkDw7w0D7L5CVNYmj16tz4fQKqX0x6Dn5Hdf7Npf1erOnwsSOeBg5zc9NboQhheWvvEUEFeiNYX8w3HNOqgMB6l7nAPKaP8mO0ydkAxNFThaG6K0RPYrQfcGbUeUq3HnYt00DqksZ+Xx6bKOuW2bAT/ZjXgoRftLKzu6W4Ev+21y8/LKJzD31M1Iz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM7SaSx8hcpCzsyR4svAeYDoJWVyZ6rZqtMsE/5KoQM=;
 b=VTUIh+5VQe/xnVKcu1Ho8WjfAiUXLkl66RSWTL0wcB9qBQF8F9GVJZTz4jguaIE8RF02OSXbLBlYcSLVAjJ2T3dkCbyTeI663xP0kCty55in787wSdgAraIXy93mmxiD6trJdPXTPSvlLcGN//FRqgMw5ZvqY5YCthWnhW65qn02e2smcrdojiHJeaF/GzlRzEl79n7VO1o9w1Jtp6XnBI+udVjdCrvw8yWtV/dqL8v9+X0NPiD1V7KMn5maQ/exUYsJZIsEgphx4Onf2MkUGCbOErQxh/GhzovKCQFa4+ZG03s1VFOHdKpfupD3L+hiT6YjlH8Zb+Ic1S9/PJ31aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KM7SaSx8hcpCzsyR4svAeYDoJWVyZ6rZqtMsE/5KoQM=;
 b=R7dVNJBsYbfRHzHktN5llR0ukAWpP6SuXa24EM09fq6QJkFrGAbgalpMX6Pyb4JSP039zFv5PMBBmlfDpD+1GrreBkhJ85gj7CdQyQwfF0i+0iNu1AmPyK9a+Kv8Q0Ka0Q/9TE++iYHI8swkMwzvATTjw9poQTGYazWyeN4T+yU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB3510.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 14:01:42 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 14:01:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 15:01:41 +0100
Message-Id: <DLSPFJ7IF2XC.1KZBWTARDIG1I@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, "Peter Zijlstra" <peterz@infradead.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Waiman
 Long" <longman@redhat.com>, "Alice Ryhl" <aliceryhl@google.com>, "Lyude
 Paul" <lyude@redhat.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: sync: export lock::do_unlocked
From: "Gary Guo" <gary@garyguo.net>
To: "Boqun Feng" <boqun@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260929-export-do-unlocked-v3-1-f7000684178f@kernel.org>
 <N1IBV5ko8VdO1uPeg7myJ5jVnnfJI-s5phM0IuhjOxWo1AvKFtlvojnvOBY1fnhKJpl9GKVkN0dD6GEM3f1FKQ==@protonmail.internalid> <DLRXW31Y0IVK.3A3NJVS2BG39M@garyguo.net> <87zex0rl3r.fsf@t14s.mail-host-address-is-not-set> <ar0SaUYCeGvi2fTD@MacBook-0RXW5>
In-Reply-To: <ar0SaUYCeGvi2fTD@MacBook-0RXW5>
X-ClientProxiedBy: LO6P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB3510:EE_
X-MS-Office365-Filtering-Correlation-Id: db91fb54-1402-4e99-bc19-08df1efb5a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|10070799003|1800799024|10067099003|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9aUAK7Vbzzo8FBybGOUwHhfNEfFb6ynlkYyX14qYqH+3E0Xn87XzpZBu8v7R+5WD/9rGrNwwMuOT/kfpncepw3w1X2pSa0O/xihl4Rv2kb2w4NJ3rWh1uuwQbI++GnkBNUtxGiXK771OdVo1awtD+YYez8pWk7aesm+Tp9coMUUIksFnCQL2FssZrwzkW7XkFeTQzWWBASRgsgPzQRAgRHfh1sSZP8qASZG3mV4JAytMK9QLoXE2i9F332rZAmI7FgfpjDt7IYkAweQsIJclt3MZbg1BpS747DSU4SEPmeQlrXhF94/T3ivfb+Uihs0a/XnxWOHkEcf3kYtVrD0VgZXIJL4Bfn9xC8SVcWFr4ZcrC/YI8kHxjdFv5IvhIOs2FsKRUGMFxhVUokOEvaci5cSfs7BsJ11JJPX46burGMCDDK5dv9vqyw9HmpOYEg52viOkPiyypqj1vBTGeMIL5AwsanRY0a9AEuqmo2Nu5Bdlp+nRpdNb/67ez81qUZ/11MnqBSbJ7IKL1kFLSDXLMKyHZSd2o+xPrUEruqTO4I7EGIQsKWjcaSz9OvRgTOnS25QZCeefcXBN6whHn5U/pDNLHi141UDpO/dklHTRgDI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(10070799003)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzdMUU9hOG96S1lGVjUxejlpYTB2bUJWVTUxWDh1QXExaHQ0WmJuTi93SFZt?=
 =?utf-8?B?Tk9uTGsxejlmaDJTZC96TlhzUXk3NVBLTEpmTjdxcFMrR1l4OGdtMXp3S1ds?=
 =?utf-8?B?eGpWeXMvQ1M1NSthRklFQWJ5ZzVvTGl2OFBrSCtURmJBdlVTR2I3QjF0U1Rm?=
 =?utf-8?B?alpNVUp1eXFNcXhsb0NEOXo0Q1htWEJPalJ5MDlubUVOdkcxVTBLcTNaU05h?=
 =?utf-8?B?Z1kvMnIwL1I0b0ZaR1gvMUNVSXNRbVRuUk9oSVBZUFV0TFU4eHZiTTgwYVVS?=
 =?utf-8?B?TXljbHJsTHhXUWdjUUloYVVvTEVVYXloaUFWN2FiVE9pUHIxUm9EQ05aYU5B?=
 =?utf-8?B?QVBkTWFhQ2h3UVhaZkF2T3U5SEt5cHd2UVEvQUpWNHMxK2lOWWdaYi9pRjNn?=
 =?utf-8?B?NEtyeGw3c0wxWkYrbi9XZ0dVZHREV1B2WWlqdWZ0OG9wNEpCS292bUsrNHI0?=
 =?utf-8?B?K0xrUGY3eFc4ZlpOR2gzVUx4OHB2YUl0WGZEQ1RnbkNFRzV6aXBsY0dzdDdr?=
 =?utf-8?B?bk1zWjcvdW9Bc0l3L1Y5VG5EYnRKWjh4dkhqTjgzSFQxclZxV1BnMjFXenFi?=
 =?utf-8?B?MnFzSFN3OWg4Ry9tVUVNemZ0eDM3bW1Wd3E5aEIzSWxDVE9wQXZ6TEhRcXNa?=
 =?utf-8?B?MU9YbTcrNWRZa1VhRlhFWEY3OVRST29NNkQrNWFvMGlOTXpORkpBTi8vV2Jw?=
 =?utf-8?B?K1BlMU1DWFJueEM3WnNCZlFMV2tNc29qTmFtSk9ERXpSUWhkSm80Q3ZzczlU?=
 =?utf-8?B?N2FNUVNrelh2SFZhU2VaTGoxRjhyTFBERXBxS2k4V0p2Q0RRRzhFUzdpTWFo?=
 =?utf-8?B?ZkxsWDBPbVZXQ1d0N0RLMVRUc1Jjb3MxdlpCTWJUTDZBZWRuVEFVRTJLYmhq?=
 =?utf-8?B?amlubnNXSlJOYlh5RHlZb2RpOXRhbU1DTnVaMlI2UE84RmVTZXlrTVBvWmZK?=
 =?utf-8?B?cjdjVjNpbk93V2JtMEcxRHpIM1M4L0JYbzcxZUNVT1pMTmx3THdWNEZBRXYy?=
 =?utf-8?B?cW9wcjZ1SGJGMDZMcWxNVTNFSXBmYUJ5bmtKOTIyc3NiSFFmY2phVEV4aGtl?=
 =?utf-8?B?UStucnJzMnJrUlpsWWZVbkIxWXp2MVJzRWNGNEl4OVZPOGpBRWFJVnpMRlor?=
 =?utf-8?B?UmcvV0VhWW1rQnFuYndUd3VvejFRRDFsUEFVNGY3bGtYbi80ajBwUEVmNi9L?=
 =?utf-8?B?R1h3VjBKMjFVNDN4WmlJdFoybTFOamQxNTZZK0JTQVdIUnAyL3FkeGJtOFpl?=
 =?utf-8?B?NVNqSnRWWEpLc2xpZFJqWEhrZ3Nla2QxYjUxdkMvUDNhZ0E2d0xneUhaUmpY?=
 =?utf-8?B?R1c2alR1cXVBMWJET1BRL1VheWhjc2RMaFlyMUdIeVlMR2oyRGVkcldnTGJn?=
 =?utf-8?B?MjV0Wm93WDNjSHhqTi9reitndnVWQytnQ2VZYktMSG05VFp3anRzUmdRV1FS?=
 =?utf-8?B?Q3RjdThEcUlENWExQVhCYWlFeU56ekE3RDEzQVRxQkh3UHk2YUg2a0J5YmFB?=
 =?utf-8?B?ZktWQTJ1UUVPQjJsVURIZ2ZRclhEdVJ1eEs3YnluOFNIcDhVU01SODUzNU9z?=
 =?utf-8?B?bUJrbFdsRHJia21ZeFFiWjhyekszQ1M2QWpkck1PL2crbkpvc0NKWE5WK3lF?=
 =?utf-8?B?KzhydmdldC96OGJNbFY4a0MyWEF6OEhyOTIyV0ZtbjJFRll2Q2c2SXg2TXJR?=
 =?utf-8?B?UDBZeXFGUzRzRlRkby8yTXNka0l4L1BHWFhpS3JIdmRPblI0dUhsR1VGNndk?=
 =?utf-8?B?Ull2QmxyYVhQMnVndGxNWXhsRlV0T0dick44ZStvVHhpdHV5aU83aDN3Ujd3?=
 =?utf-8?B?dnhBRTdFZlVJNitHRTdCTWhZQktmT012YTV4Y3RHMjNwNjYrM212SFp2MWw2?=
 =?utf-8?B?MWdDVUlsN1hkalZxaUpwaDBaVnJPT3djSzhzdjFKaVlxTWRmb2lXalJub1Jl?=
 =?utf-8?B?aFI1dlNoT2pBT1d4b0tNMjJicEptd2lsNFVsdHVvblphZXdTYWlGd0VwMGZj?=
 =?utf-8?B?UjRlenpISTIrM3crOE5wVUhYaWtCUFI0Z0x2VnVBKzN2aTdnZHcxZENmSGJt?=
 =?utf-8?B?L09KcTMrZ2tqYWJvUE9XWjhaVGFTTXFCSGQ4VDBwQVViTjZyK1VGZU5PZGdQ?=
 =?utf-8?B?OUlpbFN3MXpKTzQrbG40dmQzbkZURkZsV21HcUQ1MlNwVlFxSVRZRFc2Q0I4?=
 =?utf-8?B?ZE14YW55U01oNUNza2pCVnVjU204Vkl3ODB1UGdLR291dDhWeUcxeG16N3l3?=
 =?utf-8?B?NGllTnh3UENHWmtnSFJKQ0Z3SG1ka1krdE1obXQycjRSNGRVZnJYckJqVllP?=
 =?utf-8?B?OUV6OEJXVk9ha3FjOHJtWFBrNHhDQytIcXVkcEJ1SXpHVHJWcWNKZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: db91fb54-1402-4e99-bc19-08df1efb5a83
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:01:41.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weqpV3MosF8J6B10Z8nLZdaM5AnuPrawkG8xTieA2dRoe9LX7uvAXy/dsqnwvVvOa/20H0AxyypDAalxC0eblQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3510

On Wed Sep 30, 2026 at 2:45 PM BST, Boqun Feng wrote:
> On Tue, Sep 29, 2026 at 08:03:20PM +0200, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>=20
>> > On Tue Sep 29, 2026 at 3:45 PM BST, Andreas Hindborg wrote:
>> >> Export lock::do_unlocked publicly. Add documentation for the method.
>> >>
>> >> Reviewed-by: Benno Lossin <lossin@kernel.org>
>> >> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> ---
>> >> Changes in v3:
>> >> - Rebase on v7.3-rc5.
>> >> - Do not import prelude in example (Alice).
>> >> - Link to v2: https://msgid.link/20260605-export-do-unlocked-v2-1-e23=
001390231@kernel.org
>> >>
>> >> Changes in v2:
>> >> - Drop spurious space before `guard.do_unlocked` in the doc example (=
Benno).
>> >> - Un-hide the imports in the doc example so the rendered docs no long=
er have a spurious blank line after them (Alice).
>> >> - Link to v1: https://msgid.link/20260215-export-do-unlocked-v1-1-f5c=
d2203b20f@kernel.org
>> >> ---
>> >>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
>> >>  1 file changed, 25 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
>> >> index 10b6b5e9b024..edfff9e10199 100644
>> >> --- a/rust/kernel/sync/lock.rs
>> >> +++ b/rust/kernel/sync/lock.rs
>> >> @@ -238,7 +238,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
>> >>          self.lock
>> >>      }
>> >>
>> >> -    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) =
-> U {
>> >> +    /// Temporarily unlock the lock to execute the given closure.
>> >> +    ///
>> >> +    /// This method unlocks the lock before calling the closure `cb`=
, and re-locks it afterwards.
>> >> +    /// This is useful when you need to perform operations that are =
not allowed while holding
>> >> +    /// certain locks, such as allocating memory (which is prohibite=
d while holding a spinlock).
>> >> +    ///
>> >> +    /// # Examples
>> >> +    ///
>> >> +    /// ```
>> >> +    /// use kernel::new_spinlock;
>> >> +    /// use pin_init::stack_pin_init;
>> >> +    ///
>> >> +    /// stack_pin_init!{
>> >> +    ///     let lock =3D new_spinlock!(())
>> >> +    /// }
>> >> +    ///
>> >> +    /// let mut guard =3D lock.lock();
>> >> +    /// let mut buffer =3D KVec::new();
>> >> +    /// // Temporarily unlock to allocate memory, which should not b=
e done while holding a spinlock.
>> >> +    /// guard.do_unlocked(|| {
>> >> +    ///     buffer.push(5u32, GFP_KERNEL)
>> >> +    /// })?;
>> >> +    /// # Ok::<(), Error>(())
>> >> +    /// ```
>> >> +    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
>> >
>> > Do we want to keep the name `do_unlocked` now this is public?
>> >
>> > I think we can drop "do_" and just call this `unlocked`, consistent wi=
th popular
>> > Rust ecosystem crates like parking_lot and spin.
>>=20
>
> I didn't find a unlocked() in spin. You mean
> https://crates.io/crates/lock_api ?

Right, both of them share the common interface via lock_api.

> To me, `do_unlocked()` is better, since it indicates something is going
> to be done after the lock being dropped.

I think that indication is usually "with". So `guard.with_unlocked(|| actio=
n)`.

From my experience in Rust code "do_" is quite commonly the internal helper=
 for
a public API.

Best,
Gary

