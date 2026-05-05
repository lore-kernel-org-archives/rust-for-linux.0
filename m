Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020132.outbound.protection.outlook.com [52.101.196.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B4279DCC;
	Tue,  5 May 2026 00:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940750; cv=fail; b=TlenTkWUSrrlpvczmP2ESykiHzwHn5ftjAkLnFGoPKwMn+YIyCHFlhm7VlrhTcskTamKfS7pHohW8AZBbuKvDWYgViadvLGeAoFoJDX28HFaUTsNXJ+B9Oue/+aF5n0+C6lTiCwCOFSp28DXlFIzXCx06mH7sRD7Z1X5ZcbSc7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940750; c=relaxed/simple;
	bh=Pd01r5KCZyFEhydtVO+FduyuqLvXwzRgg16YukSSgWU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Q5J6WF8yYuII3X7sKqNS58LTaKJ36Wnj9ill68piu4Huld3EilOUeQVpneU1ea8Q+cyp5ATzIB/L4PX6nduA+Huw5byFQDWh2kBuqFwFZ33z6hxwHhac7oxWcywfHFAZ+TEZzLtcRl030H4wYHSm5ma0kFTcJDAjr4/U7BYZot4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WPTKDmnT; arc=fail smtp.client-ip=52.101.196.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WPTKDmnT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z24kj1+pdhEO5n+nlbcmzJRPtcr5JrOVex9KccDH8gAt0VVOkQ8wyEW5Zn56h69pHYJSNbhf3Mh9BKd+VLaLDKDFiNBsqJvChNDVZ+75hCdScq+2pgUosUAGgicDyRXOpg5zHCyft1UKEwVIxGIjf5QVO4K9WOlHPw/iJdhCqjNbnX/TtYyRt1UnTeCqaMmC/7VTUbQsDWyOnQvMe2pcA7YYXDms1LiLtyTfHuMj+E1aSw2Y95sAy8jDS2WGwnTgjwp7pATDi2hPdwD5uHK1rnjg5GbXabyMABb6nrXMHEUa17n11sIpyg4b4SnUQuiIWayvlfLT2GZOSaliOdGoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9PqGQYuTzvrJGiXcvAnuhkBvaNxoxS60Od1aJFZ7Yg=;
 b=MNUcx5t9tOOO+2lccFq2rxmPDClKuXJG66T7SplI2NEr9EhZzHi4yqMnAaUMno1o+la4js4cBHjYOZk2J42AkBmxjC0KhXjT4BATybAPu6/TR1jyL9ZlUuO2OLjgh4EezP18yXEbhIsQKdwkMKgSB37G3CRf2cTukAmOsOrmPzzIcXQBfBeWvcCYOYTuPYrdtXL47orEnVeBzt/8v0YXF/sXK2pfSs+q38b0VCpiYjhgstL6XCI1oSsNDvwgdj5ZjSghqfWYwHnfeVHd6omdOPrbqmWO3D9yOsaAA8n2dWFrg5tJVoowMM4QIsYX34O/8xabbxUwx0mRwN2m/2a6lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9PqGQYuTzvrJGiXcvAnuhkBvaNxoxS60Od1aJFZ7Yg=;
 b=WPTKDmnTRvqR1YUKjNHaD5cg3rn4uz7DxDZVuQpHzIbrz+BOmi4cBuvnl87RHmE/2A8XJi19HxUiVKVjFSoU/jvNpimfB/ZpqvGNnKaQWJjZD1BPwRlb0lAUXJq4ttq9SfWLEmoSf7vPDH3SvMZYDodViFEY/2d+sHgRpRkVun0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB9147.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:49b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 00:25:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 00:25:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 01:25:44 +0100
Message-Id: <DIABE6E7DRNA.2MN7A87XGD8M9@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
From: "Gary Guo" <gary@garyguo.net>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org> <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com> <20260504222637.176edc7c@foz.lan> <DIA93EI029QR.A0R5KOVDZQGC@garyguo.net> <20260505012307.6c5ff54b@foz.lan>
In-Reply-To: <20260505012307.6c5ff54b@foz.lan>
X-ClientProxiedBy: LO4P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a0e856-1f08-42c5-491d-08deaa3cd922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|7416014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	u5wXlkt9hiFvLtmUVeGwXrN7D1N/lq1QoGPWCcBf3m+X3yIWEpjtbgiL26x7Gnem3+yMVb+mmqvMi7+G06dmWz8XLPcMAyGX4QvzMOfbwaAKUiK4xDgxBAiHy/pgFoPyrX8VVtGaWc1yFV9+XacqPu/DaXYzlfKtDBBNY3HwjsuXHQrwdIF6mT9cI8m9rAYQk0sm6SIDAVqsCZO21NB2NdzCRYc1xZUeW8DWTW0vVGgBOIlguqCP3QGy6Po9wkA1ae/iubsahvlr7z463NvwtTwxat2GW+oGtCo+apFpr+GtVOVQWx2dtVq3yhElfYloR3eLtY/+fLcb7GJNvEtezwH4aqK3cyC2jFua+dMoXY5bL2ws17TJnPAAbdwdGu3maJlSfYn4Pkl+35KMBDDeN2tOUP3tow77OHFwwMstngDVhP1mqtJLHrdTa+LImtkh8i0C8T9YTIzta3Io03s/T2w/JRT9aH8nnpwavGB7Ct+R1pGgHweSC4OLsjIkhH9yAIlAWBZNZlLREikLiu+nEgmg6st4S/cXO490yFOrCkv0G+lsrFRED9mWBYpkE9m+124x/9L8uYg4k+SPaPT6txRrj63LjfAa0nTc+WgCLzMjPpajgZ1T8Jy5JPzwO/6Z9xx/bJFiaw6nH2mT3Q9vedXt+QxEkgCyAKisPP+CQNoPYp2+fvJq8/DDvZWLdZv8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(7416014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnF2dGFsbCt4TU5mcU1Qc1Zmd3F5b2l3VkNWNkk4eDd4bE93NCtReWNFNmtF?=
 =?utf-8?B?Q2RSNUpEV2lqYmh4eVI5eHBEcTUwMVpNSDVMRktRZVUvTmhUdVpBY2VNUWc5?=
 =?utf-8?B?aDhISEZxdkErcEIyLzdVTW1lTTVLOUU5VnF3UlpTSkhkc1FtcTE5K2dZSzFs?=
 =?utf-8?B?SUp6bkh2a1MrWXNxSTlWRlltOTQwemZ5azJkYWQ1ZkJFZU9VTm5oQjNmMnZx?=
 =?utf-8?B?cXFmQjVnWXp0TWVnSStKVkIyZUJHN0ZGTktPUis1WWJmZU9QZ0xxUkhCVENv?=
 =?utf-8?B?ZXJaUDJabnU4Uml0bjFCQUNpdFd1Yy9Od2tQYWN0WTRBZ0RiVDhya3FQQXFN?=
 =?utf-8?B?a2JFSGpHSDJ3WEJyZitTcCtNZ1NMZDcyazk0bStIRXZJTWZxT3FWRGtLQkpt?=
 =?utf-8?B?NThVeWUvRGt3SFBpYks2OEtZSW9va1JKMnBUNGUwN0ZKamVUT1JqSHVXaW56?=
 =?utf-8?B?UjkzS2RCaHE1T1NQTk8yTGJZYTQybEw0bXhuZDAxTjJjTi91cWpxQ01QSFdJ?=
 =?utf-8?B?ZGE3R3g2cFFzR0pObXZmcU5mZjNtSlZUQUJTTWNxVlBZNFBqbWhRa3IvRDlL?=
 =?utf-8?B?OS85dVN1WXdibDhKT0FvOWsvbUdWUlZvU0V6ZUJxdkMxeDNiK0EwTDBNcEpw?=
 =?utf-8?B?Vmg5RS9seUxRdzg0VmJxdXN2Q0NsaU5DSjhsaFJGM1pSOU5Ia0M3emJybkx1?=
 =?utf-8?B?QVpBYVhSaVU4NXR2TGJtSkpPOFBJZ1d2dXZrM1lSelJPYmVzWnlBOUc5aGpS?=
 =?utf-8?B?bXA5cEpXVGNSTUc3UFBSODBtZERqQnhSaWl3UEhDZVB1dFhERkxRdW5wY01X?=
 =?utf-8?B?OVpybG4zdEF1UEhxclFueGZVNUx3WG5tV3RTeFdSeC9IVDVqektQQVNFN0tO?=
 =?utf-8?B?QlNQYS96OWhxajh3V3prRHhscCtjVmoxNTNsQ1NNVjN5R04rTWQ1Z1B2dnlB?=
 =?utf-8?B?bFB1U1lkbVBabFpOTjEzTWNScDFReThIbi9pSTVBTGpKTTZvWU51aHBUVXQ4?=
 =?utf-8?B?cUs2MFp2d3hJYzJUc0JoODdndmdPTzZrYzVkMUFaNmZyTGM4UlFiY1pnV1ZP?=
 =?utf-8?B?T2FkbWFZSjJFYmxmanZ1NjJVcWJPWmFMajlmWW5kU1VQQW5MN0tvb2p5ZGM0?=
 =?utf-8?B?czRpZDdQNklRMThZMExnTUk3c01ZTmFQeEJhMi9pLzhVZ1hmcndQOWR2a1E3?=
 =?utf-8?B?T3dvd0FRS1FBS3ZuZHBXa1I4SFRMOTNrWDFyRXpZRDhsVmJtRmM4Q0Y5U2FC?=
 =?utf-8?B?a1lHY2xUeHYvTU80alY1aE5hZ1ZYb04reXZRSW5lcExlVHZxcHBjNllTRTZ3?=
 =?utf-8?B?MW8ySWJFckZkdHFHNlcvSjdBbjNaMVBLWExXakV5YTd4N2ZJY0NmZWdhalNv?=
 =?utf-8?B?bUZ6MEhROTlESDNYU2NQNDdmRzJUZUtYQ3RTN00yWEx1TzRZbVFXa2tqVjJ5?=
 =?utf-8?B?TDc1NGtxbUlKSmhVZEtHNTh6TlRsSXdJN0lLTXI3Zi9RZDY1cnNsbndyUU5S?=
 =?utf-8?B?cDhGYXFzaitBZC91SUhuOWhPNm9Ddmx6MFk3L3RCdlVmaS93THRrdHdFZTJP?=
 =?utf-8?B?RXZTcW5aN1hlcDRCeGVoRkswQ2Y5dFdGeUp2QXdmd1huTnFqNUErOS93UzU1?=
 =?utf-8?B?a2x3WGF5VEQ2bFUzbDFJWGF5ZWhkQ2FvWkRiYitCSWNFOU0zbDFwa3Y2bVh5?=
 =?utf-8?B?SWc5YmJQVzBrOXFqejl4bUlXMzd5SDdiSEdhdTRtbCsvUk9vTUlvUW54eFJj?=
 =?utf-8?B?SkN2UEtwWlNLd2g3dHFWVGFhTWZRZCtuS0lMYUxaTXJHQS9uaE1EV3R6Nmk4?=
 =?utf-8?B?YlcwRG5BSk9xQlIzeXA4a2tVcE9ITTVHdmZVVTB2Wmh4SXZ3VTFnTGNWYXlH?=
 =?utf-8?B?T2I5eFovdVh1Q2tMckJTZGc4NXgrWjJ2aGt1KzZad1N0T0Ezbk5WYlgyUFlX?=
 =?utf-8?B?Z2Vic3pTbG83L2J1dEc3Tzd3a3FpL2hTNXgxUUY0ZCtKanZFc0tnVDZLRDhi?=
 =?utf-8?B?TVdGcE96dHdBZDFnTXFPRWpHS2FHL3I5YkJ1K3pjTUlhclVqam1Dai9MR091?=
 =?utf-8?B?SktqZ1pNb2ZCR2pEU0w1bjFPQi81RERTVC9NUGRlQmw1SVBVc1pXUS9hMUdD?=
 =?utf-8?B?UEpYaVdIQ0NWbThwNkRlVXdxL1c3d05CMURsNThRNEd2VVJRUzYzUDNYeXZp?=
 =?utf-8?B?cTY2VUNxanRaNFY1WXlEd25UUGpHUGhaSUlDTFRCWURhQzZYeThrU0dHTTZP?=
 =?utf-8?B?ZjNYRDFGNVpzVE14WWtjWmRsaVFieitRT0xOWjV3OWNoT3lRcWNQWkhRSEVy?=
 =?utf-8?B?Smh6ck9rd3J5ZDhaaXA4dW1Qd2xZa2VKU0djczMyenpMempLNVBEZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a0e856-1f08-42c5-491d-08deaa3cd922
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 00:25:45.1982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frX+6mE1TLhwYz51bCCFF7yeckQ+IW714N68pmYQQfZ2k4FlCfqxJJeEjzzgI2o/+dLg5PvBIwHNJMI2K0N0dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB9147

On Tue May 5, 2026 at 12:23 AM BST, Mauro Carvalho Chehab wrote:
> On Mon, 04 May 2026 23:37:38 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
>
>> On Mon May 4, 2026 at 9:26 PM BST, Mauro Carvalho Chehab wrote:
>> > On Mon, 4 May 2026 18:08:06 +0200
>> > Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>> > =20
>> >> On Mon, May 4, 2026 at 5:51=E2=80=AFPM Mauro Carvalho Chehab
>> >> <mchehab+huawei@kernel.org> wrote: =20
>> >> >
>> >> > Currently, there is a "P" entry for Rust pin-point that is =20
>>=20
>> I suppose the commit message is supposed to refer to pin-init instead of
>> pin-point?
>
> Gah, sorry for the typo!
>
> I'll fix on a next version.
>
>> >> > neither a valid ReST file nor an hyperlink. While the real   =20
>> >>=20
>> >> I guess you mean pin-init above, i.e. this entry:
>> >>=20
>> >>     P: rust/pin-init/CONTRIBUTING.md
>> >>=20
>> >> It would be nice to clarify it in the commit message that it refers t=
o
>> >> a file (which is allowed for `P:` entries according to the docs). =20
>> >
>> > It is not written there, but by file, it would actually be expected
>> > a file within Documentation in ReST format ;-)
>> > =20
>> >> And, yeah, ideally we could make it a hyperlink to the raw file. =20
>> >
>> > I'm afraid that this is not possible. Sphinx doesn't allow
>> > hyperlinks to point to files outside the documentation root
>> > (which is Documentation/ when SPHINXDIRS is not used). =20
>>=20
>> I suppose we can just change it to a link to the render doc on GitHub.
>
> This works too: there are other P: entries like that pointing to an
> external URL that was rendered somehow.
>
> That's said, GitHub (and, AFAIKT GitLab) supports both Markdown and
> ReStructured Text. So, if one wants to keep the file on both places,
> rst is a common denominator.

Unfortunately that'll create some internal inconsistency for pin-init as we=
'd
have a CONTRIBUTING.rst next to a README.md. The README has to have markdow=
n
format as we have some code samples that's shared with Rust crate documenta=
tion
which needs to be Markdown.

Doing conversions could work, but it feels too much hassle for a single P: =
entry
so I'd rather just change it to the external link. (Also it'll have a chanc=
e of
getting out of sync, especially if conversions are not loseless and they ca=
nnot
round-trip, which I suppose is likely).

Best,
Gary
