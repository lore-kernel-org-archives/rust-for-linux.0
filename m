Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022091.outbound.protection.outlook.com [52.101.101.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69423806A0;
	Mon, 30 Mar 2026 19:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897668; cv=fail; b=ZRWCV5s3OdQJYvkSgK88ArEDBGVanDld9+bQTPlEobAaIyJbO6V24AeuPF36zqWLS9nN5Gt9GijNXwJaSsFsln1RtJqUk6iC14JXDPnrPeta81D86ZsotejYed2IEt8zMMpxKrYGOSdl93o88trFOlZim2xbf0ByNsxxK8Lb30w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897668; c=relaxed/simple;
	bh=ujPlAbwoFuGBSIv4XhwQ7h1SwJUZZZLq1FteBuZYoyU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lDluVcfB/pJNplKszbzAVs5XcE47Xica/I1aaX9qltxe9lBQwRBWX8cFjnmDR1dHLivGqblic1WikclcOkB5Rwql+qYGq4lHOxDj9kNEBXa72tNML3mmA4N2YcwVv7ufvXM87kCLnHQ8lAKdhm+X0Px21qj5QtQBsVwM2CE2DNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Yg5UF9Rt; arc=fail smtp.client-ip=52.101.101.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Yg5UF9Rt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLLPKazf4ojHxtg1SvCbY4uzpncIKGQmp6XUfjz0FTtr7lEdr257OQg3a9/2+PJaN3K9CI5LW5CytrcNJsZeeOoUFQhiwInsDmFMdpHF1AE7NCKthxZO+JGqdduWqUwq++lt0B4GvYUL2CriDXJy9u7sILyj3wG92wvt5lOm3Tq9Tl7o722/N9053BdADkvM0Ru9N4xhxN/42OxIZbL/zwu9ywXmCz8bDoYNCkIA3IhI4wCc8Qr8Va0Vs5Rk2/I8N9QyAf0xksbqHUShGy2b/h37/xBbH+hbPIEp2UxajU2AHge/+BF0SZB5Z9swVawjU56oc0Wy3jRw0wPDMY8LhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujPlAbwoFuGBSIv4XhwQ7h1SwJUZZZLq1FteBuZYoyU=;
 b=j0tDisYwdOEbbVQZgQLgerd+/RoZo9+dQuOnTocm8JMZU5wj5xfzVqSiifBGnjtcm76ya0h8L871qQft4J823ItFe2REZNmYEmFo4Fsn1QpJxEiw8H/VK0PMjDjY3wVxV/NMLIU3ltik35BAzTmaf62JwF60/5/jNQx08H5aTNTfoUlP/sd2Z/IfY2u794GKrzz8kOHXiwXwWaYRAAXYbBHtWLwXuTyVWQDdgOAHiJQfo97qy9mlsh6fXMb/eqN9ldVApm1wlzucD0mtszYMHIVGD67RTznDeB44OGIKl6g/TYEPB/Z+ULgZwOJU2gxFQ5OaH6r/rirYyR/7NkH+eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujPlAbwoFuGBSIv4XhwQ7h1SwJUZZZLq1FteBuZYoyU=;
 b=Yg5UF9RtkwhvF0QKtp3qcrCxG+OH2LvB00mq1381WFnHZyF8CgstE9wnUR4kM4AYwsqObw3FpV87ZUX3JEtzXdQZn+7Qleimtky69MZoN0q+8kspLEBIWdaETwZyHHsbiIJNDKadng8sXUwyCnqjdY5Wkp4KwaKq8F5bhiIg0oU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7292.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Mon, 30 Mar
 2026 19:07:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 19:07:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 20:07:42 +0100
Message-Id: <DHGCPLMB2J2T.1Y0V6KQUKVGPJ@garyguo.net>
Cc: "Zhi Wang" <zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dakr@kernel.org>, <gary@garyguo.net>,
 <aliceryhl@google.com>, <bhelgaas@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <markus.probst@posteo.de>, <helgaas@kernel.org>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiwang@kernel.org>,
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add fwctl driver for firmware
 control interface
From: "Gary Guo" <gary@garyguo.net>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260305190936.398590-1-zhiw@nvidia.com>
 <20260305190936.398590-3-zhiw@nvidia.com>
 <20260330125839.GL310919@nvidia.com>
 <983c6463-3c42-4915-b015-7a56c4f38615@nvidia.com>
 <20260330181832.GV310919@nvidia.com>
In-Reply-To: <20260330181832.GV310919@nvidia.com>
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: f4116770-885b-408e-bb0f-08de8e8f9ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6d1J4ldtkgDqyRVourQHUKU6FxidcYtCYzAFPQSJup8hJCCXU27XXmoalfIZshrVQjAGaTSTzrqfxj0MXT+EdZBewq6isnl6S7qskQZqNPiKkXfLrKvHaL47zU+1mLSWC22LbZ9dDkuZvRw97cBfcddpP8n5DyO+4MfzaUApid9kvc1gkOmwEbLki+pCmabXypICjLmnAuyqYhJ2OuwvqoVQbnTaHcjUhYKtPqWwRheLV58NRHx26a5CIvoKCtKOi1U711s9m6rAZlfGlgZdZ9iNgd9C5NQr4ukDQtcOcbIZ9FbzV87OKA1CAbiI/1Fl4ky0kKEIdYfod3f9NYpXn0dhq/0kwcTsTlexANZuQ74TYe6lcs1zxA386PU8QEK5D27K8JPDzNC/sRVrZxznEk2x5ogFmHeXTSS80xbEubBIxEjj93GXrJkFTbz4zND2fVkAnztt8c2AtZTN8Thq7jrEGolYimWQlziB+LgMEv3YvbFGOD2sP4leprQjy2Xs5DiTcxIfKXGcIkgdsRM/psyrIhB0N21p+NeeV3sGJtcskb4b90j0F9RggolEqaYszW7G6i7bU7iOFprlx+kX3CEbIRlFKCxObxVgtPH07inlX5BKg0X9YFosAtzROxleA+7L7mIW4ysQ3yROHxsVAOWqYm4b92pG47uY8PAWcyxpkOfLGDLIfjjp+IfYWgaEFrjXREBuO3B3MNCLoswWTvTy9ZDoYj52p/etFg56AVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmRLNXlSTlZhZUFpK2hlWnAvQ1o5dVFqalJDYUF5WEY5RENRR1BRYzM4NFlL?=
 =?utf-8?B?VG9uaHdXdm9nZU1MRDkxUElIOGJyeWJsZDJFMndpbXhISnVJcUtIRmZpTk16?=
 =?utf-8?B?Mi8wejl5VDhtNHNNNWxaOGNEYkhicCs3ZzI3U1FFcDlKdmNqK2VidTFWejdJ?=
 =?utf-8?B?STVFWnBFbnlWUy92ZWVvREt5Q2dsOUR1SVVSc0Y3S1UxeEdwMWRKQnN0Nzdw?=
 =?utf-8?B?ZmFjMEx3WkJlbDB6WTAzbVlEbjRERG5Pd2o5TTFTaS95aCt1cTd1V1YyRWtO?=
 =?utf-8?B?ZW04c2p5VzBYcG1xTFJvWi9NN3Ivb0hRVkJzZXZpK0UvUzYrSFNRZzFLSGwz?=
 =?utf-8?B?dFA1MC9RK2VVQWk2QnErYStNQmEvUGpJT0tWSjI1b1ZCVUNta1BsZzV3NzY0?=
 =?utf-8?B?YXlJUEZaaTRhLytyTENGV0dzZWVYMVBpNE5sSU9UTzUySEhNUyt1UHFCYmhs?=
 =?utf-8?B?RVczMmg2SHlXY2lwTFIrajhPT3l2WHVGOWRJYkdRaWN1NjEwQlNGSFdab09X?=
 =?utf-8?B?RGdnMHF4blJNeUNScU5EdXBsVEticTZXcjk1RjNPU1BWckVWdWtFWVNDRFdN?=
 =?utf-8?B?Zk5BNUVobkdrWEFsZmNxWkJhWlNENzUxQXVVVGR1WmhNcEhiN3drT1ZRa09P?=
 =?utf-8?B?MHZGblpGUnRHV21YOGN5SDNSZzNsc09QdjVDdDBUWWV0RjNzQlJrN2N6WE5r?=
 =?utf-8?B?NGxuRzhzTURrZWZES1pvdmpMZDdzM0RrRG5lZnJONnE2RWVQaDdISXo3YzJr?=
 =?utf-8?B?OHl4TkZKMEZDbWdXYUlQRGZmNkcwN0E2L09hWXhWSE5jMG8wdHpEenpWRVJq?=
 =?utf-8?B?UjNQY1Y4V3cvcnplZTI1RG1TN2oyWjRXN0M4QVNsaUVWTlV3M3R1RWR6Tkg4?=
 =?utf-8?B?VllaeGEzU29wdi9XaGkxY1BqKzNDbkRsZGlraFd2aDFKQU52cll6Z2VZVks1?=
 =?utf-8?B?am0xRmVyblI4UVJrSWYwUWs1RU1PSWhuTkFIYXRGN3Bpbml1cUw2ZDFZYTVw?=
 =?utf-8?B?cVN3dUlPQWFWU3hraVVBbStZRmtHbkc4bzdKYzl5N0hVUEVkdERheGEvSTRw?=
 =?utf-8?B?cFYrUDVGVm02ZlJKUlpXRFIzdDk3MU5uOGhvRkg2ZmhBYTQwVDVmYjd3VWRH?=
 =?utf-8?B?cGxBTEVKTGczOVE1S05kWFhXRzQ1dnJYc2tuMDFucmNxdjNQWE54V0RrZG1y?=
 =?utf-8?B?aHJNZ0Vta0NwTm14KzBWV1B5UUVNaHV4NUFReCsva3R1SzdCRnBJYW5xRUJR?=
 =?utf-8?B?Yy82M2MvUmZzcUVLdVljSXhiMXdYVDJXTjFQTk1wMnNMV09BTitTbGVSNlV1?=
 =?utf-8?B?dS9YYVdQdU9vUmJhMkxaOFk4YWRIWUo2QURsN1gvRFA5OURuSHVZWXc0U1pm?=
 =?utf-8?B?d0FDeWFFS0cvNU5KMzJMZWgzbk54YlJuK2JpdzNnU3ZVdHZ5RmlqR1BsNFVq?=
 =?utf-8?B?V3dUT0N2ZHVXRGU5elU1Q1I3Yys2ZWJCZytEUlRDQTR2eEpJQWI2TTI3bFVa?=
 =?utf-8?B?KzFDWmRRNmVCMTBCNFA4KzVrTjRCZ0VxRC9RYVo1SHUzRXdNR0NqVVR4MWxw?=
 =?utf-8?B?Y1ZXSklIYW5ndElkTzhPb2ozSEd4TUlxS3cvK3gyOUQveXFncDJhMTI2d01X?=
 =?utf-8?B?eDJ1ZzZ4clRXS3B4ODlrclQwdEVHZzBlNjdEVDBBdGlGSVRtUVM2N3ZLN3N4?=
 =?utf-8?B?NUJNUmdxeFZnelp2NVNhWDNaMkJsTkE5QXZZTVptS2xHTDRST1lETkV3NXdv?=
 =?utf-8?B?UDN1a3JPZVFIbWdLTmt6UTJVa0thY0pFWE9MK296TFhzL2lCNlpjdUVzZGdX?=
 =?utf-8?B?bGxBOTQvUHpKN2VUM3RpSWFRbGVSa000a1pzOEY5OXZHb1hoRUk2aDJRWHI3?=
 =?utf-8?B?K28rMmkxcVczazc3cjVoRGczVzNFOWpWd3pNVzFtMHRFRjQvdFVtU213UE1r?=
 =?utf-8?B?TE5XcHRwT2RPTUFYVkpQeDZIaWVCVWZxNEZ3TEJWalVXdmlnY2I5UDZlc2Iw?=
 =?utf-8?B?R05oeVFEeGkwZkx5ZDBtSEl4OE9nZDdJVDV6RmcvRkRta1VoSjNZM3VTOVVx?=
 =?utf-8?B?QjBMUUMraXRGNWNmREg2bFpHNUUwSnJWbDZaS2FGK1RrZk42ZGgzd0NyY05W?=
 =?utf-8?B?QWgwbVBrdFF6dG5XRTN2SzZDUCtTOEdTeVhXUlNuTkNOYmwxcHpBWFZmdlBY?=
 =?utf-8?B?UVlxWUlXOWlSRlEzc0hGTXh3ZzJvc0tjbCtPektobDlSclZ2em1Qdi8zNlh4?=
 =?utf-8?B?QXpBQ0tPN1BOMTNEV0tCZnVaNGdXaVVxQVA2K0ZoZ1o4RzhLODNEQnFLTXdG?=
 =?utf-8?B?SGl1OG50OUVuN3dCaVVQKzA0N1dmcnVnWXE1OW50djFDUjc3d25hZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f4116770-885b-408e-bb0f-08de8e8f9ec8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:07:42.9566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G39RA1333VeC7NR5dwIMrF7qNKFj02HaFgqit7wCEJPG0z7ZdKTqfUpDT7UOgSt5UdfNUFWgNnoFRLlJRAmFHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7292

On Mon Mar 30, 2026 at 7:18 PM BST, Jason Gunthorpe wrote:
> On Mon, Mar 30, 2026 at 01:42:07PM -0400, Joel Fernandes wrote:
>
>> Just trying to confirm my understanding: Doesn't that mean
>> NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE becomes a part of U=
API
>> then?
>
> Yes.

I think it is probably undesirable for nova-core to expose GSP firmware det=
ail
to userspace directly.

>
>> On the one hand, there is the argument that userspace should not
>> deal with GSP-RM specific commands directly (lest they change in the
>> future or get removed or whatever, and nova-core is the
>> abstraction. On the other hand, I think idea behind fwctl is as
>> Jason put it above. So which path is correct and makes sense for
>> nova-core?
>
> If you use fwctl it should be as I described, it is not an generic
> interface to send SW command to the kernel, the commands have to be
> delivered to FW.

If fwctl isn't designed to provide abstraction layer between userspace/FW a=
nd is
for raw access only, then an alternative mechanism should be used instead.

The cover letter says this:

> This series adds a fwctl driver to nova-core, enabling userspace to issue
> firmware commands to the GSP through the standard fwctl ioctl
> interface. E.g. uploading the vGPU type blobs and managing the vGPU
> lifecycle, which is previously implemented in sysfs.

Zhi, is there a reason that sysfs is undesirable interface for this?

Best,
Gary

>
>> These are transport-layer headers for the GSP RPC message queue, MCTP pr=
ovides
>> packet framing (it is a standard protocol like networking protocols) and=
 NVDM is
>> NVIDIA specific header carried inside MCTP. IMO they are internal to the
>> nova-core <-> GSP transport and should be filled in by the kernel driver=
, not
>> exposed to userspace.
>
> That makes more sense to me. I would expect only the actual payload to
> be part of fwctl. Any transport details must be managed by the kernel.
>
> Jason

