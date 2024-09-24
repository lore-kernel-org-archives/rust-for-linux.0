Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021115.outbound.protection.outlook.com [52.101.100.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E0A335C7
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209473; cv=fail; b=JLLZ/WioTkGx+8a9fcaM+d64oz/qZkRp5NXC+oBoUxAdEXWPvBAUAU0vINIKbeCwLag85rNLhKE2lOtx/7fOXF1ngxoSAvieVDkit7sMCFzjbeTg6KtuYf1vMks35roLLSD2CYW1jDufUwQIuDi/twboFa2wkeTTJIFZdNJBOm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209473; c=relaxed/simple;
	bh=8kU54WfxRgGznL7KFXsiywqHC4htn8Ayhns2tlFGLxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g0z64iL9jVyk2P0h6VhcfPWZjapjHD2YY3C2g5a7mwF085yG4lKAd/iNVnrLoAeDveoZWpkMxgEeC3R9JCR7QUgBgNvyeH/TgyuEaffA0IRomyxdbAYoWm26+fjhMlz4Lzuv4JVAf7qtqVKhGWPT3Kz2ertGNp4mgDN3WqPeIZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AKBwZglC; arc=fail smtp.client-ip=52.101.100.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AKBwZglC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpDm+pbKIaQ8s/2EA8uxJ9L+eoBg9Ds+XsNlQiyjQ7t6NKGOzt0+ksZDf/3cEZM35pABiZlG+DMRThpVqXauCwx5bcIyuULyy6Z/u5gAM9FQ5reMgt8wz5avi0iBQzG2lfH+huuR2Pt3BFBo7bs8O616qtebl4aPmx65STbuJFBfXYFCUdenlaAfuFCITNPAyW6IJVqtTq2CXepMgzz/pt4KwX/2eYDfaB1bV/FPF84TvBMB/Y1CXOxaDjR9frf+cGfYoCeioZ0pZ5kmbMeuJ+AYh/n4B5reYHWqio802s32avezYTylf51LM4QBytQw1QXWV9Wf7r+JHjrVoy0M6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJ8bWZvA9rcISzYsDlXAk4hVRWUjaCUvvIBTnyv9/i4=;
 b=JnwO9qgd3nq/WEP8JWIoJJI2oM4dy8CKMqC8a7H4pYXqYkGAfnGeFlzd89bRCubtXzcQ3axTSEbbuO/T/iCsqAnC5Rf4hgYWI0ZsNf8jqgKWfyh/vNtenGWJVLYDwkd0zzKld2f022fc32V5tXVZhf0qeJJvCrej9uiGe4zC3noQTOIYBr207MSDzFqrHx3oeU898FXtj5eNkG9WRsmtehR23MrYv75FwmsyqAcqD4juxn1quIuHvd64gLCCW3vqp0NpzjyK3I8EcjU9MdxAcTkUU3aVc112ZBmkYyilQe2fTVUFGC9LpIAqAo3ODcb9aSyW1QrT1+EdEB+wKnQYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ8bWZvA9rcISzYsDlXAk4hVRWUjaCUvvIBTnyv9/i4=;
 b=AKBwZglCmXxEck/q+23ApOABOyNLJU8kMTIVqefzoy9BULvHqIcFJEYclL3//XQZPcwuMrhtYOgNo3kM0Rk/wMunjgf4A1UHEOpO/hFdJqNmpdWVgY62PgFMsVE2ZliIu6Bx7tqFadJoBoZOuoZKDTS0gGbgFF0FzV4Oc/FiWHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB7377.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 20:24:28 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 20:24:28 +0000
Date: Tue, 24 Sep 2024 21:24:15 +0100
From: Gary Guo <gary@garyguo.net>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Filipe Xavier <felipe_life@live.com>, aliceryhl@google.com,
 ojeda@kernel.org, benno.lossin@proton.me, will@kernel.org,
 longman@redhat.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: add trylock method support for lock backend
Message-ID: <20240924212415.06aec709.gary@garyguo.net>
In-Reply-To: <ZvJkFr6kdVx8kIMq@boqun-archlinux>
References: <DM4PR14MB727673292DEC9134C3FE559CE9672@DM4PR14MB7276.namprd14.prod.outlook.com>
 <ZvJkFr6kdVx8kIMq@boqun-archlinux>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0493.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::18) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 26798840-3e2f-41c5-3f4d-08dcdcd6e3ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IDfDTwOIRo6ZCC/OCs24Taxqen3ZMM5PCQMtlUoI9+WyfuDMkYUQjKoijDWj?=
 =?us-ascii?Q?jTV/PmUYhO+0lc7oEGZ/Z3ahGwbOLlw7odoakr6HRHdXQfUKTXvaPxHK/EHa?=
 =?us-ascii?Q?+L3mzNbYh07g6JXCyH3Abg3V8WTI5NceXh74FjZOaJWNR9awKyWj853ZlbJ1?=
 =?us-ascii?Q?g26ZswBgEerVQhRqbeclE8lnPmV+NHJ44/LHXBWJUCQiKwnVaJ+tDS6Mno++?=
 =?us-ascii?Q?CnmZ55+4v1hYPmrWfCmNh4dNbRMfYJ4ZNuhGvABjM0VU/rkQ/ogCjHLizenM?=
 =?us-ascii?Q?23MKV9QAdqBRKRTy61hWqV45Hp9IXqW5ULaUoEJ98A5xTI64zr2NpmnocrRF?=
 =?us-ascii?Q?zAnQYPHL8uBmJ0zV+j1VYK37GLV7nTLKow8fe2/0Rlrw0f4Fx0qj15PK5NhY?=
 =?us-ascii?Q?h59ooR5V/IuwmDFDjGcJe7Q185xl1/SNRHJGt6dbf3jYvCjJb6ztTGQ7Yj+Z?=
 =?us-ascii?Q?lrUM2qY0Qr5Jrw5Ionvj12xpNKQ9VXlKQUGuSWOsN2Uc9euKHb0/Rr3eYK+X?=
 =?us-ascii?Q?V4ZTEqqA0QDqQ5dN97Ly7jBYLvcKnA8MOkTlAoM9Kw1HC8DfA3MGBnr/TRVe?=
 =?us-ascii?Q?TYXmT9NrcUFMDODVGOF0GxzMdmLJVBoQY+gkpQQ0z5z4nbKQL3G0yYJt2Igx?=
 =?us-ascii?Q?M/oH45HBNr060ey3fNldMdZLX7IG08We6SAw36iCA7ecs6cB+cG1H1B2EPCr?=
 =?us-ascii?Q?7mZGxiWjEVj5X5SbY8kzAXMU/s7LPTNQHAlHq/wmdguQ/gqiOkpZgJT4cquD?=
 =?us-ascii?Q?g3QOFt40FhBXszk+BPU6AUXHZioSbqtuP6tABP3CljmqSUT5D3YLLXIyqAdD?=
 =?us-ascii?Q?gm2NYGp0GQ+2Yau1DHrVKtuHiqtq/YZdO0IOegnVPJMJIgE3UXcgPoGDFZ00?=
 =?us-ascii?Q?1z65MGj8wz2HsBQJcYBb//SPotNVYWCVx/87Fl6xDSIvlVXJIZ8yFKcBsRH9?=
 =?us-ascii?Q?zRPlS/cmgUpovt3G5zsxalg89hGe16yZ56RnKdUVJ+xCSOU2V6LB7+CnLByJ?=
 =?us-ascii?Q?5e+CAbcsJkctl3svU0hY+kdbVweIa+xz8FzsoJlsNbtjBCVRUg/trqeGl8Wx?=
 =?us-ascii?Q?vlT1hW97Pwrr30gMSyM6rb9CgmnhEewrNwvIIRl8w+GPAhOSD0BET4kDQdeO?=
 =?us-ascii?Q?0wsSrtY+ua7ZByHd09M/99twOr2oZTTEWwpvx9gnrCjSYDtIaFmOFvRRXGBY?=
 =?us-ascii?Q?/TJhWYtOo5DddBlRde/wv6uSUDdgB2AVQJ4PtS0o1IxDjweW4Ti5VoYXRxD0?=
 =?us-ascii?Q?6DvLWoyUDNwoGo3VReligSg9gJ+SSUB3LBWMQPKzRTlvv/ZC9arH1YH6iDV0?=
 =?us-ascii?Q?4PWYe1RztlW0oYAyhmlgIXicGpFjUpWfsS9hObsKIxQ3hOWEGDi+a1hZJ/RX?=
 =?us-ascii?Q?JOqj2oE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wFyRZg5D6uMTI13UUBcrLDKafLwpZyo8p0yizoDowaLvKoj0NUvJLraxtt4e?=
 =?us-ascii?Q?TNah9V9rDJhQzUgE9azeEhreefWxA31jPp8pJ0bA1MI5jGVhrfewzjTsiKau?=
 =?us-ascii?Q?TwgjlnfgoGhvQQoesUOmTNRMyDjomaqdzF2QUIyQyoVeqbzdRkWc3jwdjj2h?=
 =?us-ascii?Q?28Zjo6/eSUjlT6BMU+f3LCMj2YEH4ZTd1+NnCK6I3RWibOG26kgv0V1X9HqK?=
 =?us-ascii?Q?9UgGuu8Oti0n9kpEPjK56801hUML9Ubdr1mhi1SNWHqGwgruiC6m8/U4Avnd?=
 =?us-ascii?Q?FCI8txHjl50ycyeRllGkY/TKnhd6VBlJTUOQei0SZKb8/SyBxgIKKRlCZt/p?=
 =?us-ascii?Q?oUiUtN2aZz59HGyKnbzLotgOZdJb9IjDqkoPANl1R8Ujj8/TldZx4akV5mAf?=
 =?us-ascii?Q?rUUnvcOw9ndcS4qk1y5dl9UM7zwcusPWA+V2bM8xDp/Vn/KKGKFbDC7rJaSp?=
 =?us-ascii?Q?JF4+vPH4iMMaHodUA0tqKcMWXqsJMV+CDe7qWuFbqsZnPmafEa7Y6PA1L74f?=
 =?us-ascii?Q?m/l2EuDpIbKHe0+0HC0pE8nE84iNRPlw3Z+/+Ed6MDscfmNULxEhSDA9XM8f?=
 =?us-ascii?Q?nRWhSfld3iLpFBjPBsmu0H/Tf3rC3kVaZb5t2kIzOZORpsKlbln/4ifon/OO?=
 =?us-ascii?Q?7XAudFx7uG5I/6fpFfPsfw55qxKzs/2XcAFBuIlAs6jlGWyX8ORX0VItqc6k?=
 =?us-ascii?Q?U/9WrRStv5yqJTWxvqe6fETXUEZub1QkR2bMR03iAFC8bRYHDnT4LlvwcA6b?=
 =?us-ascii?Q?dz+bC/mjnjfo/77Yl/3gVYh8WOFgmEajOMeJuaD40K7fz8/qdz+E74iMLBgh?=
 =?us-ascii?Q?fofc3De32xZ+47CEwopzp/pMURPCDjfLCQgr+mIP1jtfbFekrPWQUmG1XotY?=
 =?us-ascii?Q?QAEhh9EeTuiKw6ePU+OMEVSBTSlB757urimkWA9Xetlx9an2fATleOAVKCpc?=
 =?us-ascii?Q?lsEbW0X2TXokV7aF9ftmIGwXWiwFyHUHgS9mqhwGzqNUOLOtvgSWzFWY7bNC?=
 =?us-ascii?Q?GVuoazWnh6pRcVmk9HlXK2CPaDMG/tCgtSiwSyLvimvjDShJ9ijJ4X67BVWO?=
 =?us-ascii?Q?Smu9KtN7OAjAeIYIBVwgsA2mwWwOlou6bJf2P+aJ+JvxcXUqOB8v5B6VGcbi?=
 =?us-ascii?Q?C01K3a6TdKikYH6JzkEsANpjLc6cqc9aYrIib1VpYnXENC+n90s5Nr3tjfGW?=
 =?us-ascii?Q?wDbE2sWMfBGzgsR3SrQD5JEpYKErCDMVVqSsH0hujX8kEIRBUSI68IX24g8K?=
 =?us-ascii?Q?4ZKs8XzR7E2ArqW88UTSNwrMjSMhPK7b/BXbb8xF+yN1FNJn4XxzQfdRE+Cp?=
 =?us-ascii?Q?K/c7NFKGA68Kd7oNg/bhAxODShl+3In1Dfnl+NIXm1vykxOuZREezFSffhxg?=
 =?us-ascii?Q?7N6/B+qAwlzWfTGlgqAxqwag03VcOW+tK02ImUrfJGPaCfgfekasUAz1nNVb?=
 =?us-ascii?Q?6+Q96fTH3Z+3T/EZbozDAkNmDdvuj6kQPPVbT7NjoWs3FuGsZiksaNFmve1r?=
 =?us-ascii?Q?IAeUtqSth0cWTiZve2I5PUxhZ2R1wsGo421YWtBf0NGuFuIxWzyb+rigr2d1?=
 =?us-ascii?Q?4Q3JgPmIGMk/xZMpooUBqtRnDuKFaazyK5elfQU43/swEm0kcICgABR02Fhb?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 26798840-3e2f-41c5-3f4d-08dcdcd6e3ee
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 20:24:28.6412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBLuWvpfqsCdcMk7IRrfdDHtOcJJqoffDyjeFayC1I4D92QP46nxdp9d0VH4frJcdKLvRq16RWvibkbWOm3YIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7377

