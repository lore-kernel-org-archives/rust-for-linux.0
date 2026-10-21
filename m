Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792586650;
	b=eygm0NFGiA1ilJNGZ5+l9LokiAEuL8i834YIHw8emqZV3l24W+trrXk43SvKWrVhuyjU
	 hNuT4KovybMaeG1g8aC/SsbDyrDm+h55B+NG3HJZYT4fZCRbjBOzr6WoXvOBhfP0rzHva
	 KgKK/yCAAnKMEaKVig1DqGpMABBcaRG5tsMldQ7L3RycR4tP0jAw/yzDxOOIbFofFMXJp
	 qcRPzpJCy2BXhPdPyoX/vnLFLllHSkjBwHPFRlI8hXg5jCv4hgoPvm5VXMaQtAwe7ibOi
	 68onCZkrONywIq+0p1cCnJxJUm2efUuhAvOcAfvYeWfRNXmYiy6OrVon6wY37FbBAow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586650;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qiXXR2zEDH8oXnzI633cw8IvrCE4Dfx6RHYptkinm/o=;
	b=KtpS0sSe3PxIyWYW8QO3h4Kt/sBZyMYpLktO1zKQfaWVDJxsD4Do97FySSvKkhbuyT8X
	 N3HesN4srDy3acqf1C38cqyBnRm3/FNw5EsaZd/6TJ1DAwYxdZZBBOBzbw4L51Zj8ombr
	 hxvDJyeySE26dOOCR//c0XzDOGgjOSM45chDy2KuztASkXYWiI27u/NG3M24hUHrA+23Q
	 bLXDSADfitBOiyXi3fYYe2avCOnMxcgDy0mNA4k8iNLY6Spfm7AKAuG2jOdHgx6BEK6Gc
	 P1ZoY06qMf4SILSTQ4nj9ZsVSzzEkCgZ51SqoBZsSFmPjML3iA9KjlusfrZAkArPFgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=iU2O1Hvl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.138
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022138.outbound.protection.outlook.com [52.101.101.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361AD606A319;
	Wed, 21 Oct 2026 12:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 361AD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=iU2O1Hvl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYsODCBxNwY1SNirHGhr3ezv8ZZjZMwyOEOzQ81spGrrT3T40rklSaBb6sb65vJwyzwEulY+PSnx99vigVqF0i4RuvZuaF18PS5FImIMLHBJvssjHDQImfHMRSqLQvardA4BFIY/HvCyDyv7ZDaolbpf3sali9e3WKh9JOsYV02b0IFrna9b+78JUG1LxHoYwPdQVWp/5Wujjy1mg51wx4eD64jsGyXPT0E+E3PQdi/Iny7+jlLzWc2aCNfR6Zi4ooDo1ROQ91HNDCALqq32D3FObBNI6i5Xeeeb1zOP37kHtTT5gpEdOwF12fdDQylTBeYPMh6XDq5J3RMKtwHu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiXXR2zEDH8oXnzI633cw8IvrCE4Dfx6RHYptkinm/o=;
 b=XZcekQiEiz2XUBPDP/osz0b3YglHCz6tpK+RQsuoASE2iSAGEvr7cTHTjNkjRT6eFwkse+DJQfxcrhaJlrfyJTeoSXjWZ5l5neHHH9D9VJYK0743Rlzge+2fD/EhpWzA8vC2mvEk8dOMso32HIp9pV9iszlTnuUf76xmDG5FM6bEn4D0Rt9RbCOdZfL9j1dFDgHHNj/slVqXs+M1cacqvSTBBRie+Y89H9FUqQA6xtO4aNIH24SxwvAGYCD6aqf8hNP/yeWyQcQzfBB435WVJd/WSIcYSIUZ4NdtsA2+xuAW275HUNjomyZC1G0wupxjR7A4xBIpkcRHoe02JHHQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiXXR2zEDH8oXnzI633cw8IvrCE4Dfx6RHYptkinm/o=;
 b=iU2O1HvlHQc8ZNDMTDVXnoWR++VSiNPQdYUHgB4cU6z6mvGtr/j2SNesHgBzlK0GL9ZbfcoBhF+9a4SHd/uAkbgIO+GM6wvHyhfkJ73vJhx13zrsGTceXKQA/0ZqITrYcD8oFg3yuOEGXi5RzOl3qmoedzeWCP3/Megvtfacvko=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB3656.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 12:44:04 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 12:44:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 13:44:03 +0100
Message-Id: <DMAIXJB74Q1O.9A03KK0SSDLH@garyguo.net>
Cc: "Muchamad Coirul Anwar" <muchamadcoirulanwar@gmail.com>, "Jonathan
 Cameron" <jic23@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Gary Guo" <gary@garyguo.net>,
 "Jori Koolstra" <jkoolstra@xs4all.nl>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] rust: i2c: remove TryFrom<&Device> implementation for
 &I2cClient
