Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020128.outbound.protection.outlook.com [52.101.195.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECCC29992A;
	Mon,  3 Aug 2026 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771129; cv=fail; b=s6aEHo8IssEKUmwLabiHDyrdXZpqv5q7l9A9k4bZjuYA20+4yz30XaBPk5LGOCKFMsfzQPCR6zKAz1HbfB6J107P4PqoNf83jrQ0QncfZjmWW3Ph8IRzYL9qqFOigMt0HU5QcOI+GoannbEArxKFIkg1rA2t1eFdNRdjU/tePmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771129; c=relaxed/simple;
	bh=Jjsabtjm/n5Ovnm3BkOe656NSWJ7/VDIitOhhIGW+nw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SacUhCvoMcjqrcJKjO8TiXUgBlhLpbf3Ze/JgH3BwO9gOszSkVOmLo16ggD32CLGusdaEsV+UpDglh2j85lINEVmReGaOj1cL9n6AWD5Lew59XuP4z7WO4GSDHuCWPOh8qOqh6itsPI5/aRo7xWlUJh9+fFzCIaJW4p0fRJLw30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=IUGrojQl; arc=fail smtp.client-ip=52.101.195.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="IUGrojQl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5BThvqECrpWMDOEfI4qID46EeZ8O6jefiFa2pzGNuixSqPkSI/CbN1fvyYl62NJpDaxVz2EHB9jbuihvxvHeFGsyjEJaqkIZ/TR1sAkL8ixk90A1LBtWNCcmt0OQV2Gh3NvUS7IBBfzy0OtqST9nLXdL57KTojHpseBmYO3bHMbQ3Cd5eEUt+rxLtIy6V3jpoAJSLmSNQ/oXCwkAMcWc5NpMFHwImOhup9PUg881Lf9nnC+JgtvGcDNAnPswrrVdHjPn9WYKmD+IizTu63gAKJAISJcWazpwPkZfZ4/mpSfHB05kr1rcrTD6/NghpJGT5WTmmKHLUPGVD+G5dqcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snp168a0dHNGM+Ria7UuDY6cDICSVUogdQJeWkR8N4o=;
 b=eV4YYDLjyGBucXzVq7gP9kUeMoxzr4tGdBUvy0dCB06rTgnq08c8ZwlGUPlahfJ4l6tkZHMDw2N3Rpd/hiyEE73bJ0Py8jnCUFCCjIaEA6mWw13kSA0cezdNcOO1WUverMORycfzzKEcEBVLd+y4Yt0vrSDaVgcXTk1CfxDE7YHkm5uIk6KnZccA2MMaCoaCkIe9s/XR0FV03357dSjyoSFP0NOb4HhZqU4UIwOmM9+kBtUhh7DQ2FagoFvP/IuJmFVwdNsZ3aq1f9+RiA+LQ6FTSrrpxsuJkfiij5VoU3p7CcmaBTPbckiUZzF14ziew33zLO7tM624Bv4T53/l8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snp168a0dHNGM+Ria7UuDY6cDICSVUogdQJeWkR8N4o=;
 b=IUGrojQlXZARSNzHXrhgqlc6IafiEVDgWHrsqdYTp9WlBUYVgHzKDMvKdnW+XzDN6nyYEwyQrFxtnVugSZvnRJJscsHEXn2QUYV4ILatdhMyiUCCB2tGvfxwUFW4D4eDh4ytI3+e62v5Ha/wtGSytmtkpqNShFcZcAZps0J7SGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6121.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:27d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 15:32:03 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 15:32:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 16:32:02 +0100
Message-Id: <DKFF147BG8PR.I12RKSRFQS1B@garyguo.net>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Bert Karwatzki"
 <spasswolf@web.de>, "Harry Yoo" <harry@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: rust compile failure in next-20260730
From: "Gary Guo" <gary@garyguo.net>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260731122826.737703-1-spasswolf@web.de>
 <20260731192522.GA1014697@ax162> <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>
 <anCkbMyUIscmAheK@tardis.local>
 <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org>
In-Reply-To: <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org>
X-ClientProxiedBy: LO4P123CA0568.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::18) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfd2c6f-4e94-4d3f-c7fb-08def1745dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|23010399003|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vYmfYNn1KYyjDtiLYCUZAhlR5XpdYkhpdZctTE1kVL1R/prxYI6GVsW//CoIZT25opd4asBTtHAvogSNRHIo95yFiOPZvjxb3OWhDoSP8dqH6pwlwMpR6x0jvuo2UyDQEt+NMgzm3Xh1m55D1NbA+KAODyoiZmlcq4onmg72NFDCiZ8H7wTpb/WllO7iunMrp3eXcMvchgMs+9Xzx5D8WBl+iyU/iJi39rbpFEAoJT3NcssxUL56UtjWFLoBc/zR//ZQCdmK9+iz5dcgfzHdCsp9Ti/OUe0Q5DWnoIiGa77bYJVb9WicWjLr8Pd+2p9JgQpuLpagoERcHfgqNm0x/+WRB5UHCR/CxFnnrjA1peY4b51YNBwQqyOiVzD43RvkBizVHnzPsL2oVfrLvviB88EuS4O7Xz2bGNySVEogR6D9J+qzMbKuCWmHFpNH9Ucm87m5xGwPtUy5KqENZew/Jn6CB1ooMHm4R3sft8/UsgWPFdbJIt9AeBo9EPmDj3XtCTgXejsHSlhmLWVSwRDDJVxShsqlJhgbampna110kVC1Ksy768z5xnx5fs78mfDW4IoVxYI5BZ1pkWv2tu0JZ6FdZiTAaCXFkuG6Cws2PriFOEw/jDX7oIRThVQK9YqZk7BNzKgWwtjFRX+wD1R7SNhnSOJ/nv5C+XvEIIKWjfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(23010399003)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2JOZmpBeHM1U1NwTU8ybjUyR1pNOFdMU0pVUGNCN2loNDYxVkZWNkNReVZY?=
 =?utf-8?B?V05CWmJwa1hhaTVyQ2Y1N3JGOVBScGY5QzZtU1BacTdlRkNzTHZ0Smp3dHNa?=
 =?utf-8?B?Z0piYS9HTU1leCtyQjY0eXVNSzdSZkpURGsrMUlNQUhSemRIMmRwTitpdUxh?=
 =?utf-8?B?U1YxcG9lWXFtR3c5L1FUakhTU0NJb1ZFeTB4Q2s2ZFlsUXpaQUVpa252SFVK?=
 =?utf-8?B?S2lQaEJhUFFwN2lxUGxoYmlZNkY2aTNQaUVmLzFadktPRjFDdnJCQUNBTElv?=
 =?utf-8?B?UWRTZU1ZUUliem1oVG9HVkV4dDVMUWNLVnVveklkam5VdGE0bkxBTi9LTDJQ?=
 =?utf-8?B?WVVrQ3YxaFhRN2xFeEdob1hWd3hkTXptSjZWN1Q5Z3Z0dFNDU1g2bXMwRnM0?=
 =?utf-8?B?dEZGci9oZEJlYm1mcE5iNlYyWGVuUG5OcHU2dTNzd1RJZU5QRDNCeWNGdHhS?=
 =?utf-8?B?V1lzakgxZUdIWXY4a1hRdkxGRVpHYTFybUxlRUlSWTYxdm9sblRqaU5XYk5F?=
 =?utf-8?B?N3preVpSVjFZWUNTZnk5dElTcVd6QmUrY3Z3U1g4dXF0a2NaZmRrTmV1SCtT?=
 =?utf-8?B?RUJSbG80TnA1OEVUeXUwWWRnT05ZeWsyZk9YZEM2VnN5ZzlhY3pyQjdqOVV5?=
 =?utf-8?B?R0R1eWFyQ21xM3VvTkh2WG41SmRzektZa1hLNnpoYXNlbWtvbXNsVFFlaldH?=
 =?utf-8?B?ZW5Kc3BlZzFkWnZib3ZZZGlWaVZ1MkZIMFMrVTJUamtZdUsyTUJ3TFZrWTJX?=
 =?utf-8?B?ejVmd3JpWFkremo5WTRlODlyTTVvaTdOVm9kd3M2dHB1emRaQnBvRmVNdmRs?=
 =?utf-8?B?aHhObmZlVDAyNHFrUmZPQ3BNZnkrQ2FaMXkyZEdEM2hXUit5WklCSXdVM2xG?=
 =?utf-8?B?a3paamhEOVJ0V1JmVUZDY2hhQWdNcmEzZER4NlJGZGd1VjBldnFOS1FvYkxq?=
 =?utf-8?B?UjR4Q2EvVkF1azh1OC8yc2g4OXpKOWJvd0cyckNpVjVpa2VTc0NVTlE3cjNO?=
 =?utf-8?B?WWlFWEJSV2NPYzlNZkdjU0ZaTFA2eFJ6em05MEVRUitxclBWSXJ1Umc5WnhW?=
 =?utf-8?B?NjNlQUZMZG9NMktiWkM3bHZLMGVBTUs2VlFzb0ZzOE1GelNib2M5dEFzOVZU?=
 =?utf-8?B?bzdwYUcva3NUeGpRZmZpUm5VUXY2L0RWNVduU210a3ByR3d5QStCSFVCOEtk?=
 =?utf-8?B?Tk1zbGVBZUNpVi9nOE9kS25oQWFaSUtmY2NOZmVVUFVqRlJyWHViTURFVnNX?=
 =?utf-8?B?QVJ0MFlWWnBWNmdkMDJMQVREU2tBWFZaNU1XaFdSUkRKMDlTMk01Y3dmUUFP?=
 =?utf-8?B?R2NqVkJ5cjBUdGZaWjJVYkpzcVRPdU9Xb3FGS0gzeTRpb1N0T3dvRGd5dUhr?=
 =?utf-8?B?NVlQNStTOGFpOEw0cEdLTGpjRWpicGlMcmUvN0g5MURyVTQyUGNTMzlnMDRO?=
 =?utf-8?B?UmUrUWFJYnlUT0h1RTFESm90N00zeGErT001TCsxNGUxVkFMLzhPRTZWRnZz?=
 =?utf-8?B?VFVucEJwTVNxWVFTK2hicVJvRjdaMEYvTFZXemRWTm1rLzJEZ010UkVPek9Q?=
 =?utf-8?B?RXB2VFUrelUvN1puZlJLSk1EeG1MMU8zWTYrd3lwTWxZdW9ldkJrcjB1YmlS?=
 =?utf-8?B?Zzh2eWxBK2tDWFh0bGZuZEdXaVBCdjFUYnEvcm5Ja3p4NzIrTXE0VnhzNDBE?=
 =?utf-8?B?Yk9TdHRNRStvQStxZlg3KzFnUHJjVktpa1BZMjlRTVIzV0xmdzd0UGowc0Zl?=
 =?utf-8?B?dmVxVXZHdFpMYTMyams5SnNvdllnd3kvMS95czBTZ3I5Y2RLM2ZjRjVtb1lq?=
 =?utf-8?B?Y2ZGYVhwWUlpdFZNcW9QTUorS3R1ZnJ3RlBNdFBoazdNQldwMDJ2bmNIZGxN?=
 =?utf-8?B?UFNVS3IwdGdCdjE3cDhDUUI2Y2JCOThWNExpMjY2RGoxcjJqWXVFb3Z5MVkv?=
 =?utf-8?B?dW5NTTYzcU95cTNRZHNuNkF3TW5aeEgrZm1LSzhTdFlad3lVc2hydE1zczl4?=
 =?utf-8?B?NkdudFY4N3ZCOTJMbGlDRStYMVdGM2NJSHhuYWswekpFMzNzK2REUFQ5MkJV?=
 =?utf-8?B?S0FIR3Y3d0hETTh1TVhWR2xjNXVyTHpWdk9qSEk0a2hhNkRKU2YxV2ZGTEt6?=
 =?utf-8?B?U1JELytoUHhxY0lOVUp6WEsyMm44dWk3L2w5cUs4QjlLajdnL21xeFNLWGpz?=
 =?utf-8?B?MGZQN3lKT2p2cHJwVndpVXptaDBHSklLeGNzRk5VYXBXTWFhZjN1NGFsOENO?=
 =?utf-8?B?bGNSVDg1T2tqTjVQVjhndnludEkzZzJNejR4V3RNS0lTT1ZvYnRiTlRMTjFz?=
 =?utf-8?B?clRKVHJydFZoQi9MbE1RZmxCaGlmazl4SWN6QVFwWDUzT2hHZEQ3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfd2c6f-4e94-4d3f-c7fb-08def1745dea
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 15:32:02.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kmu12g5B4JBMhCPZgjcv5svOJk9P8AL4bM1C7zwtONkKam6mZW3i4Qlot8wrnrKFe2X671rc+4a4O1gzZu43HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6121

