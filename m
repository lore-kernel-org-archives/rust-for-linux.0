Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020073.outbound.protection.outlook.com [52.101.195.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB32337BBF;
	Fri, 27 Feb 2026 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195071; cv=fail; b=ozd9BAwYSxtv3TiaXX4pQL/nENjvI5ofye3Pk21AFdguuoAovSxT21bXjoz/SdOf0oLzheia7p8DFow5WnQwWteigoTj1OeItWkw+R/OtzL1uDnu2EoRJsFPG5gUci1NScsPIXmeA1pMnOjZNBoaNK45GpII1S8hyRCYmr4ZCsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195071; c=relaxed/simple;
	bh=K6NR8JcumOUY9xMWHbjG7orxQA5zVaH75daxgMF2KLA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=h/cozZChRjmohtKoKzjB8IuyVy/KJZQcYKvswKYgnNtaYBJxjqU4xRJqRVDplyuHx02+p/x2hDLFl/W+3Zggt5G98tADaIVj1XiTMVUAHseEHwqsEzLdfMlEuIMoO2izxpJOgteIGjZwBEooqBnHbGKwd6VHsoVt9Y6/kPks82E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dgVkuXnu; arc=fail smtp.client-ip=52.101.195.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dgVkuXnu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrUNIMUbi5gM1ida1b54EmwswGotcKReXJfQfJ3S6xMsFXMeh41QtO/itH0taj1V9OwYZIETtsU1jktyrrwWD1G0VGiIG5m45SV39M7JS0Be440M02LccaP3IIevwPPgJBrcpoIJgWPjqMmCENIwPv95tw7E8EJw3I6DeQnCaD3Zwz8tOF1hRdNOkA7BYA+OAwlqkQ4X94C6On2dyT+vjwVpnGMuW274oDVpPekGPSES/4Y/FHfiS0oddVqrUWxZyRkFtzC38cTMB9+A+HE0lr3UYZCpWeB8i6vJAiu8mdB3CPgs910IXGmz6qI97f/UU56tucmCsAXtS9lrlCgZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAPFbLP+c4L00EqgzNGwDelAmtSfuryNDWgZMp74rks=;
 b=KaQM5RtzwE9RGAWVQ/VuIBcJgwG83VhrXexUjo4PrvojBHY8QAuSlXX9WQcadihM79ZTu0mJU0EhDVs7hXGVVSrUTnvLqRtm3YisS5OsQBloFA4Ml4nnIkDaN2GebvKxnLC6mYbf9liZeEnZVgNMTN0gTCyqZEQBrS1Il4ETwHMBj8xNw/2TAGebwh+ZRyxdaxyoOQZ/baLdRGQvXPxStfr6Tv6IlCx1zfTLSE7NfRYcUbt1EYyzV/xcNGSZ10my36WKEYiPS9BO3WnvDcdC2WURHquYWqMk/94CMjXoWkepGlLfj7Lky2bsAQetH0DacbvXhAkeQHBsoBNshW8A8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAPFbLP+c4L00EqgzNGwDelAmtSfuryNDWgZMp74rks=;
 b=dgVkuXnufhfaS6otcvhMNY5uHzH6fTu195lYVtM3FrKc+/xm7LFVv1IeHjB8+6gsaCgPXva+92KnzmC/fD94qoWlczkb+duuRqiUNCUs4i6PM6zUCim62DlLh0QFdgDcT8ZR7t+uiVMY6IAeTIEgsQoO0+jNlH1V9v/Zzs3jRIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1880.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:42::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 12:24:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 12:24:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 12:24:24 +0000
Message-Id: <DGPQPXKD4U10.392W2G9DLG9R4@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] rust_binder: make use of == for Task
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
 <20260227-close-fd-check-current-v2-3-b3347edbb310@google.com>
