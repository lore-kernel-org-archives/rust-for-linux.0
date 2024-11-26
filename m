Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E817E00F
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612063; cv=fail; b=lfBUtVD4ewyNz3AsWxeTGIbOK3Fp0y1g1XCerKqyzhv1yqs176uuStqHqzPdsYKarI0vK/SZ7aSE/4iRg+i3Qzrq6FwzN5QZwypTp74zZV04WIhBCGZqVn5SKC+vzZR4XTzUqh6MsN+BTP3wu84hkAjBt9bZp9VLOsoqTYZop/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612063; c=relaxed/simple;
	bh=xpKF13RsXa8uw5rE0pLPrLtlj6Vqvjf6CoffcPgHehM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=Vz4PwE/QTuuOUk5JStjcESutV3vVVPSZ3MUvMY5nIsnVTjTr2MdiVex/Ena0aEiOA9X0/Ya4shx4RYO7/N2GUDtutzI5DIooHjRT4InnygtIXCwsggtBhicBspvtqyyEbJDNMmzTMj2FgR25VH9MbwjtPnrxuYFRiJb0QY7JEKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk; spf=pass smtp.mailfrom=prevas.dk; dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b=YIUfVxTk; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prevas.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b="YIUfVxTk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIO7yZ8D5ORchoVfa61BTN6ElF/clfrmrYiws2a+idMIjIKUBq5EK/42gnXVbwgyUPVqrJ7MeiKgIGhlVpvzbkmkZKmg8Sf24G/J0t6JyegxC2zDKx5Dp3PrWQoXmWYJhFkOqSPkNSxHfrQh2rDYWhoT0mapvpYQOCrs8NGYmcIovEG4S1AV5t5tl2UN16N5LF7SiHYXISWHKf8qdZVdfqpqspuRrTu8IYUpu3B/0EqA/60kRK1+dyDs8bvKX1oNYrg7ktmNJnCfHxc/EojyLEkg+Tc64oHleBjH/y8aXnxjriqA0zL8u8HNeV/n3LS8opiu/UbtG24pYmuA/OwDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Mjq4VJObhee4M8pOJKSytg/14wJspGDwZgMsmfiTlo=;
 b=EkCdmuVG90PhJV/CGbdMJVF0ulh4aVspK526rCsefAkuCq5TFZjTftVHWSnWfTGWULMLlxIJJi4wAFJwpVEA83kYhY346OijHfAwtz4JzPOc7zpTrwOGIRXYeX2wak2cQioK3vfYmRNji3fsIfDq+YdVMHUSWU3RCH0hRZLqalNMK95KAZMrwtM9LnuhFCppPVXt+56CNedKMjV69LcsY4llE5OpImuYfE6lUNBH+cPOuj8VQ6nB2wH3veQELH9D9WKE84oYUASNc0oi46viTm/FG9uWHFPICa9YLAXuYrGObKiDvvv851v0/A6fCWnCuYFzqOv1e1YEQIapQ1zGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Mjq4VJObhee4M8pOJKSytg/14wJspGDwZgMsmfiTlo=;
 b=YIUfVxTkG/5ssHmtPBk6/x+eiSXRfmmFgufvXIud+5sOcUalzmueMSRoh8CkMkJ1kBkD8TtxvoF3j+v2o2aJLBTI0RCftGDBmQjP9Edtce06U0Q8yuvq6CjLmoY/4xjTGMu0kQit3TSbLeQbtTlrxmbVurOmMtb7cvzuEltLAHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by GV1PR10MB8736.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Tue, 26 Nov
 2024 09:07:33 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 09:07:32 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: add safety comment in rust_fmt_argument