From: "Gary Guo" <gary@garyguo.net>
To: "Igor Korotin" <igor.korotin@linux.dev>, "Danilo Krummrich"
 <dakr@kernel.org>, =?utf-8?q?Nicol=C3=A1s_Antinori?=
 <nico.antinori.7@gmail.com>, "Georgios Androutsopoulos"
 <georgeandrout13@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261019152329.620610-1-nico.antinori.7@gmail.com>
 <179258597583.20422.10358976352101642829@linux.dev>
In-Reply-To: <179258597583.20422.10358976352101642829@linux.dev>
X-ClientProxiedBy: LO6P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB3656:EE_
X-MS-Office365-Filtering-Correlation-Id: aed6d023-7557-4d2f-04c5-08df2f70fcfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|23010399003|7416014|376014|366016|56012099006|4143699003|5023799004|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rB7HpX8hFpojNCjH1fReTIC5eseX14iwKHDHk5ZWF+IprUHbve30P1IQflMJJi1d/xIpCOPdg//sBzCURNchZVjsOYXCXu+2PSoTTe2J7KjUmAZmiMkSuYAnVJSRO658+kmsdtHdfLLAZ8mPN8OsrBTUtJSYfI0efCym+pbP+Qy2nsMemUIrbW85zt9G88mM+jW9MoCeynfTmHYbXVywCj4qKYvSCNtfG7chOiXDyhq3QLNR3OrtR6zSSYQa81loLOKdF/e80+icDh/pK4Mp3/njoNbVnsLUTDqadPAfwe7SjnWgqz3q38IF4ky4eZFVfAqStZH0G5zvKKKpway0xrz/apbQYiN3pdoi2I3zbnwgOjyscesiiGknaImyGlxe4Imae3apeJ5ofZmmT27Uw5wQvpp7PWYamOGiB9HhNyZndnsZlM3nrUUzPCFfQcf2unN3zSB7uZJyDf2khtlXY8L3Um3GzQMwZ0InnxayMotgZa6y8rlH/4xE/AeoVAsb3M/xcUO0yTt81m7R0CG+PvjAfvwrufUrRhiYLH1pOpqQ0xDFzN2h4lcGqzCjIZcVnti8eJWKpxwc39Mq1KVIrmYNvLyGDlxYqb5s/XLMj1XYBkPgqp5qSqa5p/1pBmPs+06scVrzsAR7mmtehDmOXnN3GLFfH6Cr4/rZJ++miqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(23010399003)(7416014)(376014)(366016)(56012099006)(4143699003)(5023799004)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d29STDBSMHBHMjlEeHhEbWdjTEZRVGlNaHJycDhrVFBqL0l2YzV6eE9Nc1Ev?=
 =?utf-8?B?eDFOS3lDeEREejlic3k0cUZkSzR3Wlp3cFZqd3k1Q0czYmZOYUo0ZHVZMVpC?=
 =?utf-8?B?K0hING85ZmJtOVpCKzNMZXBHMTlNOEl2TEtXUjR6MVMzL2RlMlNJWm1nYnpn?=
 =?utf-8?B?dzZHUTFySVIvY0RjQlRYZTRJa0hOOGRMelRCbHlUQW5qb2VzMTI5M21pblNT?=
 =?utf-8?B?alhZaFlhV04yK2JzMTBEWHkrT1ZNY0dWMUFZUlYrM0w2LzNnTTZvWlFtamM0?=
 =?utf-8?B?TTRNblhIYnJRaUlaR0sxM3VHNDAxcXZwdnVRbndFVGY0bkIyRTlvSWJkbUFa?=
 =?utf-8?B?T2VteEQzMm42ekJQSFBQWmJQUmtLSU9BeCtSanc5cGRsK2lVUjhYSDFYS1p2?=
 =?utf-8?B?YmpNUG10K3JBSlRKQmtZMklmWDhPQW1KTm5JZmxaZU1JTzNrTGtDTys4NExQ?=
 =?utf-8?B?ZnFhaGV5UFZPaHlnby9KTlFWZ1lVWnZiZ3pGSkl4OXkzRGgwaG9CeXRLcDJ4?=
 =?utf-8?B?Y1VIM0pnNkFualQ3bTBjM2swd2x5a05HOXAzL3JKb2NwWTdDMW1UYWFtdVJt?=
 =?utf-8?B?MFhYTWJUcVdDMzRLYk10Q1A1VUlMMk9rRTV2WkNxcysyTWNpYjE1eEF1anYv?=
 =?utf-8?B?MXlCT0hEZEVVdWZVVEhqWHhMOGJMQlJSUm92aG5pS0Z3aFIzZjhFdFdlbjJD?=
 =?utf-8?B?aHhPZThvTGNEbDZWRmg3RXRrQ3Y0WFFkbldlNmNiMFEyWitaQXFvVXc0WklG?=
 =?utf-8?B?VWQvejVXWkxhYmdDRnk4MHVydGhPNU9TYVl4TjFWQ3RnMFkrakE5QitZblBC?=
 =?utf-8?B?d3grbmtNcWo1UDNxUENEZlNiM1ExaC9VV3NhakxGM3FSeXBJTEFOTlpaWmp2?=
 =?utf-8?B?cndrUWZqQ0I2VVdZNTc0cmRsYis1SjNSdDV6cTk5OTFOWSt6bnVzczVVdkVV?=
 =?utf-8?B?KzNRNGdQOGhPNVc3TzFFQXlIUGc2OHI1MEhUKzhPT0JiRmY4TnI0bG93Z0hu?=
 =?utf-8?B?VGhmaktabGZnNDhVdk5sYkg4SGRBNWlCeERtaDlVMWdmd29sRnhwVzd3bk1w?=
 =?utf-8?B?WXcyNXNmeExJVm5sTUFOMTI4ZXNDbnU5Q2lDZHJIVkFvZkNkNXQxd3RwUnZ5?=
 =?utf-8?B?NTVER0g4cU5YTllwbSt4SCttOFRRaG9NRGxZbmVnb0lpbDVVSFIydy9scXdK?=
 =?utf-8?B?bmx6L0g4MGtTUlBhN08yS3Z1a01YWVYyd2ZQMVJkRTN6SzhNR1J2bkphUmpU?=
 =?utf-8?B?Tmhkc2gzc2RLVzkxanVneFUyaFRZeGVOQUg2bVhUMnVEelo2dWdLK0ZDNHR0?=
 =?utf-8?B?NTNsd2VKanlmeE94SHBQODNKbWlzbjVjUVZtNDNvSURHcGRFanRpZk1OSlh1?=
 =?utf-8?B?VGFOM21oN3R0YWJwT2E4a1NKeUpUenNLemxJMUhHNCtCYnFtZi9YVGN1T3FZ?=
 =?utf-8?B?UnVOSkZYK1NOdG4vTmRrOXhoRS9ZakplcXd2Tzl1cjBQa0UwVk9NSENhN1Zi?=
 =?utf-8?B?NUNma2VxT3FrYVpKalZEOUhWZFRaSnNzeXNGc0Y4OUlJVWNhQ1dpNWZCcW51?=
 =?utf-8?B?QXl1Qzl0a1pwRGdVb3RBRUJLNFBVN2V1cUMyUm93SDFLeHVvU2NxOEFhYXpy?=
 =?utf-8?B?b0dIczQrVGs4RnRwRGRiTXVnUUZia2hPSmhjNTIxNjRvU3NtcmRLUmZEdW9o?=
 =?utf-8?B?eWpKMXU1U0tZcCs1M0xaaTJuU0p1bk5ua1NHbFZIZXg5UHpXMkVoTTYyOE5w?=
 =?utf-8?B?b0ZnbzdoalJlN2Racyt0QjQ2dzFtTHdHZ0VvT1h1QS9KdFdBT2daenVuYlV5?=
 =?utf-8?B?a25VSHBJTnBoVmM1cWdqT2t4dS9XQkxBd2EyUm1hZ1dUc2tyTlFNMzBmaTRY?=
 =?utf-8?B?ek8xZEpGMy9vcXl6WEdnNnhFRlJsYloyT3grcUdobE9CK2F2clBNUlZ3czdU?=
 =?utf-8?B?cit5c3pCd3NHQWlRR0VFS0JBaFI5ekwzV1BjTVlhcWJhL2RNZVNOWnB1WnlL?=
 =?utf-8?B?WWIvb0JZaDdUd05OR1dwL0pjNmVKdElodnAwR3QyditjdnAycVZnVmNZR3J1?=
 =?utf-8?B?VmlrQWUxTDJobWtwSWp0MVV2RTdaVDhtWXZzMEVXREpKZWVBbGR5UXNkc0dM?=
 =?utf-8?B?U05hSzBGcWNFNW9PV1RQa1p0N25HVnJMUzRmTXEyZlRkUE00WXA3a0NqTnJE?=
 =?utf-8?B?L0NuTkg5VFRKdHZ3SmdpeklwQlVlOExST2orRTFLYVdSRGdCaTM2WDRKMGdN?=
 =?utf-8?B?VnhwVGgxVFc0aWlTZURwdGtzQllvNXFvL01zaCt5eXlIL3N2b3V0YkNNbHVh?=
 =?utf-8?B?SUxaRFAwaTd1NXVQaTVOWTRTY243K2JpQmVXVG1NcVhXbjRzbGMzdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: aed6d023-7557-4d2f-04c5-08df2f70fcfd
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:44:04.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BElEnEnph2vLz5L22aDyHe0wDKO0/Yt0Q0FmzPJ7f54cIUJsH7pdSL9BcxoVpRohMrC1aaXgRdLxE603cp6aVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3656