In-Reply-To: <20260227-close-fd-check-current-v2-3-b3347edbb310@google.com>
X-ClientProxiedBy: LO4P123CA0130.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1880:EE_
X-MS-Office365-Filtering-Correlation-Id: 779964cc-396a-430a-bf39-08de75fb26d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	+wbpE2ZFDHKZ2U0zGv50FLoycGWoiDvIlbUARkecCnDx+DJcm+X/Kp7NqS5GdksRQOswyfqcBcdiEba48m5TEFV+4L29/g/LxgE65xUu1Hs1ex3MwLvUYEDtLn7YzHAAFJV+7/gTBVkMTOUtr36LZfNrXFp52uuDk1t0tt9r72z8y6lTAS0aBWRki00jjLIWAOiptRBlmnonbi9KxEas7CYXDWduGdkF/4tamFh2xxAs9LUmDPHDdaB4M/RKi6X//bYjpHwwmLNu52DYamxC4I7hvaUpWU/gccC6tzc2TGDyte+NnLCWrSpQ2P42+b6Ad9PLWS9r9uUxuKZiAfC7rdi8WvxMb1Dsag+4RnxD/lO1jaokLIc7UQo4wRJAig5TyohKwDumSaa2us6diPjW7v8UYFgyOW09DCcje47eOpgoR6HfqYokTqVayjQwjYSczhuGrrMYmMOhXufe/UDtGmCX0QtGNeGI8u7dOpQrVDlScXHKAYWF7vb7QqTLTcGDYc1jViYWdO8H7nd3+RiYTUATWUeDJubQ0XY4CFuo8ntKb9J+D8nxjzWO1UEuwq95yedLfz31RFQcI7PY5yHiUoAudSULlFCvxnrRLIDMb2O8jXCeY4SxA8imrMwVFDNotsh+ObA+gneLnEZI1F/O0EkccDZbAIN4gRGMPdSG/gh+tWA0+cVYZQm1dHq4jLoqNdgcjSLJtVgxpfOf4BppGxcjLsXW+aaWWOa3dAAzscsw6pVmijEw1UGA9vMl+pE1YXjBlgNexsbFCfSyww2ZNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDQvdzRBTGxSSlZmUXJadDdqeGQ2L0VheUFTNXhXc1AvdWl1ZjF0d0FJWkJo?=
 =?utf-8?B?RVBHd2lxUDR1dk1sbWRBanc4VUZFajRjd1kxdmFpVHU5OWJQR0tPYi9aRUJs?=
 =?utf-8?B?Y2d3V2FRUE51bTY3VnRvME50dFZkc1FnaDV5elpzSTArcEYwMFhGMzZQNjhQ?=
 =?utf-8?B?UmhObUliN3dHa3AvTXhrQWlrS05HL2hiRS9zN1pleERDSFNXWmRJUzhSYVFO?=
 =?utf-8?B?azd4Yjc4S2p2M3RMeVIzVko0MVJ4T3M1d3hUejl0aHhvTStYb1VSaXcxeXFs?=
 =?utf-8?B?Nkt3dmhvYUIzaU9nWHhxYWNEaGtLdE1PS2RwaDZ1NWdhRjRPaTZJa2FPK0NK?=
 =?utf-8?B?emhtUWhWRGxJbnNSS1pvczF0cDZpb3lNTlRmdUp3bU1ueEFaK2t4b3gySk9C?=
 =?utf-8?B?WnlGWVNUVDZ3NVRoZW1nS256QXNXa0h1Y3ZZWGNtV0ZjWlRrZkxuQU5IWkcw?=
 =?utf-8?B?QVptcVpGdmF4NEx6RUhrVEIxLzN6U2xJVmRlZERwRXJucVBFUU9KcTJ3WGp5?=
 =?utf-8?B?OGlLMFpVSE9DS3gxZVNWalhDTXNxcUJIUlRnMkM4UWtQOS9MSFRuSFMzL0RT?=
 =?utf-8?B?VzFPNlpab2pFeklwT082WTMvNFNJZFU5dnhRaHBJSHVYYTVHL2N3Ymd1Snpm?=
 =?utf-8?B?RzVkS21MQ2g4MUw0RnpIdk9UUmpIUjMzTDNqRE44dmJOSlE5SmwxN2I4YWRx?=
 =?utf-8?B?Y0hZcVZKcmlBcUhtRmRNbjgzMjgrMCtqWmt0U1JDeU14TWxKUnVJcytVUWM4?=
 =?utf-8?B?ZXJpYTZSdlNXNVc3LzY2bXlCVUcyUVllTFVGSytYYW9KMkxGT2RVRm5JOWJU?=
 =?utf-8?B?MjN3V3FYdWNiNXJvTHJBdmUxNHk5T3lSUExjMXdQWmxOd0JDcUV0c0R3Q2xp?=
 =?utf-8?B?azRWOFVOallrVE5COUVMZVBmektxbG9ueXFEbHhRdzZQdm9kaFAwUXpFSm55?=
 =?utf-8?B?a055WnJoZDcydkFFdzk1OFNoQWVZTCs2b1pGaU41bTBGUVVEWWRiVUNWQkc5?=
 =?utf-8?B?RlNVczlzby9vNWZYQjc1SUx4T09qZzBLWWFmNVFubVIvVTRPSGY5eWVWSjZN?=
 =?utf-8?B?eVBxRmF3YjdxcnpIUHAvNEM2dVVTM1NXK0xSY0ZSQlg1NWlTbkxEc3JacTJt?=
 =?utf-8?B?cVpDUHdyUnlsS2h2U29QbDcySEdmY3c4U3hzQVVseFNBdWNhVU1ualRmRG1J?=
 =?utf-8?B?MkwxMVF4STJDcFJnVzk2Tm9jSEJwdTVnZWx5SGI0eW9UQVhVcDhXd3ZObzZJ?=
 =?utf-8?B?MGVKc2F1YnBESk9ReVlkZExrS2ZMdDlBYWp2czYwV2tnbnJjeUNJODFKTk5V?=
 =?utf-8?B?NTBwT1RIVUtvSCtZWkxkVnRmQTNzUEM2WEROQy8ybkRtbDdyM09peEdnTTFQ?=
 =?utf-8?B?VjVnWWMySUdXaW1WZ1VBVVNQZ05xUXdMcFArTVJzYlpOd05XUmZqbERlRnQ0?=
 =?utf-8?B?bXBNRDVtRm5JREN5RXdQcm1TWXJ3QzBvMjlZc2Q1MFM5RGZ2SmtvZHlaU1hR?=
 =?utf-8?B?cUpWRnpxV2JocEFYWE4yVlVrOFdOcXdFU1VuT29HVmhuNnY1ekNBa2JyeTVt?=
 =?utf-8?B?T3A4TTZvemdWNkFwZG9KdjM1UC92b05SV3JtTUF5NlNMdFErN25rdS9pR3BP?=
 =?utf-8?B?Z0VRWE9mREhpS3BVVkk3M3dxZHV3U2NrRHk1enhRNE04RDdLSnVNeDV0dTZB?=
 =?utf-8?B?Mm5kdXZnaCtBb3ZuV25XUXF3dXBCUk44NlBFamttUE1mMDF0dnhtU3M2aUp6?=
 =?utf-8?B?ZXB6UkJNTEVLM3l3Q2pGSTd4SWpFbDRNU1lYMmpQcVVoaVM4dWo0OTErd1pz?=
 =?utf-8?B?RFlVTGgvWjlXcGU4WS9rT0dzcmNpclVNeDdEYjNzb3M3WTRINlBYY1lmK2RO?=
 =?utf-8?B?aEVqcHA1Mm5UVTFwYzdRQWw1SzkzNWZLN2kyMEpKME1ZUFlDNmk5T2QyaTRq?=
 =?utf-8?B?MXZqcEZtZFdZdzRhYlhPVStPaE9WN3RMdytFME03TmkrMXdLbG5xem1kM2RV?=
 =?utf-8?B?d2Q4aWY2K3MvZ0x4QmY2OENDK2g5WmdWaWtOR3BLVGd5M3Vhd2dHblNNTXBt?=
 =?utf-8?B?WlJ4UlVPelhOQk94OXRMaTg0aFQrR0RUd09leG1kTjhYaEQ1M2JiTTRIN0Nh?=
 =?utf-8?B?T0dwS0M4L1lwbE5TN1lIS25Mem5ZdmtxZ25IZmRlWml2RGZGT0VSdDRJS0xJ?=
 =?utf-8?B?YVVETmJrZ0I3ZGxPWUFVMVo4K1NQbFVoT2NNdXhUc1RPRlFWN0YvdVFVOGlB?=
 =?utf-8?B?bm4ybkVsSk1YdTM4YXZCQTNyaldlM0dKYTNNSEhLWVV2NXZlSEJwKzN6UGZl?=
 =?utf-8?B?MlZtYUxZTlFoQThCUEk0YTBrbWN5Z01uTENXdWoxa0hPUW5JV0xxQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 779964cc-396a-430a-bf39-08de75fb26d3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:24:28.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hq3KijtV1b98/ymC+pO6Q2rLf+yV/7YfQfO95u9A4JD83gx7FSYMRyD56j66u66+erAtPE2R6B5uf+D70NGTpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1880

On Fri Feb 27, 2026 at 9:34 AM GMT, Alice Ryhl wrote:
> Now that we have implemented the =3D=3D operator for Task, replace the tw=
o
> raw pointer comparisons in Binder with the =3D=3D operator.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/android/binder/process.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

