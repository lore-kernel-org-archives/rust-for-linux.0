Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021124.outbound.protection.outlook.com [52.101.95.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A16248F47;
	Thu,  8 Jan 2026 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885855; cv=fail; b=AFb1RaQLbEMUFrfV1Rf1Vf2go1hznCdhFxHiCuH3a81U8uWgrBxtO4mS1c5f1jRBjRG6qcHejiBAakyGc1kKq822KnoW4g2Csv6ozuArRyhXef1zo5MhUW5fJQa9u9BfZznVUwkWLgkpLyUeuk+knQjnR4B2Clx460SBSGCzGlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885855; c=relaxed/simple;
	bh=pLRTRJ9mdrT6XDBPaKmcMFSrohq+H0xiDqMiLKdd/0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=me/597tGzl8Q+pmGCIrD3Ba3QApj+qJj+aghYv5itH3zHcbyJI3gXuOPld0qPAfDsdbHZnecfiqRz/aEkVy6Q1Y8k+nuVnbpBYnQKToEXNWJrt/DGEDpiraWRKYtDcu6HOwFeeMTgui2R+eUBUodTo8KSxexezDwxaDxWQRKcDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Sr3rdv3t; arc=fail smtp.client-ip=52.101.95.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Sr3rdv3t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1Zj44OCCJdvseHTk1KiA6CDaOK481WvsDQyaPH3QWu4Bw0gWAPsNdPJR1cILnFg9ZHYSYlmic+R/tH/BGkycjhIl2moBNyZIxTSCBSzs+zOqJ0LFDolvoR3k/837g5G4+kvde0hmKttZ6G2TC5/+D54Rbt06qKUc6D/AkF+1/fYwK1Twxf58U1yrDrRkiZ44OKNra7c6OPVQ68Yg3j/02PfTqZSKANj3jMr97QmNWEGfEy7kJRMOqyDAPYEkFfn5cgbyFHqUnWzaoWu1i2UsL+ttNF5SzcIP5zcnUJTRkmprD4OznH/HiHVp1JwHl1INx8dwQR/0B6VrP4ALJ3msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koPGzBNcM6OBV2kCo7kQnp1K0hjRr/g/NCB7becc/Xc=;
 b=mCW1GlvVcjs5RB6JTgOh3pdgwKdaf95mkE47sv6TReeAvYIWQFg44DIil6dmNUeh2CC5r7GEUEbrERgFTn5dbZvmG4r3KF8uQwZ92WFVEFiJKc5fQyiPcbbsCUvf7sZB7IWndX6Y9285AV73hOp0hb1lwWJpHWSA61ocX2YqyAV4rbK9EY0vVRnLLyPKwO7MSk/GCW7mnIqPwwfirXEb+fxlLcu3evbrJ6LC0VRFAWXUg8dZ0YjfnoL/T/1xjR6jx5RBfQap3juvq4uTyPTi1z1c11ZoEw3LqO/jXbbnkSQ7KdyzmvoSxWtfKadkiQmr7kvDFrHvTrukurMsWT8hDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koPGzBNcM6OBV2kCo7kQnp1K0hjRr/g/NCB7becc/Xc=;
 b=Sr3rdv3tXkrErfIPehTJXONdpxaw+nUt90RG7OqAbs7DWwbZnyVl6iJrTvsLjgoTn+zGpyIklK1m8BLF1rhNpD3gNwOOizbVHom6iwGOsTNthwXoQjiE1BH/NslxSPjG9kCaxfmDv9Q3pq5urJEb3P/yKEzp7hWm/Zv9PRwyWt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB5950.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 15:24:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 15:24:10 +0000
Date: Thu, 8 Jan 2026 15:24:08 +0000
From: Gary Guo <gary@garyguo.net>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Igor Korotin <igor.korotin.linux@gmail.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/11] rust: macros: convert `#[vtable]` macro to use
 `syn`
