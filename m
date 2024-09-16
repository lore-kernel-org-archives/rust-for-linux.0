Received: from GBR01-CWX-obe.outbound.protection.outlook.com (mail-cwxgbr01on2122.outbound.protection.outlook.com [40.107.121.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9CF1DFE4
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 19:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.121.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726514918; cv=fail; b=NHBpsf6+S5ro1Lr4onPVVZKPImNuN69vVMv1b1LAWTEt0ujyBUoxZxVpEXaeYbBdk2hdixMnC7eenKkOKgEShrkqCoc/k3HWazHywf6f7++96/DEMPxrqiIH6Jn6/HUwdnWA2Z8pghstZnTdULSXMmHLo3L6jl+i4hYlu3J1W9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726514918; c=relaxed/simple;
	bh=HsM8cgmb8CiebxEr29OBfqutoMzze1DDaeRZXGwDZyA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cgd3ZhKXQKIDO2Bqwo9rmPdSWjkQw1j88XWDvKciojWAHSs6NNcqnbXuec9hmaEGOVNHBfJmJivqyd4PoR0E+yeyduPxy5ZQHIVyIU35A1zOYDsA4LquNba4Jd7MvFG3VKSnqJeegFkh6LcXVvEheZ3rvzZLUr5GL5+j0/B8Pt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=S7IYlzpt; arc=fail smtp.client-ip=40.107.121.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="S7IYlzpt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksn1yTbbMcCqboK6mlgfnPXouUys3NhnyS2CG1wBvlosYuPG5zBB1099qmlDexlawbKBQYRPrGUI1nN/+m+954roCGbI03H1Ja8K+I45dC8hz+cRoeGcqnPG2wwN0I0GLqEUeqgEJLdC4cXjekw3vS94D0HGP/QSaZCDYleU5NtvkbshVKBsYE060JGuW6X572iBbj4kSbjqtopXfdS1c/zSXi0ZURVtETnnqRi3XlJu/XABKcoZNGrLtq0/KaR03DThUGjc4nFW+NwU8mQ2aMkBmsT27is8XtBq6bFclMUmSRWWN9UXf4OhiMSTKCV8IMhsvLGzi09n/3BjCNOyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PrMEboGy3LNOJoLJoMXi4t0pi0Eu8ZbZHwKAfEphok=;
 b=liDc5NkX1uL0WIxliiv2UORu/XP24i1nzdRHId1kLSXjtKI8GbnpNkXl5qyRvB6AVcm5pZ4wGN/m1KjNP76m1siCxliXIIE3mYu2cO41iX7bN2wdGq0y/byQnO1bgm/TOHixMJgJN4X1gKnBzCeeqySOFwVGcLamHhBVETJm7nuxFlLfy5auspyvOr7J5F2kmuoTIY0Y1pr0KDqZiHNlhXAtjhgacPjQYzi5NnMCVEgcRym7w7eO3NDtF1ELpCZSqlmvo8bcCl7vw2Dtu6bpLIC/uxNHs4z9c4TkcUSbh8WVyUYe2LPRyW0ibRuAqJ8ke9SNWVob+5mLDxJdLYD9Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PrMEboGy3LNOJoLJoMXi4t0pi0Eu8ZbZHwKAfEphok=;
 b=S7IYlzpti7fhdpVRtf7flJY3pkzjYhb1J2ovVYJpctQLf34awvI5l0AaUDveWBRxFA8+e5iC+rSUX+9ukVXnw+UDMD+j0jfRU4pPH24aj/2vKk5uqSwMd+MS1Bv/qZhpke5N7KkPEEMnbwnxk8SZOZzYxTt8bTMYLOp3Wh3iUR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB3655.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 19:28:33 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 19:28:33 +0000
Date: Mon, 16 Sep 2024 20:28:31 +0100
From: Gary Guo <gary@garyguo.net>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: <rust-for-linux@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH] rust: mutex: fix __mutex_init() usage in case of
 PREEMPT_RT
Message-ID: <20240916202831.136eb76b.gary@garyguo.net>
In-Reply-To: <20240916073752.3123484-1-dirk.behme@de.bosch.com>
References: <20240916073752.3123484-1-dirk.behme@de.bosch.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::18) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB3655:EE_
X-MS-Office365-Filtering-Correlation-Id: 3604499a-2244-4115-13bc-08dcd685c081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uDWU3P6NlNdDm4PGwcrth93SsE/6AFYUVVz07TrPkq5IulxU/DAktwikQ1Ul?=
 =?us-ascii?Q?2t6d4CMZCAR0mayjxNrVqIBPLYNzDG2tfLeyofHIGLw00tSf9iK1Lh2pvrWT?=
 =?us-ascii?Q?JwE6OrN6Wa+/W7KknzIYaDsyAcnJzckWptZ0aXG7t8fsYzq/yf5Jjh5N5IdO?=
 =?us-ascii?Q?WwYMud/zXIqQNKVgUz43K10Q4DKF2Skayv8RQFQG3CChc+sw4QU6RrAcRWYF?=
 =?us-ascii?Q?SHbUB00a3wQoqW02mxkTAoE7lwKpDYZInKyHdAWycwu4RPTmwMeNVyGUXVyA?=
 =?us-ascii?Q?ETdpKU9owjMbqZd2dclHPiFY0gnscadqWSccjGTuJh1DatnQ1nWzvYZQ16J6?=
 =?us-ascii?Q?kOl+U1XapxhYQMWIIsgYJFQzOcJOhtsSkuWtDgne/eMtXVVNMPnYTBCPslta?=
 =?us-ascii?Q?R427bXb7+875dWM1SlKEPPStI6/13Ys0JAWWI3rjlggXtOcGAkjM6lptttkb?=
 =?us-ascii?Q?IDU447AgbSo5FrLCbs9QQ1yOFYLAKKb/z+0D/L+Ylu0GuIXQB/mXr3angZkX?=
 =?us-ascii?Q?olGvw4WByheJalJ/E2+KA/+BbP+KTpNFlWEJ+V7SkdIrm75dNzQijTS2X6tD?=
 =?us-ascii?Q?hQvaOEUCB5cbciS8Se3SWcr5Ja2DqJYxNRjhH2MfDfM0bGjj/4CyY/+jbeST?=
 =?us-ascii?Q?+RfrV3xrsunFJr2mPr3OeWrs7hDHt9b52N8kRcfY/wjKUwmLR1c67X0JH/vu?=
 =?us-ascii?Q?GmoXj+GwJ/xuo8wXsz7KkPcxwz66JxtcQ7BIkRD2F7DzI4Y5AWQ1KiH/m87l?=
 =?us-ascii?Q?Kxom6P8kPHAG1JlCkYlbjn6WKxPu9+Doj6Dvtu7ZovT+OKA4hGC+omZle0hL?=
 =?us-ascii?Q?Gb3RQqlL1Pk/Wq1FWp1YkPM9ndPYcM1e7P3dRPR+Rz2mB6SBy3+mrUPDnwK6?=
 =?us-ascii?Q?0MjDxoQgmLGz6bjkUPyCZ72NdAl5pxNUc9kEMIP8EhKY4LNW6CuRzv4aj3I8?=
 =?us-ascii?Q?4sycvL5iDFt1wURzQbcYoNtTLoFXJ23ORkrNa6ZwN6KwavQ3dnJN+16/3Ul+?=
 =?us-ascii?Q?du9d1kbprvAJ5BETYsIvayU+mxYSyVyDWH4xV/qycrGvPWK+vwcWmJp1uABh?=
 =?us-ascii?Q?ep0AAAiOfhkM4rrWXhU70OgxmNY38dbq2aV22aljNGDXKGLIWD7pmW+wYQxK?=
 =?us-ascii?Q?wL0TQNNzUOUszs+fSIxPJf1wHp6wwu6ezlZWd3VlNs7L2sLTMzpn9tzmBcr0?=
 =?us-ascii?Q?drfY+vme1Z1iVnFtNkwB1AEtaHnyXkIn9LzaG5JQHglvLLpeFLj1H2PtU/oX?=
 =?us-ascii?Q?Fw5E6H2PfRj+NwQ9XhqRNakno4fYrrE5EwqS8jT70tNG+9I8Dy+mvqdFXIfU?=
 =?us-ascii?Q?AQXg9rjMJ3y+LBtx7dkQoTx7WBlhjK6Axx3KpzhTdAmeoTQ9ivEvYhalam9F?=
 =?us-ascii?Q?ZhAyeJA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b/wpzSjcDOlzZvei0Souo+1uc2eJknlLPIh3nLfy26V6LEaQ53gl6EiPKlno?=
 =?us-ascii?Q?fzeaEyUUGufu7QugCil9HfSh4hvRIorthTQws4HiYpXZ1GUDYtNVTghPEEu/?=
 =?us-ascii?Q?BK/ev9T84T8Jwi0uPipOXXPHsm4YeuxrmE5cSC25JIan7hhoSj+CatvdksO0?=
 =?us-ascii?Q?TkEP5hE22NpvAgux/UrEOqtfairzH2qFOSaeA+E16d+SK6aiRNtmlKWGsYaW?=
 =?us-ascii?Q?yt+oQzL7ASgRt4L53oplY1SrVwOzx3kjVlgLqbb2Peq2Q+O8w9O91mkQ/vRK?=
 =?us-ascii?Q?WF9Irg/7iKP9uqqiNqQfMXu8dwQM9MGsi2jqcUMtaMUeuqC0Ctc9gJDW9hmJ?=
 =?us-ascii?Q?C+IVJeQcQ+KmrHJFdc6q0eCKvWxVnwQFE+NBSeLHgWn3au2UHsAooLpWoj8Y?=
 =?us-ascii?Q?k4w4WR7e4slvqzBTIHHK2EfkLtH/YoCkKt+oABye3I9zajTCXxQurQJKmQOL?=
 =?us-ascii?Q?TIZnE3sfz6wtDsKesY0yl/JrdHbEfL6ILus1yJNFiB8Kwsld8ZmoOANksE46?=
 =?us-ascii?Q?FkRt8VHayWv0KE8AXKuvtyR8mYy1Zw1j9yzlHt2E6r53UBziI2kVT30pxpUL?=
 =?us-ascii?Q?mobqt1DIIZg9NHcOO0K4EaBN/oUwjLd3HCaoqIDjUa3ja7hNI1iXkfhEm1Bo?=
 =?us-ascii?Q?bYN5og4QY9Oi28Ps7BxNG0EJRkx+uL2ESybF9t9AkB0CbzJEXvQDmROCYbG+?=
 =?us-ascii?Q?2a5CycpQL6+3v1EdX7ZXUZ1FFSlMxqWwrGh1JF8Ztn01jxNSpeI2OmGcNb8N?=
 =?us-ascii?Q?EaNYmYYweiv186/gK5W72W7qsIzCJulAiqYvH+ovpoxmZYoJ4vf5mrIw8kNJ?=
 =?us-ascii?Q?f4r1bem3zFX9IdorddPUmzMAIO7HE0uilVUy5ygvZTpch2HdsRdwBrtPbK6s?=
 =?us-ascii?Q?nrkvvaxZCJYCJQ93nTvhlGlkEE277S/Ni6alRrWbyiydVGPXA3NiGc82Hr1F?=
 =?us-ascii?Q?1jmISP88SQQy9f8JZEiNkEzqc3uiDQGBqWyia/u9CXAlOJhBe1ukZ+ZRpJG4?=
 =?us-ascii?Q?c7QoxMIaOn69lG16K/5Q0XlufMpIHv64s4zpkZyATQ1YoJRhddM8GAlEy6NM?=
 =?us-ascii?Q?fhF6EwCFqcHHk1M5v6kPx1lOmd8K45rE44Cs4vzNSAB5xG2aGAxee7QEsCx3?=
 =?us-ascii?Q?J/HdAyFCgaDnZiPNFn+d8kuubIoaxWpayuNMMFnCp7+St09t2lf+qvddDg6v?=
 =?us-ascii?Q?Wnv933i3Z1HQxlyzd1QpyuqAs3SofmcaoBu8MWfC63INXu5QpdTfFam6atmg?=
 =?us-ascii?Q?mA05Kzfh3DoP7rQ2OCyZtrxjaMIMUERde1tpKU6dqqUd2GP8iDFg+wB151CB?=
 =?us-ascii?Q?rgoY/YmjsNY3fkTPnqo+QW9+7stmde7GBk2dptLcsHcV97RZsh5onSNwbIPq?=
 =?us-ascii?Q?QbeQFShYS/BNkHMPp9lAMgwpz0rJkVZ7JeBnuqfAaTH/1kXulkHhVPcVJYjf?=
 =?us-ascii?Q?/PvXch+h9xPYCG4Wq6jHm2mQU/bb7onAvW5Vm+OUpk6msfXh2ZKH2tVLMOO7?=
 =?us-ascii?Q?0gRnwwCFcw7hm1yVaaNOEHHPTVwHg/C6n6vRYgkMebLuZo8Hhu7dmufhoq5H?=
 =?us-ascii?Q?ynnv7YNiVKc5lm3xWhbA1/T/RXYObteNM5YWrDSd?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3604499a-2244-4115-13bc-08dcd685c081
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 19:28:33.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H512umb8mqbMpZzueZXhvLgxy4UvEJOVA1OjahqebFo/zt1UuwqKJ+0gQkvumyulYiiI9W6qRBwfFD7sLHEL3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3655

