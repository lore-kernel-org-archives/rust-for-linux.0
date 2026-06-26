Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B83D5235;
	Fri, 26 Jun 2026 06:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454761; cv=fail; b=NBlAXMJciLzO7a/G0W6CRem4aZFAfvTev2uNT1/JG4KgqurHkJAa0U+sjHbQuNDHoMJ/nMVr1NEEKG00W/tpcYZkSty5E+1GT4m5ttqMjKHs6S1smPcafrZ7EcFsn7YhxBrv1mCBUoR9Ld53T0fnhgg21RM1xixIs17puvXZGNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454761; c=relaxed/simple;
	bh=JMjJ4g7Q7MqtH/Y+8ICI0X012BvqR7uvA6V0JTfQpc4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=KVeu2Q81ePpfrMPFhCZauxU9y7wFZDuVtwdNV/gjVAgiKwoR1lLCazFi6PSZLtyXIKbtyX0d0cHDllwrDBm6CgfG/HF+VbGwuS/eEw6Wm9e9ZvrBGsJ1DdSxIaOErJsHdpmqXoft+FkCD1uiDlhIH127t3NGNwN5Mnf8L0w0zSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DA2RRu5e; arc=fail smtp.client-ip=52.101.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DA2RRu5e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blII3NEmpcyFwrO6iNlNbr+i6uztOTZAqYDx4KuJhXUmp9dNFGsnwO+F+lyHJyPm0zwyrNsmKOl6Df79FNY26au3c6I0Gtf3mkZr6QplKGDL2lgm313UJvOfy/IUxHBHzauxeM0bz7U4EhH6LBUimrmdPPu0yzGhItcEP0kxVlG9NRssn5GWDH1SWWlgYBdgXBGt0RDs1IOLdVmUoAi49cDhwmC1tN6LouTe59jtWccm3oYJ5Q+lqATtqOiqUeMtdX2cTctql2PJgKggWLsDpVKzzaFCO4FbcrRyT7+ghTeIuK0m8YlTcsM25EVih/2f/5xtfRt0iSOU+d+hwYPRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMjJ4g7Q7MqtH/Y+8ICI0X012BvqR7uvA6V0JTfQpc4=;
 b=DOcxb+upLuT1xvynrZggVky36Izop6me1OkFVDnBdEXh8bXDp3tGy4BM93Zbb2lTA4TpKVvkQamK/tm7sQfMefrBTvhAR0ZOHp09dAGSvnBMZIEPSS+X1uPNl+UD6bXnMO8YU6ZyaFpqMPSEX+wtWx1FBJmtYA7NzP92i5C2KKyjf7WaFsydRAXYJWgWjxoHd0+cCNNoXyEK4rueyMg6KKxcXRVF6ISFGmu9N73UfMX9uff3omc1GfudIo4inN3uc9yuhlbf5D4lLEG41md3/n5aYv1YLTzmJtfl0KbJnozMK8iYng5i3Q5UajK6RpM6pv9dFkQrRnEN8N/FcnHeEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMjJ4g7Q7MqtH/Y+8ICI0X012BvqR7uvA6V0JTfQpc4=;
 b=DA2RRu5ezHS2iUV6QXyLz6Xt0upm/rfkSBqS+CptrGHdMzund3QSbK3P6lzwz7AgTfdYBLTrmZQut6F1zDlkGfrZuKzBHl5Gx5J+0RtnZ+ilrmSy+mcLXh0pqegyKrU/kPDuIsZ7X7C13nDbcS/EuNzGsfyvdZYDTmzHRAbpMN1l0+PftavfVlgB5E9JzRkxPS7ByhDaAcSEc+CM7IBAD3Hg+nzJ1n29XDZt9nZLZABTnHt19crldz+sON9vA23kFu9g3bB7t/z6xpR4aDdXHElwjFBvhdNNqbbISligOUsWmiNigFHG2D7Jq0VtUB0VqvOEd01KocB0ZOEwKi7kZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:19:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 06:19:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 15:19:09 +0900
