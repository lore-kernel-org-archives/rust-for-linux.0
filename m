Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022099.outbound.protection.outlook.com [52.101.96.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14F39B491;
	Wed, 13 May 2026 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672694; cv=fail; b=pUiCXQK8UtpHZMujx56sRv1oo+mEDBLKu2iOAs/McKWIcBGG+lNrKbzigjjo5zTKmAq9a6xwNwEoqHiXFApwZrsH64zSyUZZMCpm+KX1rM5QM6+HGINoPpHCvBaVtJR+Vf9K2QAdM6xYDVwUWdhUTNL0e8hqlyZA3eSuwwiFLbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672694; c=relaxed/simple;
	bh=MWcxurUzfcGR2f7DkTi/EuluGhiJK5b8jBVyMiyBPF8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=BlO3TnXnIYjtiCk5lKnNhQTXpFb3PGBOa1qbngtpXKl9pZXHLi2QiPBSwagcCnjGTcLeLW9p0FKVMvYJtOZtwLTE3xJfR0iXKhwjRFeEVCMfSO1KpZUQIhhjoxUWm10/jegx2nHO4c+9mufbnqq4VdM7Es7nuRHCBca+AW7AsPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gLb9E4vQ; arc=fail smtp.client-ip=52.101.96.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gLb9E4vQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvklOXWMmHWf/BuIo9BELqKfaKODKYoIyEGTpi8oju8QzCoYmNpcMxEZeAkyFCGVtJpKWWGJfg5PGMGduIo2G7U68WL3w1GMbuXi37nEwZVV8Pzg+hs7vC02YmYTTur3jVsosknmjcAD1LNCIUdpfr5Fbtu8QDfyeQ8vFLmBQapKeuLvDhDeKA9XBISkR0C1VUtOVbIjl39cVnJzlPm5rUp1VxIB+vuEnqgF2oHqyAjA1L9i+a53PB0bUmiHJJ0cKrlF37Hj8H7TKwAA/O1/XMVqDfh+9gS+DzBRYGqaSoVGYdkTRwR87AB8AH4KSMQWzCktGaMK9FqEKnthfiSuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWcxurUzfcGR2f7DkTi/EuluGhiJK5b8jBVyMiyBPF8=;
 b=tYpVXqRcLs+aIiJ07AJWN+ep4Z97sQQXCG1Zyonwljyddy27svBNFeMI8XTauAnoTsVZA+m36xYt0/6w0ZITOn03qxzpT1X+jTYIBZrOgKHkjuGUZxwdiMoBhSPPz0ZofbTRwVPgLMFf2iBTLhicNkBlVx6mHHq2pifMPXvqj3u3vAumQbl4cQBjfI6orlUxaZOAJ7sTcCk1S2Jnf73elYRR9s0j8lIQpDJojKnrJMJ04+DOJsgp/4oi6s8oSQDX9vadcm/Mz4IjOFX/ru6g+9MXKcbOc9DCb0XsYz3zJfhv5cG33H84NNbIx3A4PqaO+OOhRPxsVw8M14dml9hO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWcxurUzfcGR2f7DkTi/EuluGhiJK5b8jBVyMiyBPF8=;
 b=gLb9E4vQkZik+7i5Uh4Cxr1cpWrL4ZWwH5UVPE9dWObBMxRNOgAZrN4t4MaBzYtVjD4kIuA5COoBdkYqoxfVieLS6zBWTBERdvHYfi7YaEp4ipllWNxBu5+eIZZwBFA/IMngCHYbleWUlRCKjl+YwXjUgendcoxjWoOVJZLY6ZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3594.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:44:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 11:44:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 12:44:49 +0100
Message-Id: <DIHIUH1MUP6Y.36ZZJHN6YYVZT@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <corbet@lwn.net>, <skhan@linuxfoundation.org>, <alexs@kernel.org>,
 <si.yanteng@linux.dev>, <dzm91@hust.edu.cn>
Subject: Re: [PATCH] docs: update rust-analyzer command
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260513092017.265269-1-work@onurozkan.dev>
 <DIHHZLJR583G.2PP9PSQG3HTSR@garyguo.net>
 <CANiq72m27gP3z0t80bSUds=2tDcnt9JU5X-=4nW9XwpZsiLuAA@mail.gmail.com>
In-Reply-To: <CANiq72m27gP3z0t80bSUds=2tDcnt9JU5X-=4nW9XwpZsiLuAA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3594:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ed58e9-714f-459b-5a79-08deb0e50a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vCDahzVLiKfOsLUObrmTA/R3Kdm9vROhcYHFCeyvt9jXs5w0qdqpwXeSket+tp+QCDFhmdfoIAaV/6dJdGVPj0hvvDmG6uiMQyvoaE1nF3Yvv4vKpCLLKWiJumNUtxLjBtT2ZVeuAh/SJiJ9fCNi60CBHoGZn292ouum8xbROsvuRAvh7vdS7o+lsTNcfqBrO1YeCxgPJ29TyzSuYpm7uA3wIqDRgy0ENJBnCPbW8UH+XydcAKu/AKvyx0WHcXZrNgHbh4dEcHfs+MnKyAAHZtVR1MfWexvjYJRktnMb77QyCmPUwbSiqcGCAxsMY+6jN7T+O4b+NmiUJGdIl1qc7VxUFHBOu7Y6J2ZvFux5NQ04+xssoHkscAx3GJhcrvn6csImgrCsS7MAQkvbwyrk7ePDJr8bX2322L9qJip9mIy/yRZTY9OZNboisb/y9Um4Z7S2ixF1UnwUAXq9pclsfuUeUYa07umtzCdMgAYMfGrdBHBcRAP1tTyOJAHLjKz2WqE88uZcg8u3mQkxIgnTw4N8XhOTzc/JtmUDtn0YQ5bdbLM31NGayIdaEZmPJaXa9QEgUuN+W7Uf+IVf4E+2Tw6cLoYm5dLoHoKg5FcwwKEUTD3C5hOokEbRcfSpxWZ1m51B44ZeP3Nb/4DBuXZFhWhEeMfnsMOt9acVBk6RDFM22npj1Vs03L6eii3Q+rlU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWt6TGU0VTdqUjJrL2hkT0ZlcU5aTHpscnhTK3ZqYzJrd3h1QTlLYXlrUmdE?=
 =?utf-8?B?YXhzNTFpNi91WU9hMlQvbS9obURYLzZEb2hEK0FaT3JtcjgyakNXTkQvRHhh?=
 =?utf-8?B?L3EzNUErN201WDFXZElLeTBFcXdNQkN4dmxUUGhOQVYrSkpkR21FUEM5V3NG?=
 =?utf-8?B?elBibForSmtvd1owcVdMRjRvMEp2K1BPVDNKWnVuNnRUU0Z4OXo2UHpqTDVz?=
 =?utf-8?B?bWlPdC9tQjB2WjI3V0FOL0d1Nm9wUVlnSnZCK2Z1TW4vZG1aWTFiM0d1dC9S?=
 =?utf-8?B?M3R1QXBadmJheFRBb2hmRGtXWW5McnRZU0RHWFI1aGFOZEVmbGxhbUE1dXFj?=
 =?utf-8?B?cVVlSUpKY3FOMFFmMHFSWDZJN01PUWJURVpUKzY3dDFDeXhDQm1TK3BZVlEy?=
 =?utf-8?B?QlQvMUdSN3Q2UkYwSmw2SUk0Z3pJaFc0T0U1czlNblNyTVRodFk0dTlhaklM?=
 =?utf-8?B?NU1ma3NDRHNZOVFOa3hHRDdhMmZEOG9MN01qa3ExN1VUamJEVUxxR3RPNFpt?=
 =?utf-8?B?U0gwS1A1QW43ZnA2YWdqcWs2Y0lRRDNYb1pCSkRIZENOeVlaRzNUZm5sWVpV?=
 =?utf-8?B?S1B4VmRBSlg2UStFZ09kVDJnSGN1QTd3SWx0K3ZNWmN3Vm1MNzJ3eGtWZCtM?=
 =?utf-8?B?SEJIUXJjbXZWWjJyUU9tc050eDh1VHY4T0l2WS82TXlnaDgxQmJXU2RaQjl0?=
 =?utf-8?B?OXk0TVF1Q0tRMnFaazdLUEliSHZsSlJYWnVXUHFOUmsrd3ZFd1RESFR4YXJL?=
 =?utf-8?B?QlZnbnltaU1pdFFjWkRUQXdJSXp3V0xMbHRNUkVrYWJDRU1qZVc5aVNreE1I?=
 =?utf-8?B?MFBYcEczOEJvZjlzWnp4QW4reDU2UHZGeWpZVCtLWXZPZVdDV3hJeW1rY1lO?=
 =?utf-8?B?cE5TQmtBTjlTSlp5dVloUHRScW0rRFQ3YWpadXRlWE5hcXFsNmF6S0s5RkNw?=
 =?utf-8?B?Ym52d3RBN0xZTXpmRno2dG9mbFZ0eG1VZkl2bVRKM21pVXNHZU0zeVhjdVlW?=
 =?utf-8?B?WWgzbmVUU25Fay9mUHE0bllVWXgzUDU3TTh3bHpkSG05azc4RlRMbHJwUS9w?=
 =?utf-8?B?Z2JxeVpYN3gzaUswUEh2elpiNk5BRXluV3RDRDN4blpjVkFYbk5TMmNvZGZs?=
 =?utf-8?B?QVk3enZnZUtBa29OTytGNU5hRGw0QnVjaSsreU9QbW45bDYzWWp4TmZQT3lo?=
 =?utf-8?B?QkN5VlNlUDBFcWJLWjhweklVTHJVWFg0T09zRit3bmU1T3FPL29mdGtjbmQv?=
 =?utf-8?B?SXRvdG12YlhKZWVRZmloMnRqcUU3ZnI5aVZPVlVobzRSVXdtNlpKdnFqUVpq?=
 =?utf-8?B?em1Vck1ML3RJbE84S2NOVmdwcFZGQkJkcDdiWUs0YTJTaDdQZElqMlZPUzdB?=
 =?utf-8?B?TStvTmVCV1pHakZYT2pYSlgyREQxRURxOWFtNkJ6SDU0aG9sRmE3eXNWZzVw?=
 =?utf-8?B?ODkyUnVDcmNpakRKTlJTYnJ3OVlwWGVidUFNd1FrQnpJUlRXUzFJYk5uVXMv?=
 =?utf-8?B?eUhralZGcjZJWkFJeWkyUlZlNWJ6NE9LVWh2eVVEcDh3enJJbnZCZi9peUhw?=
 =?utf-8?B?NnNLZkptTUNQUm5nOE05N1JIQnJ2VlN3RmkvOXRVUzZxRWY4a0w4U2UyWVJw?=
 =?utf-8?B?UHBwVlRabjA0Q1BQTW5pNkZJcmdndDNBVHdadVNmR3NWMWRrZHZsQ05Lb2tR?=
 =?utf-8?B?ckd0YVViR3k3VWJIMnBpM1FpS0ZBN3VlSVFiVUxvZlBVVnI0TEpoS0xPMGFn?=
 =?utf-8?B?VVNoUXowOWlLSTR2WG5DUXNLVlVwYmhRdjZzVmRmRVRzMThCeVVzdFh0b2ND?=
 =?utf-8?B?cHdZQTRVc1QrVnoxcGxwM2REbVdZRTFTS0dUOWJRbVhUclFlRXpMdDA2Unhr?=
 =?utf-8?B?M2tnSWdqcm5XVnBsMDltaGViWDNMSnNQSUlqOHQ5dHpTRFdkOVpQY3Vkd296?=
 =?utf-8?B?WjhVS2RDLzZBNHFsZzR5MnVITEUxSEtxay9CYjRiZEw2Sy9IWmFSdlBiczdt?=
 =?utf-8?B?eDJHbVVoZHNtS21aM1VQN1ZFZzZaZzBmUlE2VWlXNGE2MFhVN1c5dTk3a1Fw?=
 =?utf-8?B?NG9sZkd2eS8wWStjSlByUkxTcjlkQjVYQzBFdHBzMEd5bWs5eERqVWVxaVVs?=
 =?utf-8?B?WDVEN205WWV0MURwa05mVFlZazNJT2s5eklaSDBmVEJodis5VDQrb1dhM0sv?=
 =?utf-8?B?VjRiU0JuRTRGMGZuZUVSOW1EWHl6dzdPMlFkelVjbUs0cDkrNmVWSkFWODJN?=
 =?utf-8?B?SUx6emYzYW9rczNJV0k4SE1DOGtxNWNMbjEwa0FzK3BBZC81WXVZMlRUa2ow?=
 =?utf-8?B?WlJPMCtoQTlYWWVra0tYZGhKdW90WW9jV215VTgzalZQVmlIcTVFUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ed58e9-714f-459b-5a79-08deb0e50a0d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:44:49.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wj52ZTJuFGSAc94SAtGby0VAqnZ7ojb9dStlcXqFXegi9MfHUQ0IIT+nv7sHx3yCxejLE4HVjht6cGG6fRn7Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3594

On Wed May 13, 2026 at 12:20 PM BST, Miguel Ojeda wrote:
> On Wed, May 13, 2026 at 1:04=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> This should be fixed by marking `prepare` as a dependency of `rust-analy=
zer`
>> instead.
>
> Onur suggested that in Zulip, but it is not a real dependency (in the
> sense of generating the file) nor a hard one (in the sense that
> rust-analyzer works to some degree without a build).
>
> I am not opposed to it to make the target about "setup rust-analyzer"
> rather than "just generate the file", since I think that is what most
> people want, but I wonder if someone out there may be already relying
> on generating the file without building.


Well, to me I have always run it in a build directory, as it expects a .con=
fig
file so I cannot run it just source tree only. Running it would also sync t=
he
config, which would invoke rustc and others already due to rustc-option, so
arguably it's already running part of the build.

The only issue with "prepare" dependency is that it also builds the kernel
crate. But I suppose with the new build system update this won't be necessa=
ry?

Best,
Gary

>
> Another alternative is an informational message about it as a middle
> ground between "just in the docs" and "not being possible to avoid
> part of the build" (and without introducing yet one more target, which
> is another option too).
>
> Cheers,
> Miguel