On Tue, 24 Sep 2024 00:02:46 -0700
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Sun, Sep 15, 2024 at 12:23:39PM -0300, Filipe Xavier wrote:
> > Add a non-blocking trylock method to lock backend interface, mutex
> > and spinlock implementations. It includes a C helper for spin_trylock.
> > Rust Binder will use this method together with the new shrinker abstractions
> > to avoid deadlocks in the memory shrinker.
> >   
> 
> Getting better, thanks! Please see below:
> 
> > Link: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@google.com
> > Signed-off-by: Filipe Xavier <felipe_life@live.com>
> > ---
> >  rust/helpers/spinlock.c           |  5 +++++
> >  rust/kernel/sync/lock.rs          | 16 ++++++++++++++++
> >  rust/kernel/sync/lock/mutex.rs    | 11 +++++++++++
> >  rust/kernel/sync/lock/spinlock.rs | 11 +++++++++++
> >  4 files changed, 43 insertions(+)
> > 
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
> > +{
> > +	return spin_trylock(lock);
> > +}
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > index f6c34ca4d819..f4e51a5a1f23 100644
> > --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -58,6 +58,13 @@ unsafe fn init(
> >      #[must_use]
> >      unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState;
> >  
> > +    /// Tries to acquire the lock without blocking.  
> 
> As I suggested in v1, "without blocking" is not accurate here because
> a lock can be a spinlock. So you can just remove it. I think the word
> "Tries" itself implies "neither busy waiting nor blocking".

It seems that mutex_trylock contains a loop, so it's not
exactly wait-free.

Maybe `blocking` is indeed the correct word here?

Best,
Gary