On Mon Aug 3, 2026 at 4:10 PM BST, Vlastimil Babka (SUSE) wrote:
> On 8/3/26 16:23, Boqun Feng wrote:
>> On Mon, Aug 03, 2026 at 02:57:49PM +0100, Gary Guo wrote:
>>>=20
>>> We could also unconditionally use `kvfree_rcu_head` here, and
>>> add
>>>=20
>>>     #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
>>>     pub type kvfree_rcu_head =3D callback_head;
>>>=20
>>> to bindings.rs?
>>>=20
>>=20
>> This option is currently not maintainable unless it becomes a
>> maintainer-aware way to handle things like this.
>>=20
>>> (Or even better, changing `#define` to `typedef` so bindgen takes care =
of
>>> everything).
>>>=20
>>=20
>> Yes, this is better IMO, but it's up to slab maintainers. :-)
>
> Can you elaborate a bit please, how would that look like?

I was thinking of doing `typedef struct rcu_head kvfree_rcu_head;` but of c=
ourse
that didn't work because you can't use typedef to create `kvfree_rcu_head` =
:)

However, something like this could work?

    #ifdef CONFIG_KVFREE_RCU_BATCHED
    ...
    #else
    struct kvfree_rcu_head {
        struct rcu_head head;
    };
    #endif

and everywhere add a cast everywhere that expects kvfree_rcu_head =3D=3D rc=
u_head.

but this would indeed be more complex :(

It's a bit unfortunate that C doesn't have a better way of doing struct typ=
e
aliases without doing textual replacement with macro.=20

Another approach is to have:

    #ifdef __BINDGEN__
    typedef struct rcu_head kvfree_rcu_head;
    #endif
    #define kvfree_rcu_head rcu_head

so bindgen can still see the typedef while it doesn't have effect for C use=
rs.
But this doesn't look perfect either.

Best,
Gary
