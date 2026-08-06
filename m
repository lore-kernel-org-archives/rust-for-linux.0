Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020127.outbound.protection.outlook.com [52.101.196.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB4326C385
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025653; cv=fail; b=JkUeYyfdcbUROXm5rrVLlDE8AEs4BqwOPhvCsk6I7szTtiP+wkaEEMG8FXwFOvAy764RSoPs3Fu9Ph6KYc1U2Zedz6KvCzXZzZlcqZevga9fS15meMtrtjvPXP9uCOXYbGRIEgPv7ZQkAfQsYCcKbAZWqye4ND/RcBcHDB3Nq3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025653; c=relaxed/simple;
	bh=vM4IjO/MUEcF+NYIEARxuQe3ZTvC48QCgaEGJHqSvxA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fDSslHhGcPDpWqIndf1/pg8TLjoGeyumVjme73NPDQ9aR8kkFYAtr28BYbjzfHURV0uzebFKoJ20ez5N2GPqXble4isVv9xUa7nuFX3+c6kguis27nMChiyAj3zvcrhlxMvZELA4PEcG1Qz8snc834up6AjXJxTYLly+FYNNEqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TarTyThv; arc=fail smtp.client-ip=52.101.196.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TarTyThv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFCkKSUow9s3Jp0q/X6c2aOGenA7HTTB8rCasDgqbOg02j+XZ8TuEfRF0lOrcfpUpoVjGHCdO3U1Pn2lwZRSnwJYY33Bm/ZmJ2NXC6A61JUY8lRr06B3qXPkFCf9/1BaM+S7ROQxb76WIcAJ5sIHMIOiUJIHPPgBXF3MHRzlP3TrIDcaaCPBwIVg06g6k3SRBiZkOMZb/LsfDG7IPxgJ+Bws6qEhTtc6W09+QJ6oZW6TmaoRt2q8BbUPmaQ2/kVzTdrQQl58p4DbBmBKYUgCLAXkE9Iil5wSbHe/d3xYx91TZ02io0XhkFN5VOZDRWsLtiYIelOLdNCLqbPdpMgBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44XIPUfA6FnGz1R6eqR9dSMsC60RT5OMayMtFBARixQ=;
 b=mx2g3SgdrallGXleloqYH5jRfmKWVF1DhUhbA3mK0NFFaR70MyUeLs2O2dvmHsruwBYrLr86yYAcNgchB3jCsoVqjrKeRyGyZRGAfodDolEIJyRapPoktt9nAoYcrvQX+Os7H36X8TiK66b3C/WvkdbHisNarAQOJQ4hVml68Haba9DHMCLngkqJvWKdjKLEIuKr12CeAOlqhFJ770qP8s3utd9LEsLpCwyYAXujXrp6rowgIRoHtqbOj2f9ieDpGw3KBRqeM9sxgQMA0f+Wt3og7kRnVloJY2bdiqCxFupbTYglsYnRCHXUyx5i0PS3ntsuBfDynjhcCV7kC+pViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44XIPUfA6FnGz1R6eqR9dSMsC60RT5OMayMtFBARixQ=;
 b=TarTyThvZA+RYsSz2927V2k4T1ij+O1gbp05oO0gLqShjelbPf7Ka2QXK4x7scCEzjB/G3FoDlbEtj1Er/ZDBmsnz+8KffCGDS1LE0XyZZI2S46w1NC6DP9K2+JuNWgQM+1mE8xnq8z2EcncfG+LcI6Y6ezzqpJ7CbQaWe+87D0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by LO4P265MB3709.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 14:14:06 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 14:14:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 15:14:05 +0100
Message-Id: <DKHX92KW85MH.23Q014RDJ37H3@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RESEND v13 1/2] rust: fmt: fix {:p} printing stack
 addresses
From: "Gary Guo" <gary@garyguo.net>
To: "Ke Sun" <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
 <20260706-hashedptr-v13-1-377a07f2f78d@kylinos.cn>