Message-ID: <20260108152408.2aeb10f7.gary@garyguo.net>
In-Reply-To: <CAJ-ks9=N+1YU6jBn6KcGWXHhggimuWRKDb9rM=0TwtST6s8dUA@mail.gmail.com>
References: <20260107161729.3855851-1-gary@kernel.org>
	<20260107161729.3855851-4-gary@kernel.org>
	<CAJ-ks9nbPTQojM-QcHPKv+NdUHwaRbBRVqzJ3CwgQTJTuD=bRQ@mail.gmail.com>
	<20260108124137.22c32313.gary@garyguo.net>
	<CAJ-ks9=N+1YU6jBn6KcGWXHhggimuWRKDb9rM=0TwtST6s8dUA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0358.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1f68d9-9e1f-46e5-185a-08de4ec9f8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j5CLeCMjRQSRoKgiozCjwfSE6kEFuKkeLto/qu1JaniHc+AAPxKvMZa/4z3d?=
 =?us-ascii?Q?D9cbLc1gi1zt5ug1ToOmY+lUIV6dJOKDwy/yNu7XbHOMsKDbTBQHSdNwRLRo?=
 =?us-ascii?Q?CH9WKrFTW1ybXmXaiQMCK5GfM6J64AbAIiNXyRXbWbnHeuhDfH56NbAlClsW?=
 =?us-ascii?Q?jGt4dS1a2QZH+QnpH7gHycaeN59eiBAildgCBCxWso9UkHAITZKt3BL1y1Hg?=
 =?us-ascii?Q?9uu4HKiHJGOazbsag0HjYIECfYTqZ0ONXOVWCZgFKy27n2QWfqRLTjqnoUga?=
 =?us-ascii?Q?vAq9zXyNqBvRR+J7yxyoVCZ6YkbVrzsNBG5/alBqJyUvaR49OFHcG3IQhLKV?=
 =?us-ascii?Q?GdW4/IPOTJ9bKDoqSLmCkPdDPOHPIJqYk3VgsSmdKHjtVjBraHvBa3zqXahU?=
 =?us-ascii?Q?YHWLqCF+KLuXdTMFX+LexFfhZfZ92kW8sy8F4+uoDHDemZUIx6nEPixBf4eH?=
 =?us-ascii?Q?3LRjUjZUSKJN36Cq6gT8SZXoLwVSfInActAlfEBqvDoBoSWm2Rxe60FJtTdn?=
 =?us-ascii?Q?7/zZ5b5SNs9KcpVtvx5UwK7LYTir372pyuQ5OAN7xR5iQslT6BSrowZbHIIL?=
 =?us-ascii?Q?l1cN54JqpBWbCEegXS4l6nzDlIQ4sJ/qmY+7PxFDtMPe/pwJAivu8U5JYlyj?=
 =?us-ascii?Q?CMf7VA8s97aV9RQKCdogpeQSciPfRjJsmIUOb7aFy6Ihs1mCNuk0fJm6pGj6?=
 =?us-ascii?Q?qbyUAGPSKCZV3Fdn2ylUdODqw8ZiQFRHF8o6ViZZsqAiTcKxssNq7SSr7w+s?=
 =?us-ascii?Q?dM9QzmLaVoQM14MvJR3hXwwC1SShVLAdNuu321WoTsVygsHO3XNN6etbh5c+?=
 =?us-ascii?Q?l50GK7eR/WBW4CqthvqUSnPF7SJa5O6/LGwuLzephpXrtmvdHvsXYXALpACv?=
 =?us-ascii?Q?CLyM9BsKtmrzqlgHowDnw3CDHqDucq73LSIBnIaxXyOtuKndi3HO2PWt7k3N?=
 =?us-ascii?Q?ga2tGzhc1j1w9Jaqbc6NZ/X2bhFb9gSjfLgtOaITf2co9rz0rp1jlhvG+A3V?=
 =?us-ascii?Q?+7M4Fwb0vqWickSRE1gOKJl2VQKZuN8gLu0AIN66wYHHZAnM6arvvcq3Mn7B?=
 =?us-ascii?Q?7KKG3KLPVI5X94XIrTy6h8Js0h3+rxVXQm+Mh3apWI9zu585BxcHWnGmn1Yo?=
 =?us-ascii?Q?CYxecZuqlna1Q+sLtd9LaUwIBuuKyNKjh+R9BILYBCJn+b4J3AGE2gXCCjBp?=
 =?us-ascii?Q?nhDvI+jLwU33BmtD59IXt2TIQHln0HFOFvDUGdrjCf7PpUO6U+SAkCNk2DS8?=
 =?us-ascii?Q?9F8YNP2Kec6zZqo8AmMIHbmr/XsuVRbBL666IEgvV27nG7ggHPIM09HAuYI9?=
 =?us-ascii?Q?RbatVskT2jbxBznnKAq65n5yNyi+q48oW66Vsu+xUB1AtDJUamk7XAOJBLlj?=
 =?us-ascii?Q?Qh5UN0n1TvACL0t/RbtnUz4LxwoIo799vgSKUKDNC0z9ZpZNNds2k9SbgXZR?=
 =?us-ascii?Q?i5fdneOkJmmdJ6OVHEOJhkmYBFSB7qcV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7TPTa8dzi4zhkgLEChxsYBvddKu97i0Vy1kThCzbSwDiDNkCNXeF6rID8i0N?=
 =?us-ascii?Q?pCE5vGO1IrMoXiD7UxG7bdXfjtpOYky/tEzSAzP3G64qfchp+WK3WfNNfOQH?=
 =?us-ascii?Q?3Vj/oTP9hZgLCku0DE55r5XgNb9+rvPN/fb7wrYKV1NdF3+ZTiPwnhtGbfCA?=
 =?us-ascii?Q?btdGUClTmG+v2FySbUwX1wnRM47JGiJ8SNIL8xw7Js5D485yqaCI6dGVqm4w?=
 =?us-ascii?Q?exk+TwKCtcpUqpdanxfo5dTe37zfetmXwhyQ2b4aKQ7ZNaWNvilDH36FA4sw?=
 =?us-ascii?Q?pnfvZPDnaL2nJE3vkKSI9DelEJSjETqESk0q2pJQIrv4+yD8oewRgrJukjvl?=
 =?us-ascii?Q?/FrWS1g6FFIHR418eK6Zb6NhjbIyylqiedHwpv+eCTFGWq0xeXxv2mLhxuMt?=
 =?us-ascii?Q?ZzG/Ub+wkMy8/ZLW7Gv33piHmDysD0afILNL5ixGhwRsit1Pz1AS4kU4J85z?=
 =?us-ascii?Q?lGttpK49mLne6fioqv4D+4TimBLaNpl40i3kCvAk0lo/nSFg1P47dLuglov7?=
 =?us-ascii?Q?ItloDmPJNfwVTSgdxM6XxS65wLogB7C2KvfH1dA8HSUPhzeLb3ejb9AZoo9t?=
 =?us-ascii?Q?FGwNr7erUKRMZ3SF3C8mbbvOOsHJweP2jhvowHKiJij79Ti9y3s0M1+/TUYR?=
 =?us-ascii?Q?+9kmw/XEFsReDvmDh3/nTsaQYuKy5FgPAbccujcHEfjvzz/bn6/3q6oBSTPm?=
 =?us-ascii?Q?t76UNDoSfIR820BHzf7EOmmx3Zto0huVXZ1e5eZDZ5LOhBnFoz3e5p3mUhEJ?=
 =?us-ascii?Q?OoUDA9etZ3Cc1TLhyaA3abVMmSDhVkXnWVRIc3tlFoM/Ou0oUUGuMI9+Cxtq?=
 =?us-ascii?Q?dF+COT9P4HKVC7duRcf7FZmi50Acyj+GmjEyQJf2+Qk3x04HUwWv0axZucUX?=
 =?us-ascii?Q?98kauIhb/qpI0G+l5lP6apAdhqKrVtAXtr2X/a1/k564uDvDKO0hBPkfWkLe?=
 =?us-ascii?Q?wiZ0XzhczR+btQGru5uHgNEZoxPrMmZZtwIzD4G9GjQWX6SNPEJXO0Ld6duD?=
 =?us-ascii?Q?nAcFRjTg2Wb8apeHHAyTW1XgcV4Idd7ba5b7H1fxHfD+/cq8zndKh+MsThbu?=
 =?us-ascii?Q?+dS7gHJBffqmb0VEs79HeN+3YDu8dvmISBgLmjKhXxFz6Tct2SpnnKuKdDRe?=
 =?us-ascii?Q?UEC35DYhToNgMda1cnHAHvig2Z06Fdahii5Q82Cqjuy/KnuZYVtSrjumhjE1?=
 =?us-ascii?Q?l0x/ymBLhJtjTnS95Z+NGH2z0SRuainndtaWFSraktv7tZAvD8WpipXL3Wx5?=
 =?us-ascii?Q?QAOLFyon0qupD49/UhS+AmM680mN1stQE18ZLFSWuMI+axts/XrHNs7N9CXw?=
 =?us-ascii?Q?4r+uB/wRiUyMRj/xWqxIJVgK+/qSsgTgZOcN+JjmpznX6bAtFR3YKFj7Z6dX?=
 =?us-ascii?Q?kHDuvznie5ODVINzMnuGDVCDdLqVyhJbAQq76EILBmUqOTNczV7hQN28YQ0n?=
 =?us-ascii?Q?hPvsnceBCbqxs33UweRp11WZVpFzaEX/cjXWgiF3HIiFjCpY3jQzjdXEBgcr?=
 =?us-ascii?Q?rgYOJzZKHytc5ZvIeWdOuoRP4mBjYnAPax5kEddza4OVoe4+ClJefJD/9RMu?=
 =?us-ascii?Q?Iz3B/7cUfCnohyxbA9nvvz5ddWNE78mLEEguBxReF8xfrSuVn33DB4pzTeAD?=
 =?us-ascii?Q?oy7EmiJAmMuTYtVC3pXNKjLffoLbRewkTcT5U2Cr4mQaha5f5QOOFF0KbYy1?=
 =?us-ascii?Q?NY28blkuMyRmMlKveVs9E5yNGpAN2mSZpH1f+y4sbDiex2gEYKwZ+m8mTIQm?=
 =?us-ascii?Q?dwTltQcTcA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1f68d9-9e1f-46e5-185a-08de4ec9f8ae
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:24:10.2046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjHnTepolSYo87Y2m8tXl/fuA28W0d/czIj/Pdhkc4cVy6yv404enx49G9mI3Z/1GS4ww6pQ2RtY3EzNH3NW6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5950