On Wed Oct 21, 2026 at 1:32 PM BST, Igor Korotin wrote:
> Hi all,
>
> Want to flag something before this lands -- I gave this an Acked-by
> already, but while reviewing Muchamad's concurrent AS5600/IIO series
> (Cc'd) I hit a real conflict with it.
>
> His IioDriver::read_raw is called by the generic IIO core, which only
> ever hands the driver a generic &Device<Bound>

That'd be a subsystem design issue.

In the latest device driver lifecycle model design, class device must not m=
ess
around with parent bus device. It should use its own mechanism to carry aro=
und
private data, which is initialized when creating the class device registrat=
ion.

The callback bridges should simply retrieve that registered data and hand i=
t to
the driver callback. The driver can decide to put whatever it needs there, =
and
this include a `&Device<Bound>` of the bus device (hint -- you probably don=
't
need it, it should just be a reference to whatever bus device resoruce the
callback needs).

The need for conversion is a strong indication that it's not aligned with t=
he
device driver lifetime design.

Best,
Gary

> -- it has no way to know
> the device is I2C specifically. To do SMBus I/O there, the driver needs
> to recover &I2cClient<Bound> from that generic reference, which is
> exactly what this TryFrom did.
>
> I checked whether storing a handle from probe() instead avoids the need
> -- it doesn't. AlwaysRefCounted is only implemented for I2cClient
> (Normal context), not I2cClient<Bound>, so there's nothing you can hold
> onto from probe() that still proves "currently bound" later. And there's
> no way to get back from Normal to Bound (Deref only goes the other
> way). As_raw() on both Device and I2cClient is private to kernel::i2c,
> so a driver can't reimplement the conversion itself either.
>
> So removing this outright leaves no path for any bus-agnostic subsystem
> callback (IIO being the concrete case, but this'll recur for SPI, HID,
> etc.) to ever recover a bus-specific handle after probe. Danilo, you
> mentioned a fix tying the lifetimes together properly
> (impl<'a, Ctx> TryFrom<&'a Device<Ctx>> for &'a I2cClient<Ctx>) as an
> alternative to removal -- given this, I think that's the right call
> instead of deleting it. It closes the actual soundness hole (output
> lifetime no longer independent of input) without removing the only way
> generic callbacks can get back to a specific bus type.
>
> I haven't pushed Nicol=C3=A1s's patch to rust-i2c-next yet -- holding off
> until this is settled.
>
> Cheers
> Igor