In-Reply-To: <caEePXpz3dyKABs5ReUO5NGlpbqf98_Aw_8tz9ADE6c1c8hYp523uGk7l9EcfSD0u-YLtozTD4wwgLEytbzzm6gnd3r6jQeXqr0Fo3YEYtM=@mandragore.io>
	(Konstantin Andrikopoulos's message of "Sat, 23 Nov 2024 21:56:46
	+0000")
References: <20241118031225.38080-1-kernel@mandragore.io>
	<87ed34ly80.fsf@prevas.dk>
	<caEePXpz3dyKABs5ReUO5NGlpbqf98_Aw_8tz9ADE6c1c8hYp523uGk7l9EcfSD0u-YLtozTD4wwgLEytbzzm6gnd3r6jQeXqr0Fo3YEYtM=@mandragore.io>
Date: Tue, 26 Nov 2024 10:07:30 +0100
Message-ID: <87y116icrx.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0058.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::25) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|GV1PR10MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d99ae1f-5d0a-4c35-91a5-08dd0df9c2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gxLwU4XRhmGdFjnIpDSWXplyQRH+EGq2qFzU8U3NQs47aivf7Ii4M8zVW04e?=
 =?us-ascii?Q?jiPrafgYdHv1MoFwyKAbyjEy1dub3WUpTjDn9tGmVSAKM5jsYzxpMhk3q1cC?=
 =?us-ascii?Q?9cAgJUF4b3r2QuhNL0W6kph/UGoel9GAAocEyPxTgDr4LBjM+p0LvNxAIALn?=
 =?us-ascii?Q?H2VbfPnGpfCV9twpHxW4N0GR10GXKg1zphT3SM1o++pF/eNpMVspqsz1w695?=
 =?us-ascii?Q?ZTpNmr7NkfCEJQa0fBiETbre3FZ7WVMkklZUd/C14YUCgU5UxCM9ZJ+KcHY5?=
 =?us-ascii?Q?xjtkpeXwQADfnsHmnEFaGeHA4UKwkZL21FDTSSNbszwR5B8aQnKaED80QrH9?=
 =?us-ascii?Q?hyQAV137qaede8Qa0QpMpVSNQryUPNt+P1rTrmYuf2bStQG2KyXHuRHUsvWd?=
 =?us-ascii?Q?nN3d4PcGsRnkcK1xxTuGVGk3RJ6jffFGRxcc3+u+bSfD2eZkEz4GK231Yjpf?=
 =?us-ascii?Q?05eNrzZazcNcQzD0VeBIvluhg93WStR0BpUONGbW6IDg+BA9wBU/JdjOzobZ?=
 =?us-ascii?Q?jLAidodWRlQzlzbrsvQvU4MFicyF76ZTn8KDGuJGIv2fP4TBxnadSAj416XB?=
 =?us-ascii?Q?DXrBDyNq9eySf6toZ1MUq+YULUj6BGXk3Wv/Ol62sEKu8OyY1CgeYy0FKWrV?=
 =?us-ascii?Q?vRLauB6C6jSB9g+QGf83xLPGi7BdI4KV7fcIVgQw8YPWhklF6Zow/SizKVlV?=
 =?us-ascii?Q?Xe7U3UtCpQ/s7DQT3E2KM/ecqH3tItR4d7SVsEWMYRIcU309VylC2hXOSExT?=
 =?us-ascii?Q?FgcnXpwir5pDS6rc2S3HuWzm6amQ5N76mJysIVuobh0c77gu5ovoVxeRxtCq?=
 =?us-ascii?Q?K5MwlobxHJol+ehdPdYlMBZX+2KH+DlxM9lO6uzs6wOzGHbllLXgEQVewsKD?=
 =?us-ascii?Q?2Y5MG80J3vRb/ruCGNTSBlI2w56F8R962KrqmTA3aAhHKULNnRNb5ctJouxc?=
 =?us-ascii?Q?H0Zj2RL38fiO180aCgW/X2pbpU0wZvMFyyVCBiP1qweShIhrUG3u7NsQJbMt?=
 =?us-ascii?Q?Y7xdaIYXaQpX4T3dyh3M1OoUd+2wp2xlCY9rDzxPW/2VLrwWV7OgfZVRCLTN?=
 =?us-ascii?Q?62p45NMjPkYkf3cBibPi4+KeVOJUDe7dUMwSCfuuVEq9HDVDFHX1cEvl+QFV?=
 =?us-ascii?Q?89+q9+60XT5yAUDkJemrL9XFYYxweMMcTeTkKCbgyM4MbFAyZ3/Og0B1kU+X?=
 =?us-ascii?Q?2CVptfqvbMM95Nq03TSyXFZ34tv1NiUFZE9Mt/rujMMA3tapoJuDJN9Tffu3?=
 =?us-ascii?Q?MWatdnJq4mp04nVEmXtpl/1riO+lpo1Oyj+HKlrrolDEv3BUTKAg3B5e+VXJ?=
 =?us-ascii?Q?rAdPwIKut8LwbUnL6Kq38czjf0eXYEnvijS604jh1sw/c0ft19+Hu6+yCUBL?=
 =?us-ascii?Q?3SLlW959Sb2fjN7bocYgme3fx/nB6rDH+xKLSBShmIy4iQfVaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mzmp56u3msH4J6RzXqg3p+55q9b3k5Dp3z/s9etg1gspILgAv9Y3qjGer8JP?=
 =?us-ascii?Q?32fcpGyduS2b1JkmuX5pma+c3jByb4lAOc6pZCjVMkbKhrCdnl3jQZFZDAwc?=
 =?us-ascii?Q?bh1qN3LKHD8k+DQsaeXsmpn/KSpnRlO6FGh5h23zyyOSYyyV6ZaNyeGXSiQd?=
 =?us-ascii?Q?qGjKYv54xMmekMy9BJXgqhUBlSlJYNZz1noIfWYn4hWPnpYHCLSIXJl0Xb/S?=
 =?us-ascii?Q?gVsQppWMyWVTyDX8B/1KmlocaS7rdjI9b6T90tIdDQSL4+SCXvIbkUz4WNi5?=
 =?us-ascii?Q?DYSSPqCIsXcas9LN18Gk98bklDtorKQvvP21JQaObkMljOWdnqDRmPvd2Tu5?=
 =?us-ascii?Q?yAFOejgvdwNtU9pGemtEuVd6n0KjR5wDYb6mQAoXMk246wIC5Hf74/mBq8Tw?=
 =?us-ascii?Q?ebU4Sb8ovH9Y0mPprIXYDAx4QeJz54kllRxH4dTNEx8bL5SCO706oerw15rp?=
 =?us-ascii?Q?QQDhbPQJ5xu41KkXxo/eP3aPtETG+1kWi8l3AogvIg2GHezGg36VkXGYCMMx?=
 =?us-ascii?Q?VFXYhSVO/Bl8m4O+4peRTzKKEq6a25UtbrFirOV0PkkIkgI7uyfrSANEiNyn?=
 =?us-ascii?Q?vk4v4O7P0zhdDvm7/x3EL2C4Td1jC/9zBklMSkPnfjgzmG+2Uh0VvUormlXs?=
 =?us-ascii?Q?wLfSNULFMdwr7h6wWq5tIaAQIwxxzGxifnq6O8nn+N4cbnE9PlQhLNXDdN8i?=
 =?us-ascii?Q?6F0Ckr0TnT5p9JjOpCA8pcOIodG89XnZnn6A65XBteYu0pnKjyxmn9zFnSXm?=
 =?us-ascii?Q?j3ATtYck86U8EQDRbAhMmTl91XDuVcWBWfGGku0DklecBxBXLUpcSWo2lJjl?=
 =?us-ascii?Q?qYx+3P5Ua/0EzSxa/krqyG2NJNXz5wD3F0TuqSr+H9gEEGBZXJnP4uJ+phlC?=
 =?us-ascii?Q?1uiDkGAmn8zV3tvY5tTke9CFXbM+ceIZh+fALZdVhXZOgbi8eL2JKECAD65Y?=
 =?us-ascii?Q?tPS1RSqMfiJX3t1e6hjNfBKWB/Id+ZZisn27lXfOGRcmBryaScDG7PIa/2/q?=
 =?us-ascii?Q?1THxNcVh05EKjafXxMyFKq6vdj8I7TQk+H3Acv8+2zCUf4VkLRizTu6Iaica?=
 =?us-ascii?Q?MVpu4EUtzMWfd1lH8EmBScoHhsdkMTK+nz+xhpHPEFZeU62GynszzBtqW96s?=
 =?us-ascii?Q?onN/9INtbPbpO2CDP7wrghC8CQNwkoUH5VXd04AhMOlpDo7pzd5bzWoGqpuo?=
 =?us-ascii?Q?Vr/J3x0bBB2Fm5YQDXx+F3CRdfSHHgDQgCAgeUFAjRRKhT1lzSeaQUusYVCw?=
 =?us-ascii?Q?WlkwEn3YOiwnmdfCk1AWEgqCVK6fRnE/PG7rytNmAIqh0XeQFv9o4rwUeqS+?=
 =?us-ascii?Q?QJDrp78zRLraKRhs/+DMLzBFG5yhkUl3fEK2B7MhRPFUEYdugBbFw4AbdQni?=
 =?us-ascii?Q?JM7c/65X2APE9cPfLSPPAQDzXn4cCZ1DQAjfay6CpejJxQkHuDIdmRbUFoxu?=
 =?us-ascii?Q?QDX7GuhpOW+EvjnyctB433Cl4Xfe+Tao+rAeOr21xetQ+WqNLaAWbUiO12Ty?=
 =?us-ascii?Q?93EG42/f5s/ZtdeqZ4FTW8zf9zHTEmiUbplGIUOSNpMeZ5Mf0AMLQ5dWMAWS?=
 =?us-ascii?Q?+FGX5YZAl8ilQ3AkGAY2n8eGnh/LyiF4TJ+eiwhgyXAz8F7BKAT5Wi+yJ/Y7?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d99ae1f-5d0a-4c35-91a5-08dd0df9c2fc
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 09:07:32.8093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5RhINWQtHRk4CXceWwe6Y5U/nfXqnc4slZgJg19UOmcXm2Vet5ZMGKJxUA8Qg1Ip6VZI1of2MEuAhvWwFDkJPbCG+RCxyugQYSbVXJXJCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8736