On Mon, 16 Sep 2024 09:37:52 +0200
Dirk Behme <dirk.behme@de.bosch.com> wrote:

> In case CONFIG_PREEMPT_RT is enabled __mutex_init() becomes a macro
> instead of an extern function (simplified from
> include/linux/mutex.h):
> 
> extern void __mutex_init(struct mutex *lock, const char *name,
> 			 struct lock_class_key *key);
> do {							\
> 	rt_mutex_base_init(&(mutex)->rtmutex);		\
> 	__mutex_rt_init((mutex), name, key);		\
> } while (0)
> 
> The macro isn't resolved by bindgen, then. What results in a build
> error:
> 
> error[E0425]: cannot find function `__mutex_init` in crate `bindings`
>      --> rust/kernel/sync/lock/mutex.rs:104:28  
>       |
> 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
>       |                              ^^^^^^^^^^^^ help: a function with a similar name exists: `__mutex_rt_init`
>       |
>      ::: rust/bindings/bindings_generated.rs:23722:5
>       |
> 23722 | /     pub fn __mutex_rt_init(
> 23723 | |         lock: *mut mutex,
> 23724 | |         name: *const core::ffi::c_char,
> 23725 | |         key: *mut lock_class_key,
> 23726 | |     );
>       | |_____- similarly named function `__mutex_rt_init` defined here
> 
> Fix this by adding a helper.
> 
> As explained by Gary Guo in [1] no #ifdef CONFIG_PREEMPT_RT
> is needed here as rust/bindings/lib.rs prefers externed function to
> helpers if an externed function exists.
> 
> Reported-by: Conor Dooley <conor@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/20240913-shack-estate-b376a65921b1@spud/
> Link: https://lore.kernel.org/rust-for-linux/20240915123626.1a170103.gary@garyguo.net/ [1]
> Fixes: 6d20d629c6d8 ("rust: lock: introduce `Mutex`")
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Hi Dirk,

Reviewed-by: Gary Guo <gary@garyguo.net>

Thanks for sending the patch.

Best,
Gary

> ---
> 
> This is against rust-next to use the new helpers layout.
> Due to the helpers layout change I'm thinking it is not worth
> the effort to backport to older kernel versions, so I intentionally
> did not include -stable.
> 
>  rust/helpers/mutex.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/helpers/mutex.c b/rust/helpers/mutex.c
> index 200db7e6279f0..a17ca8cdb50ca 100644
> --- a/rust/helpers/mutex.c
> +++ b/rust/helpers/mutex.c
> @@ -7,3 +7,9 @@ void rust_helper_mutex_lock(struct mutex *lock)
>  {
>  	mutex_lock(lock);
>  }
> +
> +void rust_helper___mutex_init(struct mutex *mutex, const char *name,
> +			      struct lock_class_key *key)
> +{
> +	__mutex_init(mutex, name, key);
> +}

