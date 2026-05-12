Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFB3394EA5;
	Tue, 12 May 2026 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593611; cv=fail; b=ktQtgwq+krhEQr/zf5xnbyxk31ShWj5NApVtwJLPbwEWoDH6BZkdFo5Mpqf/3u1av9a0By6QUpKCGI/g1K5/9we84gIjsPIxGgOOwp4zTX5Sszzu7PXlSQszE3CBrE1hqlvC8kJGqJNvdOrrI5QNHEypL9uV1xIuwpMURAPhBzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593611; c=relaxed/simple;
	bh=aRfcj2Qpc2H7eFesL8Pr7y6hKIytLCSbw41MthSfXjo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oyxZ9yZp9LqrIi48v5b/39yVDRHmV+fmq5ff36Nn6/lgh9JOXNbVGdsAMKir43u+i1nYhbmybt2+MJ/QrvOSIIPHYn6JFpu4mqpumz293u9Ui3Y4T9zoAYe7q/skh/B0LT9TPBSAYMV4CCU5Kqqenl0sE+b0ruPOa5H1vOQtKcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hqDfTbMn; arc=fail smtp.client-ip=52.101.57.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hqDfTbMn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbk95TCwGWgiXOSEsslupexcgSONuPkqpAnThK1882gmg6CjjSa6iirGa7bJv1F1n8+3IMe91fVXaThgv8eilzmzHaqGYzVI+D4402ZaERCo/NjKK+xmbB/q+yPDaZv6S97exSoLe2XXn/s0eMtJTSI1scJ0xyMekyl1y36kL202PLmqsKRBnAK//HOBsQmGYAVNkktLIlRLDqYdj9oaA5s7GMMtpIGBDglKL9J0cM79O6Snw5tgbJrpUd2yMzKwkhnKCcZo8EKNB9xegjV3e4df2F83ndyWLYZJ7iyRKnqKBrCzfxydAdUd5rHtaPCGwNNg+wJaI+itGTcIVJMccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRfcj2Qpc2H7eFesL8Pr7y6hKIytLCSbw41MthSfXjo=;
 b=jfMjidSCgejOdpFT4o6UDmRo1TqCgBkakTiPHNT+ZVN05HotauEYxrBhsMo8/ZFYMfdm85wScSj72VQhBgyOE5DDn1YLmEhwu1QZE24rFvA/rlDrGGc0fVzRU707lJFaAx2nWIisnWSuhWUV8DAqY768wpwU8tkYxmiWfTB27yv+a2PnLpLApX9WETQNXrP1fmFGMoNE+Dv3AoXdy44xUCjuUkELpxt72NSwx7s7rbpA+H9vGZlUALR1Y59rlteBDG2Gm9eqin2bGfbTPHBdFRyaWbf4W6uuF0I/yCbfBIqA5W2rW+GH16WzF3Tw7qYrLFVSyqad6TTSjI58kaHwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRfcj2Qpc2H7eFesL8Pr7y6hKIytLCSbw41MthSfXjo=;
 b=hqDfTbMnYtZvW2IZ9bXFrDRiIkPXJwA0aBEQ42zOoTJetIrm065G1WUNXdpPbduCtBTB7gXUpWH5uuXtNXE6M9McyuiInVbkhgfFRUZ21d9vH48Kk9UsbjREq3lzRlKXF6C6svwrGv1kKNYkYpJkfOYPqx/gVTFhC2vXWgS67/KDXlfIFiKQkZzRjhKYnKKlh6AkDDi/VM7HU/+F6gL976+jbxYhib1Z/t0qSDVM7yr5OQs95sqr6PEetprGATneY6pO5IBPk6c6XjY8Lp5m1iJvXMe5YwyMjJBg8yy2Hiimy7d+NuLwYOkcK2+/Et5pU9dnS5Vj9cWx1DX9XB/Ovg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPFB29794CA1.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8dd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 12 May
 2026 13:46:44 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 13:46:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 22:46:40 +0900
Message-Id: <DIGQT80WTMJP.XZFA8JTLEZ0J@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: alloc: cleanup doctest imports to "kernel
 vertical" style
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <ljs@kernel.org>,
 <vbabka@kernel.org>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260511214154.3569305-1-dakr@kernel.org>
 <20260511214154.3569305-2-dakr@kernel.org>