Message-Id: <DJIRH3MNGBR0.1N2M71G4C60KO@nvidia.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] usb: rust: Use pin_init::zeroed for usb_device_id
 initialization
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
References: <20260625224927.404258-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260625224927.404258-1-nico.antinori.7@gmail.com>
X-ClientProxiedBy: TYCP301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b21c49-645f-4c6a-f65d-08ded34ad780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|7416014|56012099006|22082099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	jGt39F05+VPUEp+RR0GArMsYWRRPta5z6vFlxy/+kKW4g76XnhWP6SZog2QPJPfZZwpUujjKvKm/9T6SblPeSsuAHVUoiFlJIR3irOYjORQxAD3LJ9JCZlF+DiiNlnU03Zp9zaEHm+gV/GsFa+JNZJ18vwKjyLYZQrPuVbbSIDAjOg3x4E1N+LOAwRW8wfW19lRpUwAKYJ30ydV5/mX8eZ2hMh9Yovv+FHFbkVfmM1eWEmh+gvY7WcsZzxL0qUjY5uVSTh2R1l0hlJnMfF81IXKrWBK8DYUjbHIbfRnkf1BovYEvZ44QoodXrnzqg2LpT4VB9HVoJYRAPSBNWCYlmufhAbjus0WZB7H4X7GYbTE7mIuExRX+oYr9Zmf+FmdyJRRgNCyV9G+MtBPL4QNHsNNh1J9LS/k9N3rsQgRTaVsNwlwI9HaOhFm80EsLhnrll33kAu/iB/6EuuumC+gvF0BucIDFQIJvY3kq0H6CGICtpGPch67n+I6MwYrCVrc/dXJ5GHrhOMr+LF/gU/fyGolVXGqf6eznVNx5k8g5kh7yCjXrgAili1VT44A2Yby1sg9e4y6iPu5rNz+PniP11W6bDxh1undP+LXpdm4Vb+Pu5ojrmXhxPvcXwneNKXrqWL/ZJM89Ym1ZEr19rthZFmDQN3Sywe6AoXkZ4DY/qIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(7416014)(56012099006)(22082099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aks5YlE3T3o0M0NMQWNJdWo3eVNMenI0U0hrT1J4N3I2YnFsd3g1ZGVqZ0ZP?=
 =?utf-8?B?OWI2TUdMOEtZWlQ4dG9Hd0w3a3l2enNaZk5kclU1MTI4TmN1dWtGOHZiLzBs?=
 =?utf-8?B?bVZOdTRRVWNZWFFRTDZ0Sk9mVDFMdGxxR3BsWWowZEVhTjgxWWFQOGZPVU1N?=
 =?utf-8?B?aDJoaTdib21WN1pINUtWdzRrMzZ2MkJJdFVKSHNoS2tJYjFYYWQ5L20vMTFQ?=
 =?utf-8?B?Y2tod1ExbjdUQjk2M1FISlFPRFB0SVJHdS9EazIzZndWeWpLNkdaNlFXbEFt?=
 =?utf-8?B?YW55VlY1U0hJaTJpbExOUVB2NWZZYnJaa3hTdEY1dWJWTjdRdHcwK0JxZGxN?=
 =?utf-8?B?cmtHWFRKMjFRd3ZIQnBDODFjMyt4bDlQaHZJNndMY1o3VDEzZ0EzU0RzV3VD?=
 =?utf-8?B?SkVBYTVVaEVUcURkNjBrR1RZYXJsZDNUMnBkbWNwMnpPdW5aL0RpTVFGcm5L?=
 =?utf-8?B?UzJaZ1NrQlEvT0F3MUVuMjF2ZGw1cGM0bTVMTkVUZmpNaHU3UHlPQ05mazA5?=
 =?utf-8?B?bkIzRmpIeWxiVFkzdkE1SWRwVWZMOWFjY0tMNDBMUlBkVFFOVnZTTURNUlNi?=
 =?utf-8?B?UktBNEhXWVByc2pWeFZ3VHovUHlHRC82Zk04aHhwdFVzUC9xTkRKMVh0RVRJ?=
 =?utf-8?B?QUFzVGNWdS9yTVcydmtoRWtpb2cySStvVmpSRk5QbWxqMU1MOWcyTWVzeEla?=
 =?utf-8?B?QWFLa1RRdkh3c1o5OGxrL3ZOZU9ZbzNnNUhDR3JGVVpzUlk0bG1lTG0vc2l0?=
 =?utf-8?B?Q2hsQVFoVXBIVTRmQVlOZHZxSnpFRlNJOXBRcEl2YTBNL2JYZGErd2loSSti?=
 =?utf-8?B?UFhkdkQ5RGd2bXY2M3pNVW5uUzlrMEJ4eHBoakpWcGhtcTEzR0IxblNENE84?=
 =?utf-8?B?VUlvbHhaemFCZTVDRFBFRzhDOFE2UFpWRE8yK2xESTZ2UnNrRnh3RXZwS21a?=
 =?utf-8?B?MHl5cnhyNmxLdmxHdTF4WVhHaHovSFRXK2xVZDVLeGo0d2dJOHl5VDNjREpE?=
 =?utf-8?B?dGRNTlQrOUpDbmdYUWQrbjhRZVo4NVBPNmdpdkZxRExyaFJyTDV3WXJWOE1M?=
 =?utf-8?B?TDBtTkt3ZVBtekpwOU1mdnAyT1dNZUIxOUVkbkp6NU81SWRhVUV1ZmwweHVz?=
 =?utf-8?B?WitGWWdVSFlrN0dUNlJ6aXdnM0ZOaFQyQzk3OUIrVFhpazZFZmx4WHFUbDVa?=
 =?utf-8?B?NmRCdmxrS1Rmb1VabUdZb0lTQ2UwOFZVY2xyRWgxblVOR2k4bFV6MEdlVG5x?=
 =?utf-8?B?ZVozMUw0dVVkUTdYNmE3OXptOHZqNW9nNWdYZ0FFQU9JTlkyaGNiS2ZUOFVT?=
 =?utf-8?B?anRMQngweEtURVRERWZtVHpia00zemhjZFdCblpVUGpsTUlMdVd5RFVMMlYw?=
 =?utf-8?B?clU1M3ppS2pOVGUyazNoQlVKWjhaaExuVUNRMlR1NVZqb1ZoNC9uODVQZUkr?=
 =?utf-8?B?N2VrZTZ1ajd4dXVuNTNrRnZISXlRWGN0SUVUZkZmMTBJTGJ0TUU3ZkZ2Z2Qw?=
 =?utf-8?B?L2lBM3BpTlZCQndldnFYUm9JVDg4clMwZkQvcncxbncwNUNFQUx6Nk80WHpx?=
 =?utf-8?B?UCszWmNVQ0xJOXBaeUJMc3VqdFVJc21ieklwclYzR2NBL0x4OVU4N1htSW9m?=
 =?utf-8?B?Nnl6cU5FSkR3VjJlYkNhMjhYT1l5cHc0eWZUcGFxSXI2SjRLa2VaL3NFdFhH?=
 =?utf-8?B?NmtVbGZQZG5vakxlT21PRk5TSUxudVQ0WitLKzF1Mk50QnlKcDdDWHBtOGhJ?=
 =?utf-8?B?NGxRTWk5ZlVjcWZDci9iVFdBZGRnWmV2S2x1WnF4c1Vmd1Q1djZEWktPdFBv?=
 =?utf-8?B?bld4eVlpKzZOa1NvN1pQbUxLTkNIM092bzZDLytoMC9lZnFnREFmM005ZllK?=
 =?utf-8?B?MjhnZU0zNWJ4VUk2N25haVdyalEzQlJUdTh5SUpLejVsOW5NUWNCQU43S1ZS?=
 =?utf-8?B?QVYrOHdwbkxLT2lBM1R4d09zSml2NDZGMENUVnBHdHJic2hyaUZmMDFteTBq?=
 =?utf-8?B?NHkxSlZkNGlFay8yNUhab0dCVlE3d2JJMHpFWVN0K2dXQ25FbVhPeE4zYmp0?=
 =?utf-8?B?K2lXbngySm1YWkpCS3NxZjNEUlFyeDlRMEN3VlpNODdkQytqS014SGRJRzVS?=
 =?utf-8?B?SHZORStMTml4TEkrREF6M1czTVpRdFdGS1RqUGFEM1RyK0QxZStJWUtIbHRw?=
 =?utf-8?B?aVROZWo1ME1nMlhPR09VMjlkTjROY29zQWdZYnNlamFQSVdWa2Jna28wZTNh?=
 =?utf-8?B?aklVODhxdS9nYlJQMUZqUlNoWDBoRi8xT2gybzZWUDNld2JPNEZVVUI0UUVD?=
 =?utf-8?B?QlJBL1lwZDlHTmhoRUZpVUc1Ymp2WFVicWQwMWJEZmFYZUpHZmRXc1pHNktL?=
 =?utf-8?Q?OIBG03EybBw0UUl+N3fSgWpKNJpm25pC0aeuK+eMqYNiL?=
X-MS-Exchange-AntiSpam-MessageData-1: cdxY+MNFKooXCQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b21c49-645f-4c6a-f65d-08ded34ad780
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:19:14.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfGXS7EpRmKrgHYl+e1vzNnYSrQGynYGW5FLSstOoGOyoerqXnt4ZNOCbmFCQ4hGWpkMdTkWVlcSqw1OS9kgtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707

On Fri Jun 26, 2026 at 7:49 AM JST, Nicol=C3=A1s Antinori wrote:
> All types in `bindings` implement `Zeroable` if they can. This enables
> using `pin_init::zeroed()` for `usb_device_id` initialization instead
> of relying on `..unsafe { MaybeUninit::zeroed().assume_init() }`.
>
> This change improves readability and removes unnecessary unsafe blocks.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
