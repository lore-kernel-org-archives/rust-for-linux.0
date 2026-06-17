Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020081.outbound.protection.outlook.com [52.101.195.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D113D37F735;
	Wed, 17 Jun 2026 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705430; cv=fail; b=PTC5U5p8sVgbviJLSCQkXbpsHhmHpLh/Ptbh0mHqvQnRxdJrnya+PmTKDwqxk/VnSL0cwvZRG8LzepCQc88HtUI+Z4n3j4EVuBORGAGL7nL1KrSD2YyWYAYgATtf/lms7zUJcrt8VB42GvQCShgWXz/NImxjXTskS4iLxSlJC0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705430; c=relaxed/simple;
	bh=BIls9Xv6zlx7j86ud9xo+p40maMSsEwGIMwnsIo0P/Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Bg+z9Jvewrmx1CJY3ehjifmEj97nBKjVW6djRbrfxLNb1/VxM5buqxNd9ZopPOPD36Xs6AdG5LLsIhxoJPdDDIOVuu/NhRlQ4wraOZzpaAfgtmn++8ihkBVmj0zoI4V3jCLd1vMmA54yt/QhxhAqrg0j2MY2NprvZ1lzERiTmNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nXideoBd; arc=fail smtp.client-ip=52.101.195.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nXideoBd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHMIt1S14q8i32F9MkQWI8rcZT5is8Mo9SCZuCkLWiU48LooovdKkmt30iX7lpi8HV99AvDG+ce/F6qAD1FuL50ouo0w2YkrXX2ns999K7oA4e7ne2K0OUTMkBcvNHw69j4UIFhmCK+bjl1sS5jDKAFGzRF0TolPT3S2fCPs5LblG8QRc/SFJ+VIUUFR/PMsM5h+vdfnN7b+1SjTeBMRjJsyu5K5akT47oCzu4zymsES/XnYaJsyi4Qek6zqN1z+QEAWAlglstxXDyiozphz5r2wWqzSGeODqQTEY4HneXeVI+k6MrlKmQcOOLh2Vm5cVbVZC8y9MNbCkdz5uGza8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MExtcstB/NyU9Dh+OIQCzRE0GfQteji01fQQldCLWrw=;
 b=caPqTRXI3P5j4wYZon0gCQwMMlHX831y7STT9seq9n8so0taxJsW7QF8BHowUfSMMd+Rd95CdbWzAMcBQprR/47/IY9RM3VjlB0LE/VXlbg3IBWu6d+Pii76FBS5Zbp7SoGVla8cZb4rozSnoPe3x7UJzrw3mnavzrKmwHu1bYrcvV8KvKI4xquX6En32Xfbm0y27TVdEs0XFbq56m1hHixd+XXOtm4gBu+PHPFJuBbJ8LY8ESFaM4KsTUbmyilE6KTOe07ILrAcc72Keh5gS235JkRWwfvEQR5lGzwCialU3X4XOu6rz5GjbaBHn3cyBC05TcHvQzdIU5UjABzfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MExtcstB/NyU9Dh+OIQCzRE0GfQteji01fQQldCLWrw=;
 b=nXideoBdaC/7pFqB7phOm26aCueJ1dZ2nlXp2CIe4mBfoWs5XM639CWbrEEahpMSpkElu3483+VBIFCoN1MWEDLar8FAy7NzurEW1vAgk2u1ZQubLspzjhX9Gkp+E2FuIchuK67pAJ5sxw4EDw4vZG7jnZ12ng4zax4MoZSvBTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6522.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 14:10:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 14:10:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 15:10:22 +0100
Message-Id: <DJBDUZJI42DH.1K3WJJND3Y6E0@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] usb: rust: mark Device and Interface methods as inline
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260616223614.16444-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260616223614.16444-1-nico.antinori.7@gmail.com>
X-ClientProxiedBy: LO4P123CA0641.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: c20925ae-397b-4b47-c33e-08decc7a2c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|23010399003|1800799024|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	SySs2IMn6OmSkPx7JkpXrZ4Y5zudHviY0oxvP9Sq08caCy7V5/sxdpUb2Yv4lnuimeJa/abDueTv1yjAMqtzv5yPeJVcMlFUZ3CVKD0VbAuH8txw7X71CeCy7pjYBoGFhkbSHrW94xHyDWQUPn/bgGVH+97Hn+WfMt0kqyx5FB29hciF7peEBH0neBDvpQ+4910J86FF2fZJJXqx93RhJm2sg5/of9CANM5VmeDUVoMWKzE2THtsy03L9MWNVv79zOrOiB2t2VsSG10NgcJwL7A25dSCInOSyqVCoSoH/gzszFMVwuvV4KhAhFRDPrFFfBEI6UJ5h7uSXxeSgUriQoh/kZ8xzI/x+URmhSppv0apQH5jzIEkR9umE/LaupJXyHerLHDMHtjR2Mi31UmGjVT0qnj8grtujRXbnM5CKQcbxQhfpGjKNIEmUkcs+GguFG+bEKuRHteUPdoEb19cMwPQNUhXLQvUJ10epwUcAmPt8PRMzxO2s/bj0EhwPgo+fPXj02cKLP3H6toA/243XkJ/RX5R6ZqPGy7mM8biSU4AJbO6kbktXqUKOZ90uaYNgis8FX7aRrYTSMbvi22D0n9M1/jteXEe1M1twWs0hbHUOkL9a/Kd2oI7CeNf3B9leh/j6CEK8oWqL1MpFeS/IJZvVEgdDn0onQI7FqHyCl1FmbdpGQkn2hQI9FvFpUCU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnhldVhLeTNOaHFWcGU5RXh3WGtWVnEwMSsrSGtaRHNhaTVhdWlrTW92Q1hY?=
 =?utf-8?B?S0ZBd3pMQXdieUJXU2F0Nkt1WUptK0tqS2JJMjA2c3IrOEUzMEpQdUNwcGRH?=
 =?utf-8?B?cmh3dlQ0Rm1raVA1TXVwWTlVUUIyZlMyTzlXaVdTTk1sYkxURUhCSUNwVGhr?=
 =?utf-8?B?TTFScldVZ3RMYUp3OVYyUm1jSmYxTmdIV0lmQWxHYVJScUQ5L2dVTkhFQk82?=
 =?utf-8?B?enpHK0VwV0JycnNOT2xuZnVqUXZmWUsrSTZXOFlMTjlmMXpGWXZGRm1UVGgz?=
 =?utf-8?B?UVJheHNtZTk1c2RRUkJDWmpzcklubm8yOGpRaWRaNmhZb0dUL3AxeHI2dGJQ?=
 =?utf-8?B?ZjhGQ0dUUlZlK0hMMktWbzlGM0NJWGFLN21nSHdUWlhFUk1WZFJVWFh3dlk2?=
 =?utf-8?B?Q1dUL3JMcVREalI0KzFTdHN1MVhIRFROQjJHNWdhN1kwd1hwUWRqVmJPT3dl?=
 =?utf-8?B?eHQzMDRsKzhUNG00ZC9UYmJ3eENBSHgxUjN1cElpeTA5NE9KampERm9RZWlR?=
 =?utf-8?B?Qi9RRnBwQkp0eGJUK3dmQXRITjZiYjRIeVZxdVVyRktrcERLYXliYUx4ZEZP?=
 =?utf-8?B?TjhWYXpTN1F1ZWxxRW1ucThiY2U1M3M2MDJEWElZU2RQZmtiN0dUQnVJMkVk?=
 =?utf-8?B?RTYzNW5rM2FIckxacHFnWENJU1VjL1hQandyeGJIcHhZVzUwbXNTWTJYNktm?=
 =?utf-8?B?cytsdm53QzdqSkhKa2hxbVJHb0oyQzZQRm85L3p2T1JJMXNlaFQzVjliTGRB?=
 =?utf-8?B?c0tzcGVaaFZ5MHB5bmNkYzJkU3ZNanh3cjNxdXpscVpSY0JkdzkxNk9PRDZ6?=
 =?utf-8?B?cVRwd29OOW9FanAzREsxYzZPMFgzaHBXb3RZMWRvMCtwaUJhb2o4M3lhSkMz?=
 =?utf-8?B?WDB2WGgwNDZJVS9IbnJyTEJ1SXFkcDE5SXlDc0dvRGVydno3SmEyMlZjdENy?=
 =?utf-8?B?MGxWWGZaQkJjTFc4UHFBcndzbkRsQWFPUDhrbmRhWkp5WmE0MVZKWHFUTVQ4?=
 =?utf-8?B?TXFJUVhlS2FmV1Nmb3lkbnhnejFNNjFEa2NCWUM0NURLei83S0JiQkRNdG9i?=
 =?utf-8?B?V1VRQWJ6MDljckhDdXNBbi9xQVh1eVVSZFN1RFRKU2xSR3p3MkU1ckhnKzhY?=
 =?utf-8?B?YUIxeW5QaHQzZEZTZ3N4bUhaY0g2a0tJc1hQaWdHQzdxczJDSTFYME1NK1dG?=
 =?utf-8?B?d0ZRSnlGaDQrK016enpUNC81UlAxRWg2UU1tN2NxL2w4TlM5eUdKVjdBV2Fi?=
 =?utf-8?B?RXJBdmVLYXdpOXd3a2lmZmtPL1BnZWE0MTgvSkpRTEszNXVuOWRaeG14d3cy?=
 =?utf-8?B?cklMRnJ0eVZNcmFYYytWSUp2SU0zeXpZbDc2aFNBeGgwQVhFRGNQUEhKUHk2?=
 =?utf-8?B?Tm1DaXBMRUg0THVYQUsrRlpaQ2w2TWlkSWlKbjR1NzhITG5ZaVFJSmZwUmtU?=
 =?utf-8?B?RkxEY2RRazNtbDMxNU1LQm44YjRNUlpkb0hzN21RMDRFb01CNUJ5ZVlzNjAv?=
 =?utf-8?B?b1p6MVk4S1lGTGpTMkxZVkpVckJNbXV3Wm9ZTmg3bG1icW43NHJ6eHFnUFpO?=
 =?utf-8?B?bTQ5RzdvZ00wMUUxSVBOb0lDNFB3N3MzY2l2U09HSzVRaHFsdHkrWTJIVkVC?=
 =?utf-8?B?eGlxL0QxZHBBVnpHVWg3N3EwemF3U2cvNG40OFNIYzJDTkhJRkxHRnBZSWhQ?=
 =?utf-8?B?OWVzdnlTR1JwcGkzR25UVGUzNWdHMkIwdW9CeTUxZmFyRWVmMSt2VytBQTBT?=
 =?utf-8?B?c0hzRExmZXlWMGY2Y3UvMlJXclFndjBKZWxCWDh1ekY0blZIYTk5djdoRXhP?=
 =?utf-8?B?L0tjWXNLSmxiQmhZbnNjcW9mRmE4Yzd1V21kNDFEdFFqcmk1ck8yeWlmeDBq?=
 =?utf-8?B?R243d1ZrdTlpdGMzMUx1SW1XbVZRYlRnNStUcmlHTDBDVVhBVXEvYzNoUmhF?=
 =?utf-8?B?OFZWUXNtaTBjTWZrRWhzemJma3NoL2RBUWxCa294aUhDMVJ3dVpFMGZTZElE?=
 =?utf-8?B?KzZDZ3lBVnhETFIzTmtvZExwWHNLNDlCWHNCQnQzeTdzQk1BdWhHT2srbStx?=
 =?utf-8?B?eWZPc1ZLekw1T2dZY1Y3K2ZaUkgzWUVzZE1VMUdodkNwa1NHRXdaU1NUWktE?=
 =?utf-8?B?L0IwTkVyMkd2NWpDMTY2TzdDYzlPQ2dqTGJZdHlWbGNIWVoxWUZ2VHRlMUZY?=
 =?utf-8?B?RkdlL3FOOVl6bVI4VGROVnN4SmZDUmRkOTMydDErZEJ0UE5sUkNOT2w3Q2tV?=
 =?utf-8?B?M1c2eXBpcFAzZkMvU1VzWWVEMnNkQ0VtYmY5RmtsL3N0a1lMZTFKWUFHbUdR?=
 =?utf-8?B?ZkNnRjgwK2xYdXJqbHFiZUV3TFVIdm01ekwvdXU2UmNGV1BlUlh5UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c20925ae-397b-4b47-c33e-08decc7a2c00
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 14:10:23.0203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60Qm1IKqDrZHDf9gSwIJ+SgR6wiHG0xnQu1kf/dk7VaQRQLTxk5L753h9SnRpsioGp+1AzcLAsBmvo6+xtIc4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6522

On Tue Jun 16, 2026 at 11:36 PM BST, Nicol=C3=A1s Antinori wrote:
> When building the kernel using llvm-19.1.7-rust-1.85.1-x86_64, the
> following symbols are generated:
>=20
> $ nm vmlinux | grep ' _R'.*usb.*Device | rustfilt
> ...
> ffffffff823f2490 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::dec_ref
> ffffffff823f2470 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::inc_ref
> ...
>=20
> $ nm vmlinux | grep ' _R'.*usb.*Interface | rustfilt
> ffffffff823f2450 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::dec_ref
> ffffffff823f2430 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::inc_ref
> ...
>=20
> However, these Rust symbols are trivial wrappers around the
> `usb_get_dev`, `usb_put_dev`, `usb_get_intf` and `usb_put_intf`
> functions. It doesn't make sense to go through a trivial wrapper
> for these functions.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/usb.rs | 4 ++++
>  1 file changed, 4 insertions(+)

