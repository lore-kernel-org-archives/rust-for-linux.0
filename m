Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021113.outbound.protection.outlook.com [52.101.95.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D73A7F4B;
	Wed,  7 Jan 2026 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767807469; cv=fail; b=N6hzHrEMsIXKLxgroVlZxFemouqZahQX33Pmkl9J2pv1wKHoaIzL1gE2sOfXdrMNdYTocfOIKO5h5EqtvlJ4pT4OaBV9C0cg5oAsTLEGDzuSjBu418zwWHSx+q/N8g1nttpiR5qgEsoBRtVQ30t/aWNrUH33jnRbTE2dqcphzPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767807469; c=relaxed/simple;
	bh=JPhNbEDxg1wMjeHn7p7CKUtuZLYfgQ58rRd5t4Pz1+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ANIAE2Z8DpPurKsI3zxL9GfvE+ZkmNCeGWdmjtF6KOdCOqQ8XHOncAwEOxtebcodNygwOpsrptw7IZtQ0w5xOX4euPZCOWj2IRv33RYnvpSgCt3HpPaZ20GpjFIga/4AalqhvaBf14FgJWJh61ccoei9rFyCqifwuuro7ZCRIlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=A5ef1BBC; arc=fail smtp.client-ip=52.101.95.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="A5ef1BBC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOEJ+4m3m6osHqGHzhp5qaI+oLskixgJcODm43h4H24qrdCE9xg/y6QHUOsdYLgHdzOOwTb0gasDoXvMt2mLAuLv4cVRs1OndkiWg+KC52g2NtPBfKrFHC3N1Fzbw3gt9hA6lTrTT38jPU3KLuaNaBG5eeIn6u6iY2U1e2nMr59ST7x9vJL3vVW9DUBJNRDl5bxnK1wNYfDyD4tA9o1GTKVfawfw7sNTGP/h0ozbyuXOmD9RiEsb8r27aUPLFnEdDdz6aJSKFrfIi/RBJxTnKb6NHXpesRiJ+o9mRlq+SxFcKU/8atIB7Zqt3HVAW3533/oA60D0ITDalAcl5Dm4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br2kGKm7pOTLdrTMmgew3bpZ0HI24FzvQdgcjpmdABA=;
 b=HEbNjolQjbp0zeXR5o2rFzueypWTLIMt7huvaZKdg4AChibq5UHaoXQWSFuBm5Cex6Aw6VddPvbrHAy1s3GSqdk2Uj75lgUaNhVRK3MPC4uKT0V6LpERjeEBRUQj4neCzng4Eq/pTnyD31G3dAiT/1eZn6iWdmz9KOK5gTUbi0bs8gVUJR4ha+VsMA1dQjTwe2CG7xhCDUXf4K1Eo+gLIplDksqZVCjM4lIAmSrC/jB/v4/6haGjugg9COtjnKmuAKWXuY1O0hDj429w9ttfjDG9SiHnXI+DGB9i/hlu++zW3gHHuyhAacK4eYsMkYMTLjIG6sUt926Q5suH/ZJVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br2kGKm7pOTLdrTMmgew3bpZ0HI24FzvQdgcjpmdABA=;
 b=A5ef1BBCSr3+lkfPMOV8FQZuos8B6Wrf6H1PBUB1w82MiLwNygKOS0TaKZdbQRUbEPInMCLjduuqFo0GB9iUUs+PCdffLWGFEkVPCNvscIMoh2lDJDJNmvXVM+34TF6jdlws1NFBKf9uJbNYA3rhlqpiuyzPGHxlKG0uCNXH2VA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6264.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:273::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:37:37 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:37:37 +0000
Date: Wed, 7 Jan 2026 17:37:34 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>, Will Deacon <will@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Miguel Ojeda
 <ojeda@kernel.org>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: inline various lock related methods
Message-ID: <20260107173734.03081035.gary@garyguo.net>
In-Reply-To: <20251218-inline-lock-unlock-v2-1-fbadac8bd61b@google.com>
References: <20251218-inline-lock-unlock-v2-1-fbadac8bd61b@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0471.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::27) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: bc596673-dab2-436f-a92b-08de4e1372f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1rFlWRTCux/XOC8wsbuqAyA6SjLTPqWe25ugijDHhRgnH8cLNMP4hJEpYJaX?=
 =?us-ascii?Q?ZgT66kyMSNDQTrXVAknEFPGP0/MXGBhA+7SLCeXbrt2vo0rlfwcvkc9xZA79?=
 =?us-ascii?Q?odRhlw2paQ9dY7kk10p3UB1KhiMgczEgZg5Nq4+SfyLK5UOo1owRH6JwFGJ+?=
 =?us-ascii?Q?7GPcAy/wl5sJOfBJ5u2c3qqCMoBSpFt6OaRtFDF7N1YneztV4tvdzzFG6bvV?=
 =?us-ascii?Q?/GulLCy5e+19IwhyXtxogZzmyNI97Mwk0SjrNMa49MSKRzTcLF57Yf4wyJKG?=
 =?us-ascii?Q?2ouUM7+SZgGdBng52OeRQpajOkKLY/bz2he90wYcIxmeHRfcs6O2VO1wuDLz?=
 =?us-ascii?Q?yFAid25qOeudOVn43heERBPG6bs+Da0GigSwlcyWDQQ5e+Ppk/1BLxzyCX5o?=
 =?us-ascii?Q?8GsBDkdm+kQIgU/WP6cOIo3ZFtWI8mCKYWwdKr2WGXBVCljceZLjrkuHkjHJ?=
 =?us-ascii?Q?S2nCLOWxeGi3gjUH9/L3Mx1DSlbISsM3fhYs5Z75V1g0z+Y2Es+ccYD8JQfb?=
 =?us-ascii?Q?cH1MOqXYYtWKq4kuldBC7zgZh2nPhhBcshLkaKfTlK8N+fuEwqx0ND8jeF+p?=
 =?us-ascii?Q?OhfSP7L2MTo/Cv2GTu0xJPLJv86tDjRlg9NmXeYT0vk870SwKYknKKVQ4jOh?=
 =?us-ascii?Q?Qm92gS8CS9t2n544LoglHufjQwY4AGKAWoWdAaKv8bqF4FpANYq0p+i+bPnA?=
 =?us-ascii?Q?3GE2DhhMfnNRyQP83SsWPcE2ziRS4rbRyRKpIuxf2cV3/WuM6DG8uBOOJsEb?=
 =?us-ascii?Q?l77QYdTsn2XffKvLlJM2K0aVocrTrHmxJ3Hy0XFmthJHeJ1j1nTokblRh9lc?=
 =?us-ascii?Q?ooDPcjae7JYEZ6LPGPa6Ei/qGK58G1JVrGy9X5IR+hXXElIJT6EdAmHx2LLv?=
 =?us-ascii?Q?lEQUaThfQLa5NUilQX8wXaYgB2TLPEsZTU5gI+0C2EEIq1XUe4M0gg5xuHuc?=
 =?us-ascii?Q?eFi6K3NzF5iukuXgXljlxSDhUMJO0hSxAa86BbPK3d2TlVfZ92ffnIkiWMfr?=
 =?us-ascii?Q?Ij1O8NG8muakBPtrhUYbedbtZfmKIUST/mm6p01+ksMQJ4vL2xY+K/pEkPNA?=
 =?us-ascii?Q?hofRGlCEGLulz1qzqd2PIgs+eBOHMBdp+EqYjWU/jzBVzoGRHtnLYdp5H+l2?=
 =?us-ascii?Q?W65vk063aFeaQWt7uBtVEGlXC44OEZdGMCS5xoNFoUIQqqVvukuuDU7tNnCl?=
 =?us-ascii?Q?PJvdr4mLCHwN+OfH//dfLyrjROh3u3ToXYNcUSCKATLjMrn5aOzVoWYJitcx?=
 =?us-ascii?Q?M/xD5DH1JOWLjTzRuV7/XJKb0v8sxBq+MApd7eRImMkyn2wNPghOL/TON+SK?=
 =?us-ascii?Q?L8b3/jCR7I/IsRfHf9H2ldhUGEVWvpSDCeTH+EqMPn/mlZf6Zb08pjnF3gu/?=
 =?us-ascii?Q?AdNfUPX5oO9c0zv/WhGF94LaMPUrTSOXuJQOSaWB3ahGsmBrhvXJJUXppiWL?=
 =?us-ascii?Q?myzwgOm1YcgC7XPLyWrf0jom7xOyZVXH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VpBmsH98NFRvJi3PN+/mey5/u/4MG3IcncEbUmobtJtvsRUIWDeH0u5zZeIV?=
 =?us-ascii?Q?N1OCVs841Pr8BQWVDJqJ8EVHaWlbq1fGd5A1zD0WWNKNGMFaZaDQPOdARy2y?=
 =?us-ascii?Q?DBGXzrcUNB8ll5wwEz/GP9UgRn/ACWHGMCK+7a9R7XNc/kUsZoAPiM2TT46T?=
 =?us-ascii?Q?jagbmjMHMsjDHdS2DCfoDS3X78nw7nL3r+dxPVyEdQUGDnHhZR9IXHHPLyDU?=
 =?us-ascii?Q?GwjPk9LjlH5vXk6QTU17D/OIyJkvYh9mQSk/IZ8odVIJUe+hEX7AL/rei/eS?=
 =?us-ascii?Q?ud4EmmpY0+tzrKL+5v2AeyrK3DCy1QnkNe0ldmG7/KI6rGERokaVR9H2cb7t?=
 =?us-ascii?Q?/kvUrDBknOT7dKgBBvYkJjiBiQSCYiXaCLtd/xhYwIUSDyEg039FULC5gG0J?=
 =?us-ascii?Q?4KeoGoSMvvJYLwbMmeu6KLSGcSR5zh7Et4zRshlb7wX7RwSzXh6Y9QFGtKtb?=
 =?us-ascii?Q?BgZaaZELzopXes8KGS8gAe0N7/f1iHG5ajXY2vmR62CbcoPfJV1mc1YZXRlR?=
 =?us-ascii?Q?wLVMSzdRXeUi9h3DCJJ/VwahrjD/inmFuUAGBOadBZGeEFIVeBJab0FZnON6?=
 =?us-ascii?Q?wF61Qq5CIlzwd2WrIc+G9qJh+PoJQ95gVNF/IVJSrItoHXzx0Vq5fyElZdvq?=
 =?us-ascii?Q?3r9Qnzj6pJu9oRRZ0RzaXqApVS0vkIx29JLQODdX3RWYU44vz1RUfRru0s5g?=
 =?us-ascii?Q?RKAgCC+iRxJmVoPFjk74J+kwSs6DBAFz5Rl4Ujw5ejGNOH9Yy3xNqViPqK+D?=
 =?us-ascii?Q?/6fs4Oes97pBZpotsrmW4BfoXcKsTA1gieOusIvw6sUz1S+WPuMinYdlzRNE?=
 =?us-ascii?Q?NAJK/LBmCROeQLzAZXmTpEaXZeUVqYigGpZhhBAo78BFprb7VmmGVOwaoJ1O?=
 =?us-ascii?Q?7Wxxfx2z7euwtM2OXqnbiMwRnNI7QhwZRgm+//rmxQNfDxxVLzwZ8APqm/14?=
 =?us-ascii?Q?oUOHau4lN9uYaJKXlCGAm3wRp26TDWsCE1AgjxazZaUkHWSaPdQ0ZR7HXygm?=
 =?us-ascii?Q?EnI458qz2Qn+IGzMgChB1iNfbLzJXS7F3hf+j2qhNRA/Yt3+SYFPWkp114Es?=
 =?us-ascii?Q?Oq4y7IbezZnXEWGWM8REmYSxaYigKIrvN5bvdb0I2ea/Wp2MCByF85Eo8de5?=
 =?us-ascii?Q?75FvPGCpmaCSeVCeEv5WRi4ZNpsn7Up2LNooba0ma7bOyf58CJWv7eh69BDP?=
 =?us-ascii?Q?uS1sTbtOSUa8wvR62lpXyLV026j8P3xWKgC2nzDFy49y9Mnaysw5+G1FwyPj?=
 =?us-ascii?Q?ArNDbMwKCz1/qO/epfP5x06sLUY2iEg6dM4qbKETgb+5rzX9+F0l0rEGCTgi?=
 =?us-ascii?Q?TxeiX6Zu3sujrQ1kx1cNIwdl2ikm9ELJErYAW7NjK7X4ImyzJSU5gVO2BoPY?=
 =?us-ascii?Q?0TWaqcmsF3n42+Aklcw1G4Uphde2YtlpwN3ldc7zu/WfnrYka6R7MmdFdfmm?=
 =?us-ascii?Q?ry1ir4OmoAqEpiBmNMOAAfGA83LwbzN8Iz3QDduERkHb567oKeXz3n7ekugQ?=
 =?us-ascii?Q?T5CbaGrRBbVcC2o1vKassVIV1MDW6Fr9vbH3FGDcmjWEFTjyjUu9I8DmY+YN?=
 =?us-ascii?Q?YeCdLgeppeIbZ/pUXdH96UKMsDyzjok6LFc2YvLhJIXy5wj9XoCda0x8Iqpg?=
 =?us-ascii?Q?6IwxMHnpQr/10Pz/I8CMEaWuOCYVIknXJvY3nKiokbV1a8BlDZ9Aku6eejVR?=
 =?us-ascii?Q?GpcD9MSM3DJ8LJNSHAjKen/0gCXqu7u0ArrJJ9Tw5cLwwsyRqG3Ykg97G3DM?=
 =?us-ascii?Q?dYMCCBCN6Q=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bc596673-dab2-436f-a92b-08de4e1372f5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:37:37.4477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJlyXkTG9MvRz6kE06I8b6SgoW1NDJcs+XyhhMBh/sSHQP8nnNfKmp2qmcUGBmk3HOxaThclOoK1G7yq8wzMGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6264

On Thu, 18 Dec 2025 12:10:23 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> While debugging a different issue [1], I inspected a rust_binder.ko file
> and noticed the following relocation:
> 
> 	R_AARCH64_CALL26	_RNvXNtNtNtCsdfZWD8DztAw_6kernel4sync4lock8spinlockNtB2_15SpinLockBackendNtB4_7Backend6unlock
> 
> This relocation (and a similar one for lock) occurred many times
> throughout the module. That is not really useful because all this
> function does is call spin_unlock(), so what we actually want here is
> that a call to spin_unlock() dirctly is generated in favor of this
> wrapper method.
> 
> Thus, mark these methods inline.
> 
> Link: https://lore.kernel.org/p/20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> ---
> Changes in v2:
> - Rebased on v6.19-rc1.
> - Link to v1: https://lore.kernel.org/r/20251113-inline-lock-unlock-v1-1-1b6e8c323bcf@google.com
> ---
>  rust/kernel/sync/lock.rs          | 7 +++++++
>  rust/kernel/sync/lock/global.rs   | 2 ++
>  rust/kernel/sync/lock/mutex.rs    | 5 +++++
>  rust/kernel/sync/lock/spinlock.rs | 5 +++++
>  4 files changed, 19 insertions(+)
