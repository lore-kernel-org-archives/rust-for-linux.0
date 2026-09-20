Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021082.outbound.protection.outlook.com [52.101.100.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870703537FE;
	Sun, 20 Sep 2026 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789920190; cv=fail; b=Z33elVrUNyQJHnmPKHEq2+l0LDtEIighU402r0K5HPWOUz29prTK15nP+H9S5accKOxriuTXilKyIckaPbP1joWlq4rrPRHaDM5IMUR5N655DNc8muH9IsrsMIqbRmvGCjLb+bwbjDmfhtxzqu41hSE5ZssBvHYZjTerqD6fBPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789920190; c=relaxed/simple;
	bh=z87tDElSs8OcY4ueC5WkVbvbea5klSsHFl8+QtGD8eA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Rqi/+QAU5id5Ef5TmpfhG3aJ3RIXeodBEC7QmvpHRROgLncDm6c/N/aPYoW32wuc1KGwKKkqpKFdYnbOJUeDGIoF9gEqDhQA1ZhT86OHi+YlNWDs5UJGuPSpuKI7h47YpFR7Hkhacomh6HWz9wr5V9zdM1nRN6eUlyfsBWOQvak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wo1erhqq; arc=fail smtp.client-ip=52.101.100.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wo1erhqq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiAoxSZuv/xmgjpWgtNyop6D1K/nJeI7vjWI1BR9DwUCzwxTMDXazRzo6gam1MsejikVK3sy9ovkUBjC1A/+jSkmo4n5STvovY+9yig0DiTzwrplXP3MYbcu++7QrsbamdICS4cLF2/e75R8S0MnREPd3hkfVdfaReLyJ/UMKVfgAMbfmpn6a1edJs9Y/pwjdhdIIb5V7xwcS17K0M2o0tKIsIVfEIOk6fgF39O+Zc3XJeSK6S5usFwyptXnU2eyF0GPqVgHgKhKtIRQ1Mxvf04UpgxVBkqF37jVvYROJMvwQKbEL1IUTs3ngpPQBJIp8/TpbCY8sIG4XlMuDkDUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6cREJjKEvGXz8Q7zom/0JUHZLYsnbjv+TWISBH65Yo=;
 b=EmdKhmhiwd6Hj+0nEjntob9P4G0fvkL8WTZcf21tTCyGCRM7283YYG36mT2owiDpv+Mw/ShcqDvLT1rhnoptGFOes6UGRAkkUz+wPXcq3X085+tv9fvULPqlqTR5Py2bSMcSkgcS1SL25MVR8+Zrq8FpEkCFXH3K9cpXKqH6ybG9AX6/Duee8hXD1gYyzegbS/saIE4PbfGQ5RJYVRyhrKz6ZwsyA4ZAuuubLcoPyKAQAYIdp7QZ0L48Qgn8n4p4G9GmUPvBjuuKO8yYMex0wEo7HJPWp22uFptyj9UNaNYmt5K8t7I7vLJ5sXEvfKVEuG00PK9KAM+LdFS8fKYgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6cREJjKEvGXz8Q7zom/0JUHZLYsnbjv+TWISBH65Yo=;
 b=wo1erhqqE7fFvqedD3KiDQcFtZgXFrtqRnmGw1MxPQf05rytwf09pWZxHGl1OgylqEILycCi8ShmFIoukIMoFouaNShGBQLqMCHMM4k6+dpjJXKj6xhs2N9Gzu2kviQFp/iDgcU86S9kRIL/nNIqOVk/0b7AWgFSMQ/OfQCnug4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by LOAP265MB9096.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:494::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 16:03:05 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0428.011; Sun, 20 Sep 2026
 16:03:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 17:03:04 +0100
Message-Id: <DLK9R14M9X05.A1RS5NSZO3EU@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] binder: use irrefutable let patterns
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.22.0
References: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>
In-Reply-To: <20260921-binder_let-v1-1-0cfc4c535544@nvidia.com>
X-ClientProxiedBy: LO4P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::23) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|LOAP265MB9096:EE_
X-MS-Office365-Filtering-Correlation-Id: 98dd6272-b7d3-4624-7e16-08df1730a7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|23010399003|366016|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Oycr5E72pBhDa4rZfxwirJFUOwHWGYtlAoNMw4SCinXBTK95hpiXjY8WhCMxWI8PiplZ2QaysNR+gORGeo3tIpC/ZapSYwnsVdQ1s7TcgAGImZMq1dGwrmgt5alxBjuaNqHNhcLUAYtZ9/wP7q1lBSgnCXy5rNs675z6yft1n0lFdrWa/RSFpfz2eJVZU9tafXTRVsOzbU9o5CQitu6urbXXu1o9P2qksIdK6CB5jx5mmZi/+EeHboNy0aL6paWGOGGSWXG/C5/RaiAVe8quKKcC+iKQgLmivTiFNDUXNC1HXUMkg9WDgnK/oAZr5IiQOQW2Nk0RMXXPOevag2AMdRyHfzFyoco20Cr9Lq4sfeQUtT3VHzB1DlpjsfjU2tfOezcQWDNsTCxw2BZ5tuYaff1gVhneXlnxHVKQwf2cw+5G6LR6E9x839E2KBd4fXikANsW5BIiu7KYa9jJdVznnMmVrFiZDUr9LPcW6nMlzV2k+8S05Id+z8soyEOA623vjEBYb4bjafVzC3XjB4OhEJMLLoOYp/gllkjJfuBAJo3BYcpLdv63N6BE1tC0sY3peqnJ9Z7bjF9MU0kYEPkgq4gr2+iWAEn3KdiV+gwiF32EjdcazCqbH9M5r3X8REhoroW3Mn6rm/RfFopCw6N3RPMch0OhwrM1m6ZfOkTfmcY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blFkRGcwVFZadE5uMEU1akJwbkJmT0VzQzd4S0dZWFhadmNmOEViRmxIU0Fs?=
 =?utf-8?B?TitrM3diNHdETGpxWXByaHF0QjlEUFRZRzJNeUZlZlRhWWdwaWZqSjV0V2V3?=
 =?utf-8?B?NUJJbG5FcE5wN25IVk1rdlRNUlltbXlPY2x3a2xtWDFGa0Qvckh5M09yVDJJ?=
 =?utf-8?B?emp2UTlnQmtPVFk1OFIzR2lKU3F3V0V5V2EzZDZ2ZWg5WDF2bU5HMUdRMkNy?=
 =?utf-8?B?VVF2d0d4UXFOSVEzY3IxR2E0TU9YWi81Tm11eGkyQjhtSzBDcCs2bXAyTzVZ?=
 =?utf-8?B?QlcyWHpYUGVxWTdkaVg5R2k5bTl6R3d5emtwa29NNFJaUEhpZmlMSWd4d0hy?=
 =?utf-8?B?cHBBM3dhRWh4alFXckxDR05ReTYwYldNTS9KUzZVakZ5K2VlRXZiSmpQZXVl?=
 =?utf-8?B?eUJZSkdNaFJVczNqczF6VEl1aXcrNVBnWkF2N2NWMmVQc1l2OGIxYUU3ZVYw?=
 =?utf-8?B?QzRDeHlmSjVybk1rY2RpQU45Q0F1V1FXdjZzclRPYXQvMHk2ZzF3Titha0hm?=
 =?utf-8?B?TFNuT3A1MTNyeWxJNzhESmh4U3c4Tlc3MjlMaEJWdFhGQ3NjcklxQXBkQjlk?=
 =?utf-8?B?ZVdqOWZoYVVJcTN0R0NSd29NVktaS05UQUFteWpIcnpaanRZVHFPYzBtSURz?=
 =?utf-8?B?R1pZcTJZUnlnRnVtOWZBWWFBdjY5ZW1iZVVvRVNGMUpHcEFPUWpwOU1HRTR5?=
 =?utf-8?B?eUJBbWJqOXNOdkFqdG1MNWF2bnF5cFhLQlNGTmh1azA1ZE5FaUhDbzQ0UmFj?=
 =?utf-8?B?R0VDR2xablplWUpHVzQ2dlF0ZmFZWjIrQXVTeVVNazJlMGVnejBpRmdJTDg1?=
 =?utf-8?B?bmVqNGc5c3M5blQ1bVNCQm50VnlUdEM3dzh0RkF3NHZWMHcrR0VmQmdoY0I0?=
 =?utf-8?B?eG9RNTBGVzl1VGp6WnFRL0svbGxVdU5hbllGU0ZtOUlsc2o3VHUzemFRbXJ3?=
 =?utf-8?B?eG4wY3RsbWdrOTVITEgwcUJodnVaYnlMTXRVTHFYM045L09QZE9vOXFFY1pu?=
 =?utf-8?B?bXM3M05rQUErcEYxZmtKTldWZlRHMEFGNGF0M2wrNDNIeW1TUG11RENySWpV?=
 =?utf-8?B?RTdnbVZ5dlNKdTRRcEtSYURkYWVxNE9tbEV6VWI1d0xEQ1ljMEFxVWx4SE5S?=
 =?utf-8?B?WDI4RjAwOVAzdFBVaXhjalZjZmZOWHA2T2dLd0lwcG91TnBxYlJIdGRURkow?=
 =?utf-8?B?WUxQNXRqeURtYjR0RUFVbEFvS0xUdHY5NjJrdnd5MGgrZXR1emNzZ2xGQm9p?=
 =?utf-8?B?akNyV1R3Q25YNkdSaDNIRUpHVGVpZUxWOXBnd0xETnRtY1NSc0RoWFUvSWFY?=
 =?utf-8?B?MGhYYTVGclFhRFJ2M0hZRDVCcWhrRHZwSDlHb21KSnFuR2FDSWVFZ0FVdElL?=
 =?utf-8?B?ZXdVK3hxRzZQSVptZGxJUXZGazNDTE1hRVRLMGUzZkZzN094a1pINHN3SU4x?=
 =?utf-8?B?Z3JtblhqV1lxR1VQNEZGTDBjUEcvRW0wL1MwaXRJRjBRL2tORW5RYStDSDls?=
 =?utf-8?B?OS92TGRBVE50RFEyc0N4TEpZZUxiYTJiU1VJZkpMRkd3RmdKSUpNcE5MRUh6?=
 =?utf-8?B?T3Q1MTNKNXVkTkE3SnN1bkFmTGdjMUxJUWVlSGp1TkszRWQxS0pGb1J3aDVI?=
 =?utf-8?B?ajQranBPM1M3dHJvTkIzUkZ4MWFRZmN6eWNSalVWTUsrcGtBLzVicFNBWG9I?=
 =?utf-8?B?bW1HSTNMcEtVU3Z3STZGOGtnSHBZYmZoY3B6K1FhV3BZVTFYWGZIVkVlcW51?=
 =?utf-8?B?M1JoUEpwcXAvNHJKbXVOaWJzV3paUmVISkFoNnJGNkVtVElldkpBR0Z6T3Rw?=
 =?utf-8?B?c3FpRkYwWjZXQnNObTZYRFRDK21nQmFFNXNHZm5CdTNpOXJLd1lMdzVhSVRD?=
 =?utf-8?B?UFE1bHVzWjl4V2xOTENVZStLbTFDeHUxc01RemZDVm9rL29FMXlrNzFTYWMw?=
 =?utf-8?B?MnlRNjNsMVRhZFUzUlo2NWtjVGE3UGIzbGwwL241RjVxQlUwM003YU5kR25q?=
 =?utf-8?B?UDVrL0tJS29leHFsb2lidSsrWGZoQVErbE9KSHk4SnE1eHdlWVZMRDF5VlRP?=
 =?utf-8?B?VFlXR285VVFOSGJGZWJRMk55RC9URXY0T2lXaytyV01XMnZQNzZ4UXg4MVBj?=
 =?utf-8?B?MVFJKzJiRnZ5NFNHQTFYSU5sSWVoSitDQ1ZuK2c1VEJUNHR5dDVOMXNLaWlw?=
 =?utf-8?B?T0twWnM4Sk43QVJQTGQzRHRsS3VOQ2tTWlVFd0RjU294NW1ZcTk0Rk9VTGgx?=
 =?utf-8?B?aU1uY0VsK0wwc1NpL2tKYVVoTTBvbmh1Rms1S3RReUFFZlgrcmJzWkVsYVVP?=
 =?utf-8?B?WnZaSmhNVm4rb2grdmc4SGtMUWdXNzFvN05NVURESko4KzFjckw1UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 98dd6272-b7d3-4624-7e16-08df1730a7ce
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 16:03:05.1925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0AuTJ+TOiWTlXu+kuKRL+g5pEkJz6uLHTpx9VLNYJyywhJUR7ip1X5R/dquaaczF7Vmev7ZbhhmqCcGsfenXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9096

On Sun Sep 20, 2026 at 4:49 PM BST, Alexandre Courbot wrote:
> Replace matches on infallible results with irrefutable let patterns,
> which are available since Rust 1.82.
>=20
> This removes boilerplate for handling impossible error variants.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

FWIW, this pattern can be served by `into_ok()` which is in the process of =
being
stabilized right now. This is also available in 1.85 unstably, however the
methods expect real never type (!) and does not work with `Infallible`.

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/android/binder/freeze.rs       |  6 ++----
>  drivers/android/binder/node/wrapper.rs |  6 ++----
>  drivers/android/binder/process.rs      | 17 ++++-------------
>  3 files changed, 8 insertions(+), 21 deletions(-)

