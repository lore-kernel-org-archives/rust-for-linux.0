Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013056.outbound.protection.outlook.com [40.93.196.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4005139D;
	Tue, 27 Jan 2026 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769489385; cv=fail; b=PNonuIeXj4IcXgBjZHnRVrLr5Crqf9iB8osV6TZI3lWeiY+kUL2l3Xl2AweKhVbAhhsI0fxZglP13nduWAjHXdnO7Cg0rUQcCDB4ktVVA5R935isRJiRxHSLXmRTgvFLftW2XJdCtzHkaFSY87tTOjEpccPOrBydCVUNbJhAnQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769489385; c=relaxed/simple;
	bh=Xa3zSe32EV4ikpho7mT++cFruk+AtFXbz0csohS3veQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=avc9TlVivu30CWoPjKsgMHxN1r9VGSHPmZIcKJX4OImLd8GqUADqb5lmLXAxgT5WrTB698D4asuYvRMzMJVKGX8eakt98378iMnHV1ar1+L7RmCzGGBOZnWKdLUpIweEoRb2fKdSMfua1JnWpMdkJfJqxuPnQ4jGCHR9eiX6n3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cg1+iWXO; arc=fail smtp.client-ip=40.93.196.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cg1+iWXO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctxDi3M2TB/vXCm3jTJe890JOOmI28d5EDRN9uPWDBJTdH9y9WhHbnlw5hH0Q4tLXJ8fGTQ50lcAduBYsvqFjRS0jMxNC+LBu/yziq8MVMJeo4/YHWWLCA8vLPC89HaOYPUgUtR/SXsWixgHRv+og3OGBRR3/8+CX5QfqLCxfKApa8k145WfzQDuZRw8C7tmXCA3/RRtLovIgtHAMG5PpFKaqnreF9GMDU1LLCXlTGJLK2e3KQEHNNoW63t4SjxNIBIrnJ0ypYyRId1ZhzSAevusaFhCXYZb0F7n6Ekiz91uG6hUVtCfzU+/k0fHJTZ09FUquV7WT9pRSNAdq30IdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIeSpGmbrYeXbAa9trVWq/y7OVwqeWle2SwMny2emy0=;
 b=FlLWhFqlqsV3LIo4zcUbWwtl8BJniKEaRbCSin33HZBvEtMev1Nm8d0Dumtjugd/E4Y82MZiMZtxtA+u6LXO8shRhpkQePTer8KHvry/MHcZPlR4g9+Qf1oP+WXZxHu5q/Rqd9s+Lh9w7LRtf6NXfvUmXwhqvQclAclAda6/YFya8ixe9DN+7ndGSvCpbp6Ituo9rwdkKIVikE4xmyJ6IBVVW1f3TkIX7vtiUoI6Zw5OImSDRDMtCp6VUZtriFHhr5SD8qUh5asX5syBz1f3DYFS+jNuGCfZFTgzp0QALWxfOOahoNqWMK2PvknlJdS+Qzd18b7uOQnEvCe8oiJokQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIeSpGmbrYeXbAa9trVWq/y7OVwqeWle2SwMny2emy0=;
 b=cg1+iWXO5C274pXaHjGdQ9qW2p0+HFxmnEzhUu/efA6rSBl4WYO5B01f6ClwnivlAmclbUTTq1+Qfg2M5DJ0P7tXJib1dWHyv6LBEzyius5eB6EG+Q4E5jcEnvTtORStZJVHB8Z2wT1UTL2/gqVHcUD2b1D97s3kq/htirZua1QXCap4o/dZTNqdV5oGXdviV8gF3lLr9jqGS1UcVR2Jk/ejpPk6DJLY0xIebB1OLUWaS2+gLdrjL4ppZSUwYkuu8Dfs85t4qd/tod96gOi6TaT6HBlLsayTOK+D1xACZgjpf0Nk+lr5lzEdpJJGT+2wwkHhWycqWe70wZ5SWcELXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 04:49:40 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 04:49:40 +0000
Date: Mon, 26 Jan 2026 23:49:38 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
Message-ID: <aXhD4sI6MHdAvgNT@yury>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0643.namprd03.prod.outlook.com
 (2603:10b6:408:13b::18) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f76f765-2a7a-42d9-6c19-08de5d5f7ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1+X7gf54OaLuCVQxvuetbYzOzztk41/CGeTzpi0z1fjNDpbgoaidFIVMmk8k?=
 =?us-ascii?Q?5x/TAqYYSA/mExvnYcJw3gBtnz8teCkQUjG67vnlU4rxicfy/SHFtGEQrllM?=
 =?us-ascii?Q?Y2oO5WPEDXOppGzjKZsRc/qVhWaMyGjwqPprWNKCe9ADtNGsa14sHbEaJQKh?=
 =?us-ascii?Q?iHqH3RQsaZR+97dXIaL6SastbSTpwys0m7S55SAg+1XwnjPLwvwAWGqOti16?=
 =?us-ascii?Q?r2ETga6dveiDflYX51MB+t48swQSAb3AbzsliSRV187Q7cnTlg/J1HXDKnbH?=
 =?us-ascii?Q?dC9FYOsCFRwLEMs+wNUGmzacXc5kkTtsBEEab3AKfxuZhivmfas6SaFnegxo?=
 =?us-ascii?Q?8/Mk7xyK0tciersoD72sbSHx0vb2ObWXWsCobcPQ75aT9hZ7k3OB+NAjY0jn?=
 =?us-ascii?Q?V2zqJV3qM6iOWqqzJRUoEpl3fddhcWHR+w7yuJE+g4ozl/8ewzFCiTeKP3+9?=
 =?us-ascii?Q?gHX4JAVmmkSo39Cvkac01ObCgBQU6yY6lUmuheaW4/b1i1uJx5Ord7Yd5C2Z?=
 =?us-ascii?Q?uAUUb9nodXPB9cwz6OoXzyMKD1sYEPCNkK2xDOZE3/eVnqD19KPoDgGQaVej?=
 =?us-ascii?Q?OIggtjHhMB/H6EFDRZQejJ0nEID8Z5OnjKuUUTQrK6lLOvHYgIA4iKcAowDw?=
 =?us-ascii?Q?CIJ2ZQ3FAx8vH9RPyCZnwfbOhupemB0GMlIIMQ7bq1ctCZ5XNHBLYiiBrfdS?=
 =?us-ascii?Q?FChP8oXLEGw28Vsre4Zsp/kefr13n/PFMujmiVQ+WwbcRoo7w1JLwtq/K3ZT?=
 =?us-ascii?Q?h3rKQfP/D2jDtapb624eFrU1ioc7miVYxJgx6rx5Th4TrPfi4OmADCZvpmAs?=
 =?us-ascii?Q?r7vzXrl0i0NFShsGfFn1/2d4vGqeOMCuoIi4Q6d20AEw6PhLXKnXa9hT4RH9?=
 =?us-ascii?Q?HSXDo703ArHrlWFcYAPm4YrUuo8TaNTbd2A6szjwrPn7iSsUduexW3SPRBuR?=
 =?us-ascii?Q?Kl7CLyPxjVAE3wpovNiVyUkPaI6UZE/ijQxrGQNQaKlkCs0S9rWX8JmGw6ou?=
 =?us-ascii?Q?Pf9xgXy38LzmKPzKQEq3nM45S6dzx0tKoD9RpYqOFOl6UhFTv4qGRJzsjcKA?=
 =?us-ascii?Q?HPkwju551MvzxtvML1Mk+Ms52QAasoE7/IJHwvWLMjSPEVtUiVvfE0/WAqpH?=
 =?us-ascii?Q?IsadfB7gl5WqU3JUXQQv68PbuUE/tLl6PCnjZCTUrZWsdxXZbTR1lrFP1Fyg?=
 =?us-ascii?Q?LgCxtFDuYMm6vHGuupIUS8SyHswhGE8LbNgQbOCtLNfxGrhbS1tN2HOXldre?=
 =?us-ascii?Q?tdu5A77ATsglMhLBBAXh7kGVRiU7X+79bDxP5suoLpaF19zOMexWha7uMqZ4?=
 =?us-ascii?Q?2xBrsuJeK1FSPyLXqds4/4DbTNwu2HFyKZDsMQM/dgiCxrjmeeEwN8ePoBUa?=
 =?us-ascii?Q?dyZPaRFQyAJGtjBpFZA2KuaTBSkJfyq+8jouAcpr/ktq1Ly74E1rBFMrc30x?=
 =?us-ascii?Q?I3xpBa4Uz6wWPFLeTSBIjve96Dj0iTV+UeL5vXtRzwXutNdLL6oluGzlUXOK?=
 =?us-ascii?Q?CC8GbtsrMXZwEagb2+gQs04E6jgKduNvF8UXsIoCNtXqxugHKfa6ygDllVav?=
 =?us-ascii?Q?1qdMaRwGLU/fg97bxX4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zCLcq5LJg7XNSIcxq+aNBkIBzip09jn5rY1W2zH01O4pBD0Pk/MHxX6YgIcN?=
 =?us-ascii?Q?PQv/Pdgo39PWQ8Ps7v9tFfoC2XU6Zn2GWkWIBinIEyg613lsQUf7y9AfAji9?=
 =?us-ascii?Q?S709wN/+DD4LNx8F81wSgl1OXn9UMdJrtf/yk7Gbi6+Q/xjyjOUNnFVoeDXM?=
 =?us-ascii?Q?o8u8UmIJPFiPWZaC1Rt/XJ9JYAu1MjbFVXUa+vesOq0LE/NMFfpcV6K1MJwv?=
 =?us-ascii?Q?JRArwX6QzZanwiaktpeyh1U0D8SWkWQywanLXATllTQv5cu8r3X1GeZWXDvC?=
 =?us-ascii?Q?qpm8WS3U7vWJLXje5ULUIx/OL2a2XdXogWuuI7EOzKg/VZOGT+UMH2Q1JXLW?=
 =?us-ascii?Q?t97G4guXQgPiNymq2M24fK0/11er+tVtGkJUXiaA7RUkp8oqMZibdiyRESAU?=
 =?us-ascii?Q?3q7c0wVLG8J7zhBVScAXlXRIqXMZ75pkZtOVM0E3TgtLQo6gJ4bk354ZbDZp?=
 =?us-ascii?Q?2eqphci7h6ba5vS/+L9YceUWkpgTi52qPmuJH5+xZ7yC+LyBvBXiCzFJXswa?=
 =?us-ascii?Q?a2+uZqaMyx/itySf7vIj8lN6jkQgigdHdM22zbBLJaWpRSiZMx3EbRulTGBH?=
 =?us-ascii?Q?PVgmxgxrsbmEHEF+w4+FTRusjyvh0jtekbeWBURqVBufUedz5TCSg4ATvhzN?=
 =?us-ascii?Q?8/LX8Yfb7bJI14m97bvRkA7u9dsYy+darzc05wgwJKaFstI5nbJ1JdgnBKeQ?=
 =?us-ascii?Q?jqw0wCwl1/wKbY0BJrHvPHDd8Q/zRzt2w1G13pC/Le2QgklrfN9823eHXpmp?=
 =?us-ascii?Q?wVa+/tD3Cy4zq0x9xEio4P8P8+UMQQDjHIJlzLSp5KI7zw8MgFmSD68+0MTU?=
 =?us-ascii?Q?0le+t0BO22wcMb0fl2H89rhgNEDovA8N1Pfs2U7PLGtaCC+HfxoZjjp0fs7e?=
 =?us-ascii?Q?Xcj1y3MAGNHrp2Ltj8URehl0qFxm3gi5avu0dm1K9zeKV8YnvT11qu9+0orT?=
 =?us-ascii?Q?SxG5cf+H3lxcPCf6I8FlaPfHv+fSoeT+I+vrrks9hG294HLTQmw4t0oJC9pi?=
 =?us-ascii?Q?cteAqLj6xlPr6rbcqZTWA3XXfEeeZ5Fj+WLL5rZ7uDJMsovhTilcpP5Y3yrZ?=
 =?us-ascii?Q?tT2DoSeibvidLr1aygG14pCvpf/yU2pUmWVEoH08Luc7y0IIyUK2cVnZKFNe?=
 =?us-ascii?Q?bwuxGFrDp22Xmvjpu0SPZqn0mXUcIOi9jYXs2qGyuo0Cwi0fGOZO0p9HZRC6?=
 =?us-ascii?Q?EtCVMv15uHeDVgxwrpucbWwwM0yXyvu64+oy0rpo88OXy9Go8+s0Y7jwrZR9?=
 =?us-ascii?Q?/Xp8k8L39gRfGiuLe4Qgjc/RU6Owa+dr531jtcZopmLflmuTR7t/wMfb5hLV?=
 =?us-ascii?Q?LL7/nn39zCpIXJTMCYmg38eiFAeYFhCxkm3i47gZmx1vzDMy1A7zbZSLxh/+?=
 =?us-ascii?Q?WT/y6MOg9XqY/K0VT5Q5glEW/apsFNCdmTMhbb7qn2hPejgOd646aYaZHhpy?=
 =?us-ascii?Q?TIXT/GWx2z/uxO1JnGp6a1w3qZ/bFpUCs0crP2Kf8pbMCsjTy5gkFra6OdiZ?=
 =?us-ascii?Q?g3wwYe3GuUZTrzqI91lR03/BfEPon4b39OWPcYK+V/7ChAE+kZwVuMg0BpJl?=
 =?us-ascii?Q?aN1OjTGeCfrLQGlQdfjbWXXiGhj9Pw1ydwAi2P5Ldr+u7pEy1QkivnNPB3st?=
 =?us-ascii?Q?C0ggGIUSkIVhHEJxvcZlhSpfkz7gRu8Ym7zerrELYmwZILJ/OeKgBniVKS/p?=
 =?us-ascii?Q?T60CYD2aHxJ9UBqvnD1q3QPWqDfgSUj7QoEK1ieBULCxOSwdES7MDZM0ksEg?=
 =?us-ascii?Q?G2CujGMi6eK024HNnEYWYMhLrYKYObXKPmXkY46j0mcOuzYO9E8u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f76f765-2a7a-42d9-6c19-08de5d5f7ae9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 04:49:40.0674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjJ+WZUaQXIz/LF13AicWGzQbqWWxGjg3IIsVOHfB7M5UZqQ4ywBkpKoxFyvl8mBjzF2GuWMM+3jWiy3MiDQqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715

On Mon, Jan 26, 2026 at 10:25:54PM -0500, Joel Fernandes wrote:
> On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
> > On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
> > > On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
> > > > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
> > > > > Add a macro for defining bitfield structs with bounds-checked accessors.
> > > > >
> > > > > Each field is represented as a `Bounded` of the appropriate bit width,
> > > > > ensuring field values are never silently truncated.
> > > > >
> > > > > Fields can optionally be converted to/from custom types, either fallibly
> > > > > or infallibly.
> > > > >
> > > > > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > > > > ---
> > > > > rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > rust/kernel/lib.rs      |   1 +
> > > > > 2 files changed, 504 insertions(+)
> [...]
> > > > > +/// // Setters can be chained. Bounded::new::<N>() does compile-time bounds checking.
> > > > > +/// let color = Rgb::default()
> > > > > +///     .set_red(Bounded::<u16, _>::new::<0x10>())
> > > > > +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
> > > > > +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
> > > >
> > > > Is there a way to just say:
> > > >
> > > >    let color = Rgb::default().
> > > >            .set_red(0x10)
> > > >            .set_green(0x1f)
> > > >            .set_blue(0x18)
> > > >
> > > > I think it should be the default style. Later in the patch you say:
> > > >
> > > >    Each field is internally represented as a [`Bounded`]
> > > >
> > > > So, let's keep implementation decoupled from an interface?
> > >
> > > That is unfortunately not feasible, but the syntax above should seldomly
> > > be used outside of examples.
> >
> > The above short syntax is definitely more desired over that wordy and
> > non-trivial version that exposes implementation internals.
> >
> > A regular user doesn't care of the exact mechanism that protects the
> > bitfields. He wants to just assign numbers to the fields, and let
> > your machinery to take care of the integrity.
> >
> > Can you please explain in details why that's not feasible, please
> > do it in commit message. If it's an implementation constraint,
> > please consider to re-implement.
> 
> If the issue is the excessive turbofish syntax, how about a macro? For
> example:
> 
>     let color = Rgb::default()
>         .set_red(bounded!(u16, 0x10))
>         .set_green(bounded!(u16, 0x1f))
>         .set_blue(bounded!(u16, 0x18));
>
> This hides the turbofish and Bounded internals while still providing
> compile-time bounds checking.

No it does not. I clearly see this 'bounded' in your version. Can you
completely hide it inside the setter? 
 
> [...]
> > > > What Rgb::BLUE_SHIFT would mean in this case? Maybe Rgb::SHIFT(blue)?
> > >
> > > You wouldn't even have the luxury to yse `BLUE_SHIFT` here because where
> > > would be conflicting definitions and thus a build error.
> [...]
> > > > What color.set_blue() and color.into() would mean? Even if they work,
> > > > I think, to stay on safe side there should be a more conventional set
> > > > of accessors: color.get(into), color.set(set_blue, 0xff) and son on.
> > >
> > > This would just not build.
> >
> > I know it wouldn't. I am just trying to understand corner cases that may
> > (and would!) frustrate people for decades.
> >
> > I understand that this implementation works just great for the registers,
> > but my role is to make sure that it would work equally well for everyone.
> > Now, for example, Rust, contrary to C in Linux, actively uses camel case.
> > So, the blue vs Blue vs BLUE restriction is a very valid concern. The
> > same for reserved words like 'into'. As long as the API matures, the
> > number of such special words would only grow. The .shr() and .shl() that
> > you add in this series are the quite good examples.
> >
> > Let's make a step back and just list all limitations that come with this
> > implementation.
> 
> Why is a build error not sufficient to alert the user to use better judgement
> for naming?

There should be no error at all - that's why. Any name that one can
use for a regular variable should be acceptable as a field name.

> This is no different than using reserved keywords in C. For example, this
> won't compile:
> 
>     int if = 5;      // error: 'if' is a reserved keyword
>     int return = 3;  // error: 'return' is a reserved keyword

'Into', 'as_raw', 'shr' and 'shl' *are not* the reserved words in Rust.
Rust makes difference between upper and lower cases and doesn't break
build if you do:

        let blue = 1;
        let BLUE = 2;

So the bitfields should.

> The user simply learns not to use reserved words, and the compiler enforces
> this clearly. The same applies here.

Most likely he will learn not to use this API at all. The worst thing about
those 'reserved' words is that the set of them is not definite and will
constantly grow.

I'm trying to say that this approach is not scalable. If a random client
gives name 'invert' to one of his fields, and you'll need to implement a
method inverting bits, what are you going to do?

> > Again, this all is relevant for a basic generic data structure. If we
> > consider it a supporting layer for the registers, everything is totally
> > fine. In that case, we should just give it a more specific name, and
> > probably place in an different directory, closer to IO APIs.
> 
> The Bitfield macro is very much required for non-register use cases too.

Then let's implement it better. Can you comment why the suggested API
doesn't work for you?

        color.set(blue, 10);
        color.get(blue);

I think it should solve the problem with name clashing.

Can you share more about the other potential users?

Thanks,
Yury
