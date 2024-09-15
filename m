Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020085.outbound.protection.outlook.com [52.101.196.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65E21CF93
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Sep 2024 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726402618; cv=fail; b=hVU7+/KojVD1Wmto1yz/WYH566kRYYTZj7/1OKywksEm6sIc00PjFXwrPdhm23GglYzkxx1L5gV4ioM9OJ3Z2pip88gjvz8ZcMacYNkmpcbIFr11tzEUXhDgOl6Z+wFi//UlQZVs4HLpMzA+EtSCybAbkxfnGhpCl+3L3i0/oUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726402618; c=relaxed/simple;
	bh=jJOq2goqC3nFiTlYXK3WoI8/QMHehn90A/52Uvazq7M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=McdJQWyLXfYom+vzlDMhF3nNLVYz4GgoFTmrgf8/hWS9Yb9IICr6DWsf10zuPSybHi3lxOGRuf9WPJeCJ8j7Va5Kr3bfnxmifHuOYKFaCim7BLbTA89fW0uleU6i6OkLC96DuHTYeW5wiX2KE0MlOhO68D32VQ6yfBr+6RDm+oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jZkp1F00; arc=fail smtp.client-ip=52.101.196.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jZkp1F00"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3G23vInjGl4XZSUmZA4U0EJW1T6bzo0Etw/uW55IAsM9E3wkp7eB3JG93S7HDG93gp2Knv8I4UJdOE5NBJdMK9jA5a2tGX0ydfb8KZF2hq+r+sDTPobYQWBMg9fHU3Wu7YuUwwGJOCrRZIApbVEzL23OxwbebXqliK63WkCQCLPlxSpR3Tc6eG0RbmdA5CzMFpaCY9JhFj/CDeGeGrEuTJaUYjp4I6fxzrNVwuwJIB9mEVUEVE1jmrUYnhEXvY5Gv7EO2399cs7ESVK5Crt9JfrZxjVsOkoTc8dIru39sieak4TsMYTeiEfquWMIyghkp+gzxecgs9sRPvU01llCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTJ+wmVgqXr4xjbfUmGZkzSc9k75pdN3wRpnS0DnO0Q=;
 b=F+nd3jK1sZ8lTed32EZcUlua/BbjqW5DjWmTHAV+jLg6KjRMf5FNizLpmuUWKGIOI9jdgarcX3YCknqRWQJdMBBXXDxBeF2cMPlsCI1UwwxCoU59XagN653wKi/ZO1eq09mkdYHR2weaiu0gBzIAyxVOEPBOOecfserSVdzX8bB8Xjzckw1LLS46euP22YxqR6q/yibROGQHbaTxXSmYh/mSbAZi9iP9gtWoIpqvUgBgwOU2SgaJC6O/lLaIFl2hxvv7ZS+5BTYN4Nk9qmnk4s4oOexRsH1qryC/5Td3mYCbLi6QalJ+vwrKFds0f2YaA5GxFs/dRQVyKTzE66bYvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTJ+wmVgqXr4xjbfUmGZkzSc9k75pdN3wRpnS0DnO0Q=;
 b=jZkp1F00KG2yfAysqgi7roVHdywoHXbKKuCbOC0ia52LHe8jRMyZG8KR1zJ2nrbJlZrlw3m5baT0BjsRct19tr4rpoHqbAcAlH45K6uJxLKWwif5TUUTN9PJwrMn2GbecpO9V9TlDqPWHk/V1ORuXyngic3oXyt3uPpdmOj6fBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB3506.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 12:16:53 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 12:16:53 +0000
Date: Sun, 15 Sep 2024 13:16:51 +0100
From: Gary Guo <gary@garyguo.net>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Filipe Xavier <felipe_life@live.com>, aliceryhl@google.com,
 ojeda@kernel.org, benno.lossin@proton.me, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add trylock method support for lock backend
Message-ID: <20240915131651.02a5df84.gary@garyguo.net>
In-Reply-To: <ZuZyIRaGHxGMGUid@boqun-archlinux>
References: <DM4PR14MB727606461A9C870981F44D9BE9662@DM4PR14MB7276.namprd14.prod.outlook.com>
	<ZuZyIRaGHxGMGUid@boqun-archlinux>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0018.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::23) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB3506:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ec83f0-1078-4fa6-43c2-08dcd58048cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oL6dc+6kpFFJVP+lU7wVi2q5CoY/RW7v0Tztn/R/RLxzvRFjdyVXFx8SPtm5?=
 =?us-ascii?Q?VvJnKBZ9bYC1RC9vXsrb6M19S/EBDeyN5tIn4mDuy8QR3WTRnRfx1kZ+Cb7P?=
 =?us-ascii?Q?1YHXjmrT9teCo7mymWoB4hRfrVXDoY9s05wi5+731p2uS15yUbpSVArMJKPV?=
 =?us-ascii?Q?DnrvURadZ0ETiSxnjB0AbeNIOdcmcfq58b2pZDzzUc6UyAz6+NBBciIkSflK?=
 =?us-ascii?Q?zokUjyfHxz3ISgP9/nnec1BGH5b2hncj59T9SYgfA1Ihnav6gvPuEdajVSzx?=
 =?us-ascii?Q?eWXLTF4ekq0SyIN7NJQax1C0DkAt2gxA+BnYga5BIb7ZXRc/TlBNPDCZddNy?=
 =?us-ascii?Q?B97VRJ+Kw83emuupTYpuYFHqor+vY0cYYoJY0LAftgJsZDc5B9/H1Cm17AMG?=
 =?us-ascii?Q?wH/UycP8XEn5dWFEOueNB03P9rgcPnd3mbVTzv+ixZMgr2h7talijdg2MnwG?=
 =?us-ascii?Q?cqZ0eAYyn+gxSg+51hDBiLrj7/nw1blgrfZBsKzXXlhQE3ArlnjpviywmBtU?=
 =?us-ascii?Q?yrCOVia1sdK7HmdqRX819EWxbqM5A0jD/+0lpH/R3jPvR4PW2IahaAcSpumS?=
 =?us-ascii?Q?y6Jn6aeYv4AuSQ0cw1IAUWVnkael+6D1IFexe2rau5ISBIBncjWt0/aMfvp5?=
 =?us-ascii?Q?nUs7zPSUUIHPrhwX88ExPwNTOcGEPmoSaBSG6PK54PYlN8YSdVPYF1tDkiGt?=
 =?us-ascii?Q?8C/RdANYOxan7XL1AObry9IoDnx5sl2fySlnNmx0PZniep5YCmjeVukCyPip?=
 =?us-ascii?Q?bwMXxIDKjU217s1KSozKt6L+0gQtxj8ImOjIhs7UqW6sDe8tmE7Wwinlustc?=
 =?us-ascii?Q?1U5lyrG+2nZtwKKdvloroP9XMqjiluizPsPrdT3x14ZgjTRDQs3r5BsdXrNi?=
 =?us-ascii?Q?gCy7mlZLlem5Nt1yv9zQmKqbd/86a5Ilb+Ahp3nLJh9zmx6wMLC7qTMxjcKn?=
 =?us-ascii?Q?XtbMDhrDYxKUMxTa5F+5DX69vEvL4AcamoU55a9w5g/6XdzuanuOeM5g/S6w?=
 =?us-ascii?Q?KG549al2tI4q+4dqUFUC/Eik2lvjKhTBx5vdLgp/1YOJ39SZQItwxUpZsFOW?=
 =?us-ascii?Q?ZKSLRnY6I9jW7rkjoreDlh31VlpxEQ9fkr2eLQu/0aJFPj7jlna4zkEodcW8?=
 =?us-ascii?Q?likcLtRGCAUPUcXOuxERCI6sqrTAHkyNZHcsPuIAh8CaeMSqbVN9ITbmqla/?=
 =?us-ascii?Q?7M6SoS/GMUudDPTjX2dDghrKj5gp979tXUx+3jzpEiJgdwGtxrGSsSNJQyM4?=
 =?us-ascii?Q?55mJGxxLdDfBwBSmEM7a/9NngI6ANvyag8FwBHVUL6k3h3NbUwoLwNLnduwI?=
 =?us-ascii?Q?x2vNy5Xz0Iplhehyk7Ah3vmFP1PTCsnZCbKiiYOHCJ2Q+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ptu1FY1je1ffTZFGygoD0k73RuCX3i1EZgggPR3lUjC9l/fbov3/QQ9FnQvq?=
 =?us-ascii?Q?99mhvYjJCesZBH4Vv9CcmvlsHfWoLOlC/QeyEqv+gKdt6fN2N2fRZjJMoy61?=
 =?us-ascii?Q?MGtq+0BsLvLaByeJao+qTrRJdcEhTMM58KeFMs7RhVbGZDa7nwgkY6jgd36g?=
 =?us-ascii?Q?OBMxrBsH1ri3g7fkKKlsZtNOuuo3nWEscBphYevxzvxign4dENF93ARHYBxZ?=
 =?us-ascii?Q?a3jIw4WbEO0gmV4X2CJn4mvT6tJZr3Nfyx0YTeLk/okvlw4yY4WD3PRo1X4S?=
 =?us-ascii?Q?ewWu/uxGT5yZrwzHqNm+m5J9lsgZuLmm9fROI/JTCttxlbxni96haTKjo5cp?=
 =?us-ascii?Q?i+rlJsCSAtVmL5PYmaIeKL7EaNxZ855h8zZOQ4m1sJ5zaDzd7Ew/aAZOqUc4?=
 =?us-ascii?Q?AKV0hlbBK+7QWQN5I/bpSyM4FPwrUDCURO+yDpSRzvGvZqgi9wlwz4grNC7h?=
 =?us-ascii?Q?Ek4w7MVyrw58w/U8HevmIhBMU3PMCLNbDU0UonFByxyVPNmQgDkeXK855PVT?=
 =?us-ascii?Q?HjcvfPtDq8XXqYOcuDeKsyCr7DcKtqWvZLzXXYhMuQ/mXos8VFicO1vPOizn?=
 =?us-ascii?Q?96Q7e4cXNU9/uf2xk4vkUfkaI0i+4BQg6LH40u3x8ofJolKOPy4jVEQbG/pY?=
 =?us-ascii?Q?ZxrYe5nuBZ4CvWOlZdbd+jslsYQCzjMoc7SCaq3vGgH1aH2dmc+RynTvzwtN?=
 =?us-ascii?Q?6MRdXoLeMYvDzk24I5qT3/OnHGO6GvwgYbZBDLwYF0gxaKRYsZopPREuSMUt?=
 =?us-ascii?Q?+Y2M4RT54Gbunqopbfxh5l5XzDyEOw+cRa9nLujwtNnUQhGgE0N5RZCIz2PN?=
 =?us-ascii?Q?xqHZx1KYF049Qna34CehsJgXGDxYonVxhSkK9FIAjHMpQTkNppcsV/fbMnmf?=
 =?us-ascii?Q?XB9FVK9rGQIh0BIn1Qj5xAEyEiKjElgLG2gnKBUX1vFL1w3Pj8UXX8Bg7odI?=
 =?us-ascii?Q?JZTRP1P+dKTYFCZyCO/9wfL2KnztoWnsvOP2hrc9fMYYWFTMXk3xI70nhi0O?=
 =?us-ascii?Q?A67hl9/lpluAs9toU2fF3BgNQuxXKsc0h+o7bq+JSH4ZOeGEhRodEoV73ran?=
 =?us-ascii?Q?Vr/fSSEuAk/n6hvacIXe5v2fSW2y6KY+XPUZQIAO9DV7ometFPJ2lGzUpwrJ?=
 =?us-ascii?Q?iJcW6AYwqnVSG2c/mWx49X8veRCWyI/AhIn/CaD9p6O7K5EKvYWMY1gD4OF/?=
 =?us-ascii?Q?FgmoKs7M0rsiqaj34bXsa7w4QDoe4qjY4RqpKbrgWX2e64P4g8sxEjjqPAl/?=
 =?us-ascii?Q?m4YPjbCOpICDgJOrsNcH/f2cAeq0J4+Ryi5PXh5DSO3z6hug/jxiNWC6eWrg?=
 =?us-ascii?Q?C3DFXfL/CJefuQX2VSBLbSUCfx4yKGkbr6CAC1YYH7mDFiN3JC1ePIe/3YRh?=
 =?us-ascii?Q?Bav1DS3XTTcnNJO85eqUvvVH7VROzg36ak9BpbzZnKqdAV5rC24twRG08CTC?=
 =?us-ascii?Q?kkdweOOWjzw2lEaElyJNuN3cxd2fzX+sthPyroTlspm9LlSMcQDsHj1YB4LA?=
 =?us-ascii?Q?ohOOXNZ5cL26SoyPSbyFmXKkqZxfC7L2HC51afBEHzH4b4VOnm0ZoIL6YYbr?=
 =?us-ascii?Q?2i+/LZ63XkwfgSkTaV64VTKw0wKh5or5/1lqSrxskKzRXjStet19+2NtJPrW?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ec83f0-1078-4fa6-43c2-08dcd58048cd
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 12:16:53.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2bX4/LRkT6MfixX8eTmQToFfugU4w3XPsw2wbTh++/I7kjC8axoeoO3BpaKQCATj+baBsrQ64Ejy3JN2Ow4Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3506

On Sat, 14 Sep 2024 22:35:29 -0700
Boqun Feng <boqun.feng@gmail.com> wrote:

> > diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> > index acc1376b833c..775ed4d549ae 100644
> > --- a/rust/helpers/spinlock.c
> > +++ b/rust/helpers/spinlock.c
> > @@ -22,3 +22,8 @@ void rust_helper_spin_unlock(spinlock_t *lock)
> >  {
> >  	spin_unlock(lock);
> >  }
> > +
> > +int rust_helper_spin_trylock(spinlock_t *lock)  
> 
> I'd just change this to `boolean`, but I don't whether it affects
> LTO-inlining, Gary?
> 

I don't see why it would affect LTO inlining. The additional cast
should be easily optimized away.

However I'd be wary of the signature going out-of-sync compared to rest
of C. If we later use bindgen's automatic helper generation or if the C
side made spin_trylock an externed function, then we would have issue
(compilation issue, but still...)

I think we should stick with `int` unless we change the signature of the
static inline functionn to also return `bool`.

Best,
Gary


> > +{
> > +	return spin_trylock(lock);
> > +}