In-Reply-To: <20260706-hashedptr-v13-1-377a07f2f78d@kylinos.cn>
X-ClientProxiedBy: LO3P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::14) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|LO4P265MB3709:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ccdeeb-f86f-47de-3408-08def3c4f9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|23010399003|56012099006|10067099003|18002099003|22082099003|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	rPoXW6KiyGy3msOfWV+z2En9WRqNELX/ZdNlOAcjgJJ6qNQKzsjni2DYTFhqeixMtglj6LKL9imrU/xv/5DqpAmSLXy9uF/NKiFu9imabf0LAMAuFM2f9/Jej41HKZ/ee+ZVJiUhoWQaRve7Ll1yQrZ5oXUTP+iezyNXZymjHyvdOTDygSKF3xj7SSVkOjwxbFV40HFfFW2h4uq0TInxZEqCScT1m58gFyNjptgD8ko+gDN1HrfT/l9OsmZ4xsuo3INUrqv/OuRqANA3KmyFWE5JRFE7UXyrfb/h1LQzDoFsdyr7xfK7gxz2y3j57V+qRRLu6DgpYsIwhGhNgX8jGn96DH1/lRPeMfpx54fH8+UzHallEgeBPjdmcXxfXqC+v9f31dWyp+v1W9lvdyVUkfSFEZAKwDzxnobkc2GWPrWQvTBDg8fi8CpPfi+nAqHt+sCFN8tiUWleN3VCn/3C64xEzVZ2QAmpT5ZT427sWwj5XmQkhvam/pOHCFLuNT05OsiEG4Ch/Ebt2Bcga+oIijGzOzmu8wMDNDVHWHj3iqNBYs4yQXwC1KxxJQYPh/By0ETT1iA86QEwvpueDnwMvdR4oIxRSDyw9GDgYrqMCctNeTo+bnWgfv4lPn0IrXg3M0gsIjR9VqgWGz1ayigdQsG2XIgmBv2tftj41189xgF0ugcGKBdrnFr8KFxmi1yWQ5Rwlv4IFQ9NpV5SgNCvkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWZSUW4zb0s3UUYxZ1JXdGxnaXdTMWFHeDFBN1FoUkRWNXJGMFhqemRkZnVa?=
 =?utf-8?B?Q1NTNDlvNGM2emw4UVo2N01HamtXelZtelN5K252MmdOUHU2RmxNZjlrR1FT?=
 =?utf-8?B?RG9qT1ZHcWZldVlVemQrM3NlL1g5WG9WNlZxR3hJbnI5TmNnWGwwSmtzcTNI?=
 =?utf-8?B?SDJVSWtuUEN3K1ltRXFaU0VYOUxuWGlIcWpURTI1bU1Gci8yMlluQVJVVlFL?=
 =?utf-8?B?bkVwT3B2Tmp3UHM4dWRIdzJjYXhsSk9ISElQajBkTHZRamgzTldrWGx3SmdB?=
 =?utf-8?B?dmliMWtoMnE5WC8vTUJBaDhhWitrdkZSWVkwWkZnWTh4N0lnZHI5dzl2dlBO?=
 =?utf-8?B?QzlTZDFXV0d5VDJrWG10OGhXSzdrTGxHei9tZXZwcGJ2NEpHcnpsWVF4TDdh?=
 =?utf-8?B?R3ppMzhzajVPeEcwbkhBZjVMWkhXQ1A4TGJzSWVIZnFndzdXRUNPMTVRVFRU?=
 =?utf-8?B?eGorbit6NDF2aGhta2dDY0JZR3BmMlMxclZZTEVIemhLZmtrNHc3Mk1GZXZW?=
 =?utf-8?B?VE0yVVl0blZ1M1JSRTdNSlJ5ZnhxbktXZHV5RzR6NlVOTFF2Nng4TDFNTVBG?=
 =?utf-8?B?bSs2b2VER0FRMHZYM1pRSmVRZ29yMFFjd3Z2dTFFc3pDcGxPMi80eitVeTJr?=
 =?utf-8?B?VHhRQndtMG5xM0lkdzR0ODhMUzhCSFoyS1g1bzhnbVRnb1lDUkxIYTJNNHRR?=
 =?utf-8?B?SCtZeTFDQ3VKaXE1NXpvam1melEvU1d5QytHdndJZHlJeitubUQ1cURrUGZx?=
 =?utf-8?B?dkdsSjJOTmZJaVBlcGNCVFNubUt1V1k1RFQvYXpBYnhpeVd6dDVxOERlL1RV?=
 =?utf-8?B?RmFETDdOcGVNMU43cHFud2M5Q05ab3JiOFZEZkxwVE1JbEdlZ0tjL1JQSi9x?=
 =?utf-8?B?bVVaNzArZy9wWU9rTk55Si9WczhPVU1NT243TitsLzU4eTVrZmt3K1k0SkE3?=
 =?utf-8?B?bVJ6TkNDTHNPa2o1U0hnWHpoRHZLSDRFK0VyTEtjNHRRcnkwc2xmRWxsWTFL?=
 =?utf-8?B?aEVkQnhTb3Q0dHkvRWRSSlBPQk9RWmE4SDZnSXBidnFCc2orOElNT1R1WG95?=
 =?utf-8?B?cFpheFUrT1R2Y1lHZXJKSTFSZzZheXpTMERLZCtlTGxFYXY2T0JZcjhQR0ha?=
 =?utf-8?B?RHBaaUtVR2Jpemlvc1NzSS9FWlRUeFZMcHRnbmp4bVZrbmplOEx0U1hiNFFG?=
 =?utf-8?B?SkJpSnNDU203MVovanVENFFEdWVxK1hIZVhzOUh3Vno1Vy9UR1lyNVhuYzI3?=
 =?utf-8?B?Rnl6Mk1udDlyREgxRVB0aG82cCtYSGo3a3Z5Q2oyTFJmdUVoMENMYVZScldP?=
 =?utf-8?B?OHUwdkhlZ3pLanluaGpMNy9tZTN3RVZjSVRORUNjSUkwRHFKZ3JRV2RFTEpp?=
 =?utf-8?B?WWFhUFNZKzFPWWNSazdCSFhoY2VSaE0xOUlzQmtCcENOUjBQc21RZEtTWlRS?=
 =?utf-8?B?SGJXNWdnRjN1Nm5MMUhsc0laay9BWVdBZFA5L3dyTHVvOEZUK1hPWnlCbE85?=
 =?utf-8?B?SjNBUnNXN3ZQMmk1Y09UTlVwWUJnekhaZzhNU3VKUmhxOEhHWFFXWUliTER2?=
 =?utf-8?B?Q1lQMDJtRzhZVGE0Q3VkSjR2NE1MSE8zem1BL1Y1K3JQaHhQSmtIbTMrcHd5?=
 =?utf-8?B?aG5Mb0NTeVNrTkVkL3V6ZHJHVEI5UFFjRXlvZUpkMW1Yb0dLbzQ2ZEcvSUx3?=
 =?utf-8?B?U01QdGpiVjNjNncrSjE1MmpZMHpLaE5RcEZ2cjJFYXh5UzFsVlpwa216RW9K?=
 =?utf-8?B?VThnMVRUVmZWM05WREhySUdtT0JCZlVud3VCUTZoR2dXdlZLZDJnanVwVmdn?=
 =?utf-8?B?Mmg0WG13SFdoemVMdEpVRkVnUkU3WE1YcHZxR2ZFRGY2Rjc2K3YvRHpGdzhh?=
 =?utf-8?B?cDg3VWVYQ2JOUGNLK3cvcnlRQkZCZUo0UDZOZUFIaWIvOVBCODQ5djlKMUp1?=
 =?utf-8?B?bmZSYTVWMnVJS2FyWTdraTBONk5OZEtrbFpHT0lkNmE0N0NnWXBGMUVDalRs?=
 =?utf-8?B?TDUrM1hrVjVCUjU4cmxhRjdadFdEclJhYUo4bHpGNHhDUFp1MkdQSU4wck5Q?=
 =?utf-8?B?Qk9ZNTBvNlVWSkdkaDBubURUNHlEblpaTnZyZkVheEFITWt2V0MyVW45N0ZN?=
 =?utf-8?B?L0JJSGV6NG9tRnI5bXhmRnorZktVbXllUHVJRG0vZ3FZVFEwOElCTG44QXNQ?=
 =?utf-8?B?KzQ1MW9WWk80djQybjRMME1SZk9HeFc4aW5zMHdQOG1Qd3JWYk4vSE1QWmF6?=
 =?utf-8?B?WFpERWUrMXMzbk9GM2dEMkREb0llUFBhS0ZkajZvT3MrNjdhZTJ0UHd6dFl3?=
 =?utf-8?B?Vy9ReGVORXp2azJ3dnlZVWN4Ykl5akRUMXlRRnBJckIrOFJibVpPdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ccdeeb-f86f-47de-3408-08def3c4f9a7
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:14:06.2456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLfwbT02P41sHyHg2MD5gmAigPgErEHrrT4l7/ntKI35y8dyEKvhodJVYdulIJ0vhzWHOJFWUa6GFoASg92DaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3709

On Mon Jul 6, 2026 at 6:18 AM BST, Ke Sun wrote:
> The `impl_fmt_adapter_forward!` macro forwards `Pointer` for
> `Adapter<T>` by destructuring `self` into a local `t`, causing `{:p}`
> to print the address of that temporary stack variable rather than the
> actual pointer.
>=20
> Remove `Pointer` from the macro and provide a manual impl for
> `Adapter<&T>` that passes `self.0` directly.
>=20
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/fmt.rs | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