In-Reply-To: <20260511214154.3569305-2-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPFB29794CA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bee877-ebb8-4895-ddc1-08deb02ce759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7416014|921020|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HSQFPHpE8PViukQusWi0yl3CYZImGfqUc7/C/Srlv2EAgec7X/sT7Rlm9MzQQ82+i6C2zduwILu89fwwprR6InSkG4p3NhMVgFMYrZ8oyRqMJd/aWF9jV7NZZJBUM63iDQoz36yyavDHvM+P/26I2bifwxGzZTmPggjfR+XtdzZ2UcbGRX3FAFOjYJTuhnM6RgcxeLjc7Ru2D25D+9YqdRTkmDiN5uvQ77pdqrydKC3Vf/I0arlhat5Qdkrn+4XKCayNaSd15G20Ds5U7Ox8DELuuOYC4o5q7ZWVTUjiYpIloJgwzwxfZRPV6FqNYhXVIBi+PYqKTGS0XgCBsE5JmpjNqtP5wr+ZRLfI2T8bjL5kTH8JcrBJx/5WPHqK3J4iofGGbstxwDmvtiox8pJ+ysiZDvgkmT2UTa5QFXEUf2oAp3IX82k0SliNpBx8B6YyAPyrsQvbvTsRo4TLDrE3Lix/7PxhA4aGS4gYaeMi3PgezITfUosXkcjsjEXBl8KIwqDqF95UKVlyKMluKjXW4NlLCsUdptIMC1t43uO+IIamNLWnGm/cBbCIK+87eh0o8e5WJotDeQiQtRfq09HTbe5viAHkr5JkdvMHPzpMxDr1ZXL9UBjFIjN0MPfTKSpO+00/38YZqiXQoKaIm5VyCg6042Y/zFYGvbFHYD9kGKTzeqjyDZctCOfn8VRjk+xAher3LyGnrSsJvmcRXY5x20IdJgwcLRDK2bfKqfsyuso5PXTtSUxEtvQIw2/jINVK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014)(921020)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzdjTTVvdlV4UnVobnNPQXpRZzJteWk0V29KNUQ5dm94SGcxZUtod3NZLzdn?=
 =?utf-8?B?UERxbmd2MDhhQUhzdXhNWUhURHgzTnhjV0ltdVJQMU9pV2VzQ0pmVXZBOE0y?=
 =?utf-8?B?NjNPS3VnSEFCR0I4NVo3a0daTDlGL1E2NzFTTEJJQ2tESXhsYXhzYzNvbmll?=
 =?utf-8?B?bzBLVnZ3MTUwbmpYOUlYVHJEQ2Y3d1o1aWMyK1NQOU9WeFVEb2NOS2hJcDNx?=
 =?utf-8?B?ampmK0JGY1kxck14WXJyZHZGODFuT3QxbGNMaElRRytLYk9lb0N4YTBmc0dV?=
 =?utf-8?B?V0RYb2k1cDVVVEQ1Sk1vYnl6L3RzSnA4cnFjbnpGaTU3QWtlaEUxNmhscDZF?=
 =?utf-8?B?dUVCNE1YL3VOSGJHZFV2YW42cEY1b3Q2Q0xGL3ZXV3JhcWZENlVCMFlObWtn?=
 =?utf-8?B?RjYvOUovWTAzaUF2Wmo2cXJYWjJxd2xaeU9MYkFqWlNpL1hISkZkQ2VpMEs2?=
 =?utf-8?B?cGhoN3ZFNVduVlVhU1prcHlGMytBSUVQUHRUMDlVS0lPYTVnN28rSUh6ZytK?=
 =?utf-8?B?K1pOd29rZklGbWxoaDVjMzhmTTZzaDJhYisvajdMSzFEbi9PcFdvcXVFZzZV?=
 =?utf-8?B?dm9Hb011djJqVk5QSEdBcmdWWUxFNWplMnJJUDFsdVF1aUhFdUZrWm5RdWZz?=
 =?utf-8?B?enEwbVlac2k1YXBTN3Y2YlFkYUFoaHlnV1VBVEhicnJuWXc1RG1NL2Fxc282?=
 =?utf-8?B?aFBpNVBIa09jaXh2c3NYSVByd3JUMGxxN0oya1R3OFJaTVdyWm8vZURsUG8x?=
 =?utf-8?B?VHNaYmo4Zko1a1IrMHdHNUEyczVyRHZzNUcxbEluQ3FjQVNLTit4YXFRbFFX?=
 =?utf-8?B?TDV0dENudVNSby9IbUJsRGNLRXY1amRodm00OVRPRXhXZFZHbFhHVU92WjZl?=
 =?utf-8?B?Y0hZOVU0cjFTUFNEM09oVzV4NWNHUVZEeE1FM2xZcHZlVFptbkhmRWJJYkhp?=
 =?utf-8?B?NlpQM2tONzErNDdMdEE2djYvbUx6VzkxMnZyRmVLUEovcGk0aWJpak1VZDZ0?=
 =?utf-8?B?c1I0L1JwdDMyanh1Skd3SE1kK1o5aWdoMC9QRGduc1lTM2ExaHBndWFnUWU3?=
 =?utf-8?B?ZGhVSWNDYjNLRjhubFN1enIrR1o1YW0vSFI1cUhURHZPa1JUOERxRXp5TUtu?=
 =?utf-8?B?UW1tcUtuN1RhMzhpcGhWdXpwbk5rbVFWMWxabmt6ZnZHY2w4SmlIQm1UaFBL?=
 =?utf-8?B?dHVLdkNZWnpWSzI3UHBiVlp5MmszU0p3dU10YzVqWFIzL0d6Vld5ZkhRVElz?=
 =?utf-8?B?T2puaEkrVEt4NlA1b052UFVjcmtla3dVaFFwNUppSWlIVHQwaUJ0UG1KL0dS?=
 =?utf-8?B?RC9lNklLd0FzOFluTEJRSkhGMExNWGZOQ1FlUEJtNjJ1U0NDQWptV040WEYw?=
 =?utf-8?B?SjJ3V0FsYzk4VklFNnJCeThPTWc0MzE4MG5VdzZJY1hMakhzaTQ0bXJjbm5W?=
 =?utf-8?B?UktaTEU0SkZBakUvUzR4VnJUM1dVT2xWTWE4VlAvRFY4d0pXaGxNa2JpdGNS?=
 =?utf-8?B?TE9qNzR6VzZxTERCUllOcjhEWTZ5OWRrRjdML1Y0akluMnVmMW9hWXZ1Q0Qy?=
 =?utf-8?B?MmhGbC8wc1VSaEJja2NzKzdMREFkMkdad09KdnVLWThLQXovczdYa1VwK0sy?=
 =?utf-8?B?UlBWN3dHWUVVZC9IYmRNZW15aGU2Qm9zZUg3eVVjZkJnSFZWNzFJUVBXTnc3?=
 =?utf-8?B?WDBvMUI5aHN1TGE5TzVuL2dlM1Uyb2V1L1hQZHhoRE1sM2dsRGRMbFRSVmRo?=
 =?utf-8?B?dFB2S0FnMzVXOHRnUnRVR3c3M2FEUTdodzBCRVZwUE1xbkl1c2xiU2ZQN1BD?=
 =?utf-8?B?a25ocWoybWxyaGVIVDRYOE5reWVCR0JsVVNkUXRIelV3eVlTaXJvQUhqZHlp?=
 =?utf-8?B?K3lIZUpPbTZlYWgwbHBEaXZIMlBOakxUU09tUHJ1LzdJRTJWUVU1TjBxeno5?=
 =?utf-8?B?R0wyMEFENGYvd2s4Tmw2RUxRYjZzWnZqVTE5K3luM0dSeDlGMVNoZi90WitS?=
 =?utf-8?B?bGU2bFB1TWtRVFhEa2pFdE92M3lhRjR0TStIVnArWnc4NGpWSVREZlZxZkRS?=
 =?utf-8?B?cjJoOXBmbHB5RlBtV01iN3JUQmxlMjdyUkNiWHVNRllreTVPRkx2YWQ1SkYr?=
 =?utf-8?B?VXZmeXFHSmdGRDUrbngyTmpSdFBReUFieHR5MXg4M1FuZVhrTVdVZjhLZmJE?=
 =?utf-8?B?azZuMGFLUEk1dmlYTkVDRTFzSXRqWWJFMUprZENXUmc1QmZxZmZuYkdYbktj?=
 =?utf-8?B?YVZuVjllVUM4ZVJHZ2ZXbnlyUmdVRkM2eVV2MkdHS09LUWg4ZytJVElTdUtN?=
 =?utf-8?B?c3hhMUJUd2JCMHFKK1ZLOUM2V0FhamovY3pCSE1ZRS9PMFNkMEhyRXBJWWNC?=
 =?utf-8?Q?JmoYflIHk5U3f5L9uaMRJr0NBODujKSGTxWFZs1YX/GTZ?=
X-MS-Exchange-AntiSpam-MessageData-1: zNsATJZXxvysWA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bee877-ebb8-4895-ddc1-08deb02ce759
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:46:44.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DUSdlkwLYvp6/FpLx73ZGWQ+4QCDJE5mYHG0WRSgVBwbn/kIakO1YqF/VTuRIbtPZmzA816WyNeC+nGCwfjqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB29794CA1

On Tue May 12, 2026 at 6:41 AM JST, Danilo Krummrich wrote:
> Change all imports in the alloc module's doctests to use the "kernel
> vertical" import style [1].
>
> While at it, drop imports that are automatically included in doctests.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
