Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013042.outbound.protection.outlook.com [40.107.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3684C21255A;
	Tue, 27 Jan 2026 03:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769484361; cv=fail; b=XzLZep91ToNEZuOy/LtB6TgWWKuKvNJw/VfZatW0FTvo563VK6rRKuJ2kha9WYRQdbqD11JQkjCKKXqdjW5jyp3LkphP+2MqK3HatF/Ug9J6OU9FUS1ZB/bLanuikF+Cu1AROBSYphdTUXLoMPt0pjhqRjNxTR048ASZoQHgwgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769484361; c=relaxed/simple;
	bh=VXBj2OPqm7J+6HNN5TMzChP4TPyLXE7ftsEJYgpncyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pTg23jbBps5i7CM5DVPelPsqe/e/+Q/vEzR/yFLWVeDdyklNDDkrPKcN1m9qPdQ9+O0zqQ6F9GmZ33pehPEd53NNO7y2BI8x/X7to4MctSMMwgcRCV7W0v38kM26bZzAdJ6bSXIeVgUlxfqj0gQGV2Z/47+sWJCwfr0Bm2RukVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P3PrWr5j; arc=fail smtp.client-ip=40.107.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P3PrWr5j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBeKfzUkRnBh9Mw6lXYgBo53KpM7hlp6pJodzJo6lxqzKrwME1B47GhjzJKlETwFEKzzCxD7WKx4mp/2DSHmg35jDuNBtEWeUfYJG0TKiMLYm0c8Aw5fpazT1yqhsQYV8lvUPTQeBex2TtEgNfYkhqewuWMmp8cqeoFITDMQcpl5EXQSHEJ1hZs+5G++0Tc8z8t95+YtdW+UKsmnVgzEmlLEtE3bRgBYo9JciOzzI6Dq/D6CRIb4qHjeCcZOfjHp16m2QcyEwU957jQU6u21DHhtJ4S7sLM2AvVOzpvtNX+Z9LpGDyuI7cEQTLcn6XwRjGM9W3YFUiJRAXeFKKzj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/plPPRdg9oW6vtWPFhyljSSa6Ez1YVZRIDIwNZNTxUM=;
 b=xuXEVIAbxQcEoYc/kp8HARUDTTlnKDP3zfdwXW509Y3uAim8a3NB6x25ng1ZtO1HrJDrs56K53xOlFu1r/jGJPgZxfn1cokQ1+gViYBQ7EtCn8Bf2Nu9HvGGcwU//LUW1V+fyUegQuVnPLvFFzECZX6sL/317P/1XikvvY0mc2LY9Q8lp0Mcrbjg7ZMSgDaJBs0pc5SIRkJfnXVDTxhSEYpfr2BdFNASOK69a6xxckZ9CWGWR1bxjJAeThPQXp87Y7KFmuagAaFOdCTkNA+eC1BfpRt3VIsr8Bi9CAXRQ9g1QXlgnK+r+yVwprfv8g8tqR80qWgvJhSQvpZD82fxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/plPPRdg9oW6vtWPFhyljSSa6Ez1YVZRIDIwNZNTxUM=;
 b=P3PrWr5jRytqZfC++nDs3R6iIIvwu0LI28igfbv9S/zopd2R0zPsFPzawNrIgIR6KZfizunDsGCGUj9iTaqhV/geT6qPcqtlORDjZCfiW9jUTEeFXQ15rFKJJMe/ZmdfEmJoCuwdxxUTGuWLNn2+AeqPXZ+CiYvsJtl6Sv+BVcLHVK9iBV6uX8i1QYMomFPEo+rWdxEbfTwpkIBcV1E4sVsAGiWxapxLWJGYa+1tkTiZtf6+mnBeqcggk+JqeREuILcWXkAIH6o7nxDolymJgvOP3FXZnp9VcWMDHJK96vkBuTqUvBZ4SzIP3fvw+LZYR86I/ddR7QfKFjHaqM5Q4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA3PR12MB8763.namprd12.prod.outlook.com (2603:10b6:806:312::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Tue, 27 Jan
 2026 03:25:57 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 03:25:57 +0000
Date: Mon, 26 Jan 2026 22:25:54 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Yury Norov <ynorov@nvidia.com>
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
Message-ID: <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
References: <aXgpKOHAmvZuMVSt@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXgpKOHAmvZuMVSt@yury>
X-ClientProxiedBy: MN2PR01CA0040.prod.exchangelabs.com (2603:10b6:208:23f::9)
 To DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA3PR12MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: a628e69a-4728-4a80-22b4-08de5d53c8d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMxE8slgA+jPUoLGeQx2xlNQj+8+KfU+PAOtbqGYS++iCGTUz8bOExR9iY+/?=
 =?us-ascii?Q?k2QvhywqnNosJDWYpjn5I1TSqBYHKIsMXnqihwANBwK1erapHpUY+KZgwqVq?=
 =?us-ascii?Q?0EovA7uK6uNidjbUF9lsfgPbfzuGzJ4LvqsOjH/72wsF1NOfFOvJg52psUpB?=
 =?us-ascii?Q?xixDtFyF3XFC95NdQ5IOKVCuorDkI+Ro0XJUkgMwNmd6GIAvsox4aLm72uGx?=
 =?us-ascii?Q?l/TLUG+MZwCSiuushfKv+lwSZErRvimHh3DiKPQYO8qollBtWruDQIhcp4Gm?=
 =?us-ascii?Q?UX9QGG+y67Ho/Uj4yEk7f19XFnrLJNvIEfnYxqTLrqBBLfjL2q0bG1Pui01d?=
 =?us-ascii?Q?RLtBfZ3WgX3nRulq9I0OchugrMfLiRBx6x2dGYTgYN8iadm+BRsNVpophZVC?=
 =?us-ascii?Q?Y/cgpYRTbMCFTNZnGhcqSxpVqeVVuISguNWeF9sIM3YcJ+5y+tRiytIYZQc+?=
 =?us-ascii?Q?eWL+gS2JGZ75Xt2OSPqMTg3gdYXd2m+luUNMLswKzHrnO0GLj3EOVX/l8Msk?=
 =?us-ascii?Q?90woaL+/a+lUc0X7sxtyr1aLF3lfPaPL8QuBknko6thFF+1oSrir2AJH65fL?=
 =?us-ascii?Q?O0LLJKDYKFAfY7VnsXcpAagh0SHtKqwDpH9oDV1GoLug0KtwW2VZ4n2TehFp?=
 =?us-ascii?Q?pY0xOP1JvZxReAIvpboxt3D4re6TLz0GzO+vEgQgzb4CvZuU4s7yTynJYjl3?=
 =?us-ascii?Q?PutbNWbgWxxSDZfbby5QYNE3f9tqJrkhbivX2+7T9u5zOo8amwEdlvzGKSre?=
 =?us-ascii?Q?nO7yll01pBXuGo2mb2ugZzOzZ680BqQaJWQlSDsFLJw1l0mTtYcCATYQX4R4?=
 =?us-ascii?Q?uALqlUPiTwdHqUM8KMW1kcKawjl5LqqUbnxoSFyW2WIW/CPXx8z9Sn2Sw8PL?=
 =?us-ascii?Q?ydrTxb+fM6IzPfq1holvinXAtcfTdrYkniPktZpjvexHUxURuJIEWisDnZc6?=
 =?us-ascii?Q?8+z9Bw+fAMTn5TuQgP7hDH/0ikuChPXOfk9FDlJ3VQVLufUe89OctESv0frl?=
 =?us-ascii?Q?QpKp/FcuLced1DWfDvXQ7UxVA0HEnrCI2+xogx+WxJaFV/l6FrHNRrYF6MrE?=
 =?us-ascii?Q?WxuS8wEVMN592enAskWxyV4QNRINZ9debR5j6XrVIT033apzvNFBhKCOZigZ?=
 =?us-ascii?Q?5haFjGSjs/56TdeRA/D3yilPiwwe69UUJHAqvFBh1A6dTkrTwb1RZvcUyrnc?=
 =?us-ascii?Q?FZuGcj/U4qtaPlgvE26LrZ7eya5kixFzN87RI2JE65EXz+kbauNVDu+AZ1HP?=
 =?us-ascii?Q?lrpyYYw9Q8/a5Jrd52CzZkOILg+g48JGPQsIjurC0RNW6vPBUIyd8QLGLY2O?=
 =?us-ascii?Q?33sELY/WJ8fOIHi2ztCEm5K3friUL6T6xXd5SchKffFb5WNzSzoS+bmC94wY?=
 =?us-ascii?Q?ygKMfSv7ftnydet4VGo2suGaoBTwwV4KnlJu+gN+TlhbWmbc63d0zo1RVnsk?=
 =?us-ascii?Q?aTOQWrgUg1nU69txKdmIKPMT6orqHIVCZwelrQbFFxZSO+luToGEiJoEvghz?=
 =?us-ascii?Q?251R/K4yzt13pthC7zmoMA5SmlqR/AGVvwS//Ibn1jH3dEDj9bSWRV08mpS6?=
 =?us-ascii?Q?S3Rgkt8xb1Ei1n8ybiw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IrtsQ9sKhbUTfm6tOalTxCJ/3fEQX+uNg664IA8uFO1RHYkxIzvzR4XWEJdZ?=
 =?us-ascii?Q?WZreq8roksK8uHK9HH14n5pB14HmTbwOTM+J4/heIXuCv3HXLASXSjkteFeO?=
 =?us-ascii?Q?DeFNoatiUG/GWA6dk+OdPuaryLY2BHPH8fyPPIPH+W52dCXdxpFgxXGKOv41?=
 =?us-ascii?Q?JXpiwq6YDuiwUHjvUiTJ516chYFc8SCcexsz/bNEhC1S2Gwzc5WJum9AvA0Y?=
 =?us-ascii?Q?VXIPNltT69KQBwb5ghtXeGo15yYcAOZCMIMzvNOnfl744lkjq0bdVhCma7iq?=
 =?us-ascii?Q?CZ1YMI6mGO0nJuSx+o8BdMokDvncDSk1AxnnfLAEvnJlrJZg7hz6idP3xCL9?=
 =?us-ascii?Q?FO+ECvjfh3K7AFqDJPCMj4iq+AG3ZtvdaJaI0fBg/rQzdt8uEzp+ROnqRZoR?=
 =?us-ascii?Q?LZUao6oDaVZ2MqHaOXLmifvzFrRoYMv/1dYsx98v1tuaLzaznSOFyfqGNDDy?=
 =?us-ascii?Q?u0qJMnjl5BNyZcZUGJtDe2V0V6uNW3ucuUgiN0n83v2LAvMCw1CX8jpE3Bqy?=
 =?us-ascii?Q?on0uQ5WeQ5ZY9SuvB71R33p9AGXFP5ONaZ7Djsf3pvb7aoX4jTznSF8uiO1C?=
 =?us-ascii?Q?7w7B4/SOJi8AZiLH5S3+osjKQEaC15WvdZWri2gBhAI7SUz6DK0HCKZqJN4L?=
 =?us-ascii?Q?LKnKeJYm5vKSwk54Lpfy8wcQ06+WlBYpP4FfM0hS/36sC/YvwgH3V2BcZSv3?=
 =?us-ascii?Q?BgMQkJHpcfCA0tPL19lBQ7LjC1NIPa8iit9/ea3T/34Z0psvo9ZkaBIV6/u/?=
 =?us-ascii?Q?UFdaIFd4zcCgggmpntvGLHpvxdv080Khs3Ibs7B1/Ii+jlXIS94g78bFLY8l?=
 =?us-ascii?Q?bvzQon7+oGO4Dx9hnT76eUYEUSuoMZ+JN2Q7pyKGlrjTihBbNKcyuTBoGuBH?=
 =?us-ascii?Q?kTrDZ4ncVp7TDX81cEjKozc3uKY56K1b06zRD5nwzIUQF5wYvHtfGkJaQQ+s?=
 =?us-ascii?Q?Zj2HYTBClN1Nz6iR2lFuVsZbaBnZ67GJbyG5OLi129+nk0mseeZHnwSrDPag?=
 =?us-ascii?Q?gfL/LDbwzf+8r2ojbUdy3V0QD4Isy38vx8Re/s+ex1zguARm5BkNvP2ADMxv?=
 =?us-ascii?Q?b06d6ntU9938yoAJNUTB4hFc7gCkXlkly1u0m8vNt6ADvxZtoHq9qLaxFhZF?=
 =?us-ascii?Q?WE8YkZIXS+ApIp87juMTFaYDFc8AxN2CCKS+9AgU0kz8GPshIWQ+15BjxUm/?=
 =?us-ascii?Q?oSWM2qPnTRL1YwJpqRghiGSf08H3i8iIYATggSc6FHut2v4L26aJ/0ZjeJIu?=
 =?us-ascii?Q?+qW6HcFxpYIcSp/sOZqDwAqnblaef9sGJEU4SesIQZAr0mdIi1W7j93iynWV?=
 =?us-ascii?Q?UmH7jp3amA7geh6CBrhSXFOik0sYX7NXkkAXoeoQz0Zml16JaeELdT5GAVnF?=
 =?us-ascii?Q?u+fX6yJQlEqCN/d7DhLP4pAoPojR+y28OGD9fIcs0ba/sXffxhKS1k5rmRUf?=
 =?us-ascii?Q?NQzzMtPqFdOZMJjdZWcUUHPEH41FTCd8GYODsMozYMGV14KVOoXeohv1Tzl/?=
 =?us-ascii?Q?nipWazkVXyTSnJCGiFgFNv2eqgIoZ72B4NwfWZfQ7VEXYL/NkhYL7sAKmEmv?=
 =?us-ascii?Q?dE4jSPW5LDzf00PSuciuK6jBxbxpxGjhR7BX5ULPW42JWhObAJWo0+S7tZ6f?=
 =?us-ascii?Q?mxaDSoPCteONeEhbDh9rFqy3qJabolvKqcm08kQ7Aj+HEPaV5qNyJanKHXCQ?=
 =?us-ascii?Q?Fp9DQx8s/uLu0wRM2rzhqX6EjQW2Xz9jUcy38yX29+1QLNEdikbAVSdeYvtH?=
 =?us-ascii?Q?0qOvsaH6OA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a628e69a-4728-4a80-22b4-08de5d53c8d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 03:25:56.9440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCbAUKh5TP77UBcHxP5NglUE93vQttFDmR71OYvCPdcaxy3Kfo5oRsmDB5U2hEoTyyKKfEu/AEUVbj8zTh7Pjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8763

On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
> On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
> > On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
> > > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
> > > > Add a macro for defining bitfield structs with bounds-checked accessors.
> > > >
> > > > Each field is represented as a `Bounded` of the appropriate bit width,
> > > > ensuring field values are never silently truncated.
> > > >
> > > > Fields can optionally be converted to/from custom types, either fallibly
> > > > or infallibly.
> > > >
> > > > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > > > ---
> > > > rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++++++++++
> > > > rust/kernel/lib.rs      |   1 +
> > > > 2 files changed, 504 insertions(+)
[...]
> > > > +/// // Setters can be chained. Bounded::new::<N>() does compile-time bounds checking.
> > > > +/// let color = Rgb::default()
> > > > +///     .set_red(Bounded::<u16, _>::new::<0x10>())
> > > > +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
> > > > +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
> > >
> > > Is there a way to just say:
> > >
> > >    let color = Rgb::default().
> > >            .set_red(0x10)
> > >            .set_green(0x1f)
> > >            .set_blue(0x18)
> > >
> > > I think it should be the default style. Later in the patch you say:
> > >
> > >    Each field is internally represented as a [`Bounded`]
> > >
> > > So, let's keep implementation decoupled from an interface?
> >
> > That is unfortunately not feasible, but the syntax above should seldomly
> > be used outside of examples.
>
> The above short syntax is definitely more desired over that wordy and
> non-trivial version that exposes implementation internals.
>
> A regular user doesn't care of the exact mechanism that protects the
> bitfields. He wants to just assign numbers to the fields, and let
> your machinery to take care of the integrity.
>
> Can you please explain in details why that's not feasible, please
> do it in commit message. If it's an implementation constraint,
> please consider to re-implement.

If the issue is the excessive turbofish syntax, how about a macro? For
example:

    let color = Rgb::default()
        .set_red(bounded!(u16, 0x10))
        .set_green(bounded!(u16, 0x1f))
        .set_blue(bounded!(u16, 0x18));

This hides the turbofish and Bounded internals while still providing
compile-time bounds checking.

[...]
> > > What Rgb::BLUE_SHIFT would mean in this case? Maybe Rgb::SHIFT(blue)?
> >
> > You wouldn't even have the luxury to yse `BLUE_SHIFT` here because where
> > would be conflicting definitions and thus a build error.
[...]
> > > What color.set_blue() and color.into() would mean? Even if they work,
> > > I think, to stay on safe side there should be a more conventional set
> > > of accessors: color.get(into), color.set(set_blue, 0xff) and son on.
> >
> > This would just not build.
>
> I know it wouldn't. I am just trying to understand corner cases that may
> (and would!) frustrate people for decades.
>
> I understand that this implementation works just great for the registers,
> but my role is to make sure that it would work equally well for everyone.
> Now, for example, Rust, contrary to C in Linux, actively uses camel case.
> So, the blue vs Blue vs BLUE restriction is a very valid concern. The
> same for reserved words like 'into'. As long as the API matures, the
> number of such special words would only grow. The .shr() and .shl() that
> you add in this series are the quite good examples.
>
> Let's make a step back and just list all limitations that come with this
> implementation.

Why is a build error not sufficient to alert the user to use better judgement
for naming?

This is no different than using reserved keywords in C. For example, this
won't compile:

    int if = 5;      // error: 'if' is a reserved keyword
    int return = 3;  // error: 'return' is a reserved keyword

The user simply learns not to use reserved words, and the compiler enforces
this clearly. The same applies here.

> Again, this all is relevant for a basic generic data structure. If we
> consider it a supporting layer for the registers, everything is totally
> fine. In that case, we should just give it a more specific name, and
> probably place in an different directory, closer to IO APIs.

The Bitfield macro is very much required for non-register use cases too.

--
Joel Fernandes

