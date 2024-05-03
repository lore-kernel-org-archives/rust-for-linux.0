Received: from CWXP265CU007.outbound.protection.outlook.com (mail-ukwestazon11020002.outbound.protection.outlook.com [52.101.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD5C34CE5
	for <rust-for-linux@vger.kernel.org>; Fri,  3 May 2024 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714750042; cv=fail; b=NTSsp4nMuqKzeit+GZlHqLpA7TvzOAAE+r58YH2gb6oxGKywpf3nldTOwSurYVh99n6sGF/GzDezFlroKsmf5tD2lqwhZXUdKTxT6lLhdecSdqq9ljvao5m13uwXffwDaqGEu78bx5FkiqJEL7KAdTywStke8dLKbMzNt5hsqfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714750042; c=relaxed/simple;
	bh=H/6zgs0AZn5Z/EP7j1wv2te4t7hHEPcZoTG0qe0YPPY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pNbvEqykOpEfzJiR7/G3CvMfcGpF/EwhWnruDGMAiy3FxP53aIlZpB/jVbBsdxfmQjS4UPFy+rbZypTtlzeDTxVjHk+iOwwJVX5ZXzqTczxFuHHsw/K7gNAfHZhdh86qiQY4IWRENmakhBz7hr6rnUoKyzHzGh0Ia766e8dIS1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=A0tfc9W+; arc=fail smtp.client-ip=52.101.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="A0tfc9W+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx7qrCIQGaSzySSec5SFjTum+HxQpc86xeQ+RsDSTWriOHK2DnWimMBHvGQhPJXmuX0dX6ul4g2FRcZYW3AKSP8fFSVB9rpf2JTJNoEbPqQ9z24u9cr3tC792dwT4GXyzszu2vwWY9mgWUm8ISGOWTLomIoT4d858gsAPYrOMs0eEkfcYr8d/uFQRjNifGBSuvZTsSqt63+bK2iDZDWvK2QHXlgWYQcdAXTVG0wwSa2cbrcFgQ2DygghTz51jRxdCLKOWFgoEAwdQMZsVgvR97FIZYRdX3KVagRHJMnXNz8IEQAslYYuVtH8yyoluwevwjJ2BeOpnLZqX07IcHznGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6JrpAejCXSC6GP7Abd106tSPmFG2wS0lpG+r/BnbKk=;
 b=ebxZncidXk9cGuJln/oM3QKefLWk0LsmyQvcvqb+e2GkFjH/Gaj5RXIQ//wO0TDjsVrSHqGg9bqW63RKQqwmqwgnytmwghCcPOis46c8QbT0CAoOni0677ex2MiNMckxkW5lx9F5SMwd1+aRxt+ni42oHAifGT2pR9fGTij2Lqh34muSAH5GVUNevt8LSI98o0tSUUno1uz1zQwFT8a21sGKoa4g02lzVIDZbLHFu1XFHKu2vh8T0Gt/Huz73C5l/qf9FhnH8KGC9BFviYJdWhvqemd9kDrEo/OJZBwgoz+ksaa23dSFwfOgf/BlNuKnYSz3DZsF9jUu1KBk8XzmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6JrpAejCXSC6GP7Abd106tSPmFG2wS0lpG+r/BnbKk=;
 b=A0tfc9W+kQcynwIG4Z5QDNwQPdYjPA7u8LsZR24f90JYGYkO9lVFsTfzwQRvJ/dtqle1wiDmaWJKhN4I5BXEfoApsjLP2aJFhRE2qeLah/tDGicLKf04s1A0Jaz0D1nd/6V7kRP7aRVin+2pWETlTflCf70uUaHirFQF/HgMVU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB6772.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ee::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.31; Fri, 3 May
 2024 15:27:18 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 15:27:17 +0000
Date: Fri, 3 May 2024 16:27:14 +0100
From: Gary Guo <gary@garyguo.net>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com,
 ajanulgu@redhat.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 3/8] rust: alloc: implement AllocatorWithFlags trait
Message-ID: <20240503162714.67188a22@eugeo>
In-Reply-To: <ZjI6k4YUsdUA_LaF@pollux>
References: <20240429201202.3490-1-dakr@redhat.com>
	<20240429201202.3490-4-dakr@redhat.com>
	<b098c9ee-a9b5-4bef-8703-ef56e6b1dcb7@proton.me>
	<ZjI6k4YUsdUA_LaF@pollux>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f3f500-dc87-46dd-175c-08dc6b85846b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fIe+lf3Jyu8JKOQIaUqneAi6HxQLktjw/R+X/ZtrCS8QFssb4ch2DYH+Z221?=
 =?us-ascii?Q?tv/rsPJqT1X3ku+K1WCtNQSmsQaOTsuKR9WSl9QJKr5mI1YhGSUshl+rE4h2?=
 =?us-ascii?Q?wntk9k5FvMUWMB2S0YuyWxy/EGs6fK63IaqV5oxJTUCJWNVTBE2kMP12UQ9F?=
 =?us-ascii?Q?zVI3+hJ8haWyFJwHtS4VkC0qwD5srJCyFRCDfhzBYmSuxa7iRrWh55FxK8Ui?=
 =?us-ascii?Q?jOwdIumSVBp43MDuu54h4h+I99Ak67vebpW+j6L/i9kGNaWCFLONanBajpW3?=
 =?us-ascii?Q?pyp9M4ZKzC0hVvAZcnc/ymW72IEjyfJ/m6wZ1sv99Rs2X3ojVAMnxf0mkaG9?=
 =?us-ascii?Q?agoBrEbKeTfcf8XBH47tMUvABPh+EKP4hjBaFH/iUhyocNFYhm01ZavVj+7E?=
 =?us-ascii?Q?/9IZ7Uak4I21n7vVl+idO/l7XBNUABMEhTbvNhWzI997Zomqvioez328SO+L?=
 =?us-ascii?Q?wvMwUZzHUam+GHx2Ig9fEjUFzy9xsICtrtHz13rRRwxJbx0sgIdCHGKVTnyC?=
 =?us-ascii?Q?BzpR/PuqdzNZmWud6Q4TTCX+SXsQtMBZTyFz8FwH0rDZPtb3unbWtu2UjcG6?=
 =?us-ascii?Q?QL7nS0+PxZ5RS2WNqvgAxoRMdRuvV7uCTmY4wbtuWRMeqOhxOj8cqQlhSN9d?=
 =?us-ascii?Q?VxGY4kbk8AISixGGHg90z4IQZQNenXU7m7uuikCxnRr5QCWj9GnnnNkomkkW?=
 =?us-ascii?Q?vbORKeQEnQA5aX2FRBthcwPPRXK2kDn9MHUFOn7aXiWbvV83NQ852jgv7+dc?=
 =?us-ascii?Q?1uD142F2ntCIGZrAbblnYVQ1sH6qty4TXk/89kUyBO25T+P6ukG5YbNyGEEs?=
 =?us-ascii?Q?nxqKGeaqyNMnYHtcjWCMNPW9ZVIblV7W1j+H3fWzxXglH5jobbzbsgXJHzt5?=
 =?us-ascii?Q?vT1ib625UgqmgE5LZJqDyY1l9DBrdORZMy34CZ6AHgygSJXPAAMvDDUTGOJU?=
 =?us-ascii?Q?jxWQj3lqaeoRk36Yoj7l7Z3PtOpdz9o86M6I/M+TH2Kve+ZlQH60EsdZNmYc?=
 =?us-ascii?Q?RYs4rvjCMsH/qtKI+BrItzVLjTwyl/9imMTZilfci2brYBR3JHVwbLgAD7Bi?=
 =?us-ascii?Q?0A+OocHJnItaBIsmCjgDzZG2jUOlOv4OJXdDCMY5q4sxAuSSj4tTqVXOf2r7?=
 =?us-ascii?Q?GzgK6pQjGPqpv089BJ0kT2Gvv+bwOf8HLcZHzGkbKloD2CLe7lZ1EarVH+PA?=
 =?us-ascii?Q?qycu8muFvA+T0wKp2VqlIZym6EZ9jBtZjoBsSfF7jVGaHWW5amTBPhsbMfCg?=
 =?us-ascii?Q?v+z6peSKtopfcolYVqYcgqVnDTDkfgixbhaimJdpdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9McIbekihr7YcJyt51o7Au3eWMtpA0p8ONJnWZVEnpdZejrsYgW0oObNgfFH?=
 =?us-ascii?Q?xxPxyr2d26Mf4GOgCctjVF3Gru7G5xPFD5ad0vFXnfrVIA+MwRFLlErUokhB?=
 =?us-ascii?Q?lmo2Monn+QtpSe3TEbNPaysz/Q6rHFyYI1UJEtphYGC+K41YKViA/08SVe4t?=
 =?us-ascii?Q?94+OfHdUWvMeC6lKkND0LTiPlddpstyVfjyJrCSA2sZwWa/Fm4MGMVNb0Ng+?=
 =?us-ascii?Q?F3AdM5EYCaZ7GTDdYTf8fYH/DgztQ/hOsLhovrvE/CcFe4c1DFulHv/DGgal?=
 =?us-ascii?Q?fYML49WNtCMmyEXHqj5z7QI+yDr87U7ldRB4xHY/D7v5fWUsoQUz/zlDF+iX?=
 =?us-ascii?Q?Bx/nabEGq5tPTYt6bc7apa+cDCtkd2XapCIlhXu2dz78uiCMG+M99gzhRHhv?=
 =?us-ascii?Q?31K/sY7O17NIYb17S4DktQV2X0FkTH1gHeZzz22XV7N3brkxn4BthX23vF3R?=
 =?us-ascii?Q?n4UB5iSwObCjRAvPmObLegNECyKyduj50nU89sX2HRB65GxKEeMx36cfryj0?=
 =?us-ascii?Q?L0fODcBcKnpk4wTVZ4QR/Fhu6elFWLAU0Vpe2TRj09wGeOhmi5m0aJ3aAndy?=
 =?us-ascii?Q?/B5ZGD5CrVm9Y/UnU+eMK2iWva2GFHTKZaK8bWub5ZFGmpn0EWaRYTVTzVzI?=
 =?us-ascii?Q?s6CcI5wlYz1uTMAn+rme/geazpykrIcrzt8fVokJcKB8CCGEOqe7b98h3YBv?=
 =?us-ascii?Q?t2RahL2WsEqHvwT9r3TbwuXeskdP/YGSMAnFLKEZQTwao/zgePyIP7PTYlrq?=
 =?us-ascii?Q?tt0sgLVVUC+KQFs+QoIMcO/81yTvBJI63300O4GDt/BdXbeoyUHEyp0N/yqv?=
 =?us-ascii?Q?yEaOc87te3wWcc+vonoUvdaOiCFKo7ralKxLdO0vlY8hulWbmQdSI2zTNH2h?=
 =?us-ascii?Q?kADqoJpFjUizwXdR/y7n4xOkDfRQ5cko4bG9lUIyYqv+alLF61zhRd+SXnr7?=
 =?us-ascii?Q?vNJZZ2AwFFnAy78ooML43EODyRu3XvPSmWgI6EZXP4sapH+cZ4/KWsupHipW?=
 =?us-ascii?Q?r0rKRSa7hfY7cO5IBrQH3nh+9ytIYt/dQ25PgU+NUn52ERydpYPPeYFkRiRb?=
 =?us-ascii?Q?F0VWrNvWaoD5gP52VwS6GKE38VdRKX8mrhFVE3Lf+iNuNexZRvyBN6IuAiIs?=
 =?us-ascii?Q?hJAO5q8GZUPq2d1pjFyWSlXos7jcggSVdTvjvN5KwXcnYxoR/9y4KhZ3vdSG?=
 =?us-ascii?Q?3AKoXTOIk9BLsMyVPze8SXm2oIcWbRxmn0yqJAsf5OBt6Dd09081sLfArT1x?=
 =?us-ascii?Q?hEpOhaqnN+LMq4MfV/JzwDhe0l5idEV8ZDcOeknO8EmBroUWn70yl/yS+tEu?=
 =?us-ascii?Q?r02q44Qcjlg9iunXJCxHg2YQy9VHv7vdJNjhz09Paz2h2Bh86RGqmvOPlNvH?=
 =?us-ascii?Q?xMRHpswWfO4r+aN9QynNaE7Fj3YB2ClY5XG1i/VFUuu2ODTCAQwreA9AD5/B?=
 =?us-ascii?Q?wdVG3yW+ThH2YKtLTSffsEUXF1907UcWjqUFSiG4BGAskB8jHii5iTimtvNC?=
 =?us-ascii?Q?T+FNFZ9vXVhrwoVgckQ5NFUkyk7TpCJSskOTK0yANLDUvHlQkcgEdJpGQfWq?=
 =?us-ascii?Q?W7LZAOIlYL4OgLQxTKR/jEoJSncvE/G4JDuXZh/todn+58jEwNk5vxIQv3jY?=
 =?us-ascii?Q?Fr/+TYxoaEt5rNDXQLmT4Tmyvp/xlHO67erKVrLNTEeW?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f3f500-dc87-46dd-175c-08dc6b85846b
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 15:27:17.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4A2R/r56UwzpUcLFDllF74Z18LDrMKeOhM4yYBlyIjRiL3K22ZHR0jkSjNFt9AMNWsgBJZXJI199dr829plR+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6772

On Wed, 1 May 2024 14:50:27 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> >   
> > > +
> > > +    fn default_allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
> > > +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KERNEL) }
> > > +    }  
> > 
> > Why do we want to have these functions? I think that it would make sense
> > to forbid all other ways of allocating memory. So only allow allocation
> > where the flags are explicitly passed.  
> 
> I agree that we should forbid allocating memory with implicit default page
> flags.
> 
> I added them, since I think we'll always need some implementation of the
> Allocator trait. And this just was the obvious generic implementation.

Ignoring Benno's point about enforcing explicit allocation, these
functions still shouldn't exist. Given `Allocator` is a super trait,
all implementors should just implement their default allocation
behaviour in their `Allocator` implementation rather than calling into
the `default_allocate` function.

- Gary