On Sat, Nov 23 2024, Konstantin Andrikopoulos <kernel@mandragore.io> wrote:

> On Thursday, November 21st, 2024 at 10:42 AM, Rasmus Villemoes <ravi@prevas.dk> wrote:
>
>> Nit: The file implementing this is vsprintf.c, but the actual workhorse
>> is vsnprintf() (note the n); all other *printf() variants are wrappers
>> around that, and I'm pretty sure no code path called from Rust ends up
>> passing through sprintf() or vsprintf(). Yes, I see that the original
>> code said vsprintf, but please fix while here.
>>
>
> Thanks for the comments! Going through the code again, I see that
> rust_fmt_argument is directly called from the pointer function in vsprintf.c
>
> But pointer is not only called from vsnprintf. It is also called in
> vbin_printf and bstr_printf. Should this be reflected in rust_fmt_argument's
> documentation, or are these functions unreachable from rust code?

As for the latter, I think they are used by the tracing code, so
probably they are or will be reachable from rust (Alice?). 

> Perhaps the docs should just mention pointer()? Maybe the original comment
> used "vsprintf" to refer collectively to all these functions?

That's certainly possible, I didn't think about that possibility. If so,
my comments should be ignored :)

The occurrence of vsprintf that triggered me was

  `vsprintf` guarantees that `buf` and `end` will uphold their
  requirements.

because while this could perhaps be read as
vsprintf-the-translation-unit, vsprintf-the-function blindly assumes
that its caller has passed a large enough buffer and fakes a len
argument of INT_MAX to vsnprintf().

So I dunno. If the intention is to refer to vsprintf.c as a whole,
perhaps it would be better to actually include that .c extension when
referring to it, to avoid the ambiguity.

Rasmus