On Thu, 8 Jan 2026 10:10:23 -0500
Tamir Duberstein <tamird@gmail.com> wrote:

> > > > +    let mut consts = HashSet::new();
> > > > +    for name in functions {
> > > > +        let gen_const_name = Ident::new(
> > > > +            &format!("HAS_{}", name.to_string().to_uppercase()),
> > > > +            name.span(),
> > > > +        );
> > > > +        // Skip if it's declared already -- this can happen if `#[cfg]` is used to selectively
> > > > +        // define functions.
> > > > +        // FIXME: `#[cfg]` should be copied and propagated to the generated consts.
> > > > +        if consts.contains(&gen_const_name) {
> > > > +            continue;
> > > > +        }
> > > > +        // We don't know on the implementation-site whether a method is required or provided
> > > > +        // so we have to generate a const for all methods.
> > > > +        let comment = format!("Indicates if the `{name}` method is overridden by the implementor.");  
> > >
> > > We're already quasi-quoting below, does putting the comment there work?  
> >
> > The comment has `{name}` interpolation and you cannot just use `quote!`
> > for it.
> >
> > You could do
> >
> >         #[doc = concat!("...", stringify!(...), "...")]
> >
> > But I think it's cleaner to just use `format!`.  
> 
> Ack, though I think it would be:
> 
> #[doc = concat!("Indicates if the `", #name, "` method is overridden
> by the implementor.")]
> 
> i.e. no need for `stringify`.

Note `name` here is an `Ident`, which gets turned into an identifer, not a
string, so if `concat!` is used stringify is still necessary.

Anyway, I'm going to keep `format!` in the new version.

Best,
Gary
