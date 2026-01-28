Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011008.outbound.protection.outlook.com [40.107.208.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDB527FD4A;
	Wed, 28 Jan 2026 18:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623522; cv=fail; b=AfSu0khvTybIT479z6ByJDJa2VQRHikTryu6PLuvy/tkQNXVAEYIBlI69HIsfxINpBDizvKlVQB1HSwgFZDvpa34WQ+W4prCSyfP2WxRJ6bEec4+CP/KkZO03iDSdezlMRIhTYnZ95S++H8RJFMsHvyAuB7CndqtyfcKHm+JM8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623522; c=relaxed/simple;
	bh=ThnavcYm+H4sxOVcnMyOcfPQkr2NACVZfHukyEDifZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l/R4iCK3Nlb9dH8cFCEaKYsxW16SzicrizV77AUVaqpE9jZux0S3mMhl1/A+LXfxAYLayUx1JlvnJRy2DNLRblc3QvRQMEmbfAlSqp6hZzFFvC/fL3zMNgleeeaSmS0cC/15eDiWiE0MeJNj0MtRQE/Fn4SJ1bNs2B7AMOkBB50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fEg633G+; arc=fail smtp.client-ip=40.107.208.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fEg633G+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VALjPqd1mzmQtCMf+VTw4tlGJhBYekv0fldYaI2s/bL9fnhJ9qZojEJTHoF3dgOJ55nS3wNgwcJGtdMt6w1rsOlkNkH4hA0JjmzZUBHl6Hz9v8dZ6MM/eTeXB2F13O+veJx0oxkACyM3aHRonyngC93Y8kwmoo+B1r2WILlxe513xgGRUfGNJqyCuwP7FIJQbIRNlYF2IZnJWNQFg46bnMuPKR2lLDZQIRdb5o29McHN/gP8mvwlBBZh1oScAwYCJoz3qL+EbPfNh5lsgBFhBVkdsdRmkbaQbQMREx9Jmc+1DaTLRPiSR8bKirHrIvqYoDuWP0IUQ1Ounkil6C4tDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2hYYlUwItGe4BLvJgmKr3TOnCQB0eouWAXHABtQU44=;
 b=MXXWz/Q7Cpw8PYia3LBTlH6WKX2H+MWglR8se+A9XWkr284XoKuoIHHf9N5vGJzGeXFp40yBkpH7yLqxnupFNY1jkCsHEXfyKTiiJJBcGNTFxMv/0b2JDMb6e2XRp5yXS0J+gnCbx6NrK0/Nx1o0iVCoAcRCMdiMREOJgcGuOBTtoGue+QRBtkL/5/H5WdOQ0e5Y76to019YnX0s/hQ7SOpdGLPmvkt4tMQ3DWP094uJ9j6dfO9S2zTJaGcdz1MylKwYooB0F21H/IyUkdUss3YKUvswTNubjBSm8R5WYYAhnl7zV62RraBzxeem1kvH2weDvkw0KgzpHUuMzJxcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2hYYlUwItGe4BLvJgmKr3TOnCQB0eouWAXHABtQU44=;
 b=fEg633G+Ll23/dzt6cxAHoNSFGiTNFcgnySQgPGtuSyo71AtTCOiiQmb/6CC4XrPDiKb0WfTO1F4QB+9CqYUPlWwghXLGaElu9kxsa2t4e00kjr8gHXPe7wRzzUGEjQThUUKeh2r3IvfI1FFW4Zeg4ilBjPnPRUP+Gz55/lYfEa6axncf9vbvnds/+REnjssHE86l3XSiyDNblAYafCYciY6Q6dugS2qrcIVMD69LXSzWF/7T1tDC83QKpLiblYAMey1X21zdrYkb3udiiH5PqcgzHf59I0o/+I4e/U1kpnfvxMO67BvRivjXCCdH7ruUlj+dVn4TtSTO3f9Nb8yyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by DM6PR12MB4436.namprd12.prod.outlook.com (2603:10b6:5:2a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Wed, 28 Jan
 2026 18:05:16 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 18:05:16 +0000
Date: Wed, 28 Jan 2026 13:05:14 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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
Message-ID: <aXpP2l9Gr0XOfSEn@yury>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
 <aXhD4sI6MHdAvgNT@yury>
 <DFZB4ID2H1D6.2ES3VEZQEGEQO@nvidia.com>
 <aXmeR2ocKm-xPM-w@yury>
 <DG0A8B4DUBDB.2NT25Q8SZOHT7@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG0A8B4DUBDB.2NT25Q8SZOHT7@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:408:fe::19) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|DM6PR12MB4436:EE_
X-MS-Office365-Filtering-Correlation-Id: a63987e9-3132-43a8-29fe-08de5e97ca42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mvA3pi7RCSMeDznp3haRtvOD5U3Pyzx82ORYlCi7Q7fN2pw78IHJtqVj5Vc4?=
 =?us-ascii?Q?StjBiGr8CHmCWl5MdSiqJMO60JM6AevzxjaeR7j+cn5OpjYjR6dUaN/98C5h?=
 =?us-ascii?Q?vns8rvcpyGr6yFLhiwJBUfFTbLgQK0YrD40o285pZBunizHCfrVc4hF4swc0?=
 =?us-ascii?Q?c0MFf7a1IEAsnswIy0WBshGX30bepWQjsqtr2J5fXRRYbe6Vu0CXoQ69vj8V?=
 =?us-ascii?Q?tWL0YbEYtds6dFDq5EHovK6rji+AA4nfwC3S7w6Bahnn/ij+xsoyDN7PkA4D?=
 =?us-ascii?Q?3w2qQAjtax4i2VRBCnZ7Clg8HKacTW2WE/LzRH1ul4XYaNpto/qGvfBNByaA?=
 =?us-ascii?Q?SOGJtRNR3HEuZLxGS3lbcy+1cTyItUK9xfHwlwyM1lQeukfzClcJI70ZYcRS?=
 =?us-ascii?Q?8h6p3go+IRDSZnYvsew0zZwK1xSes2Q96FOwhyqcpWs2NW32CE2kusom/xkG?=
 =?us-ascii?Q?40UGQgO2M6FtvnR8lLHGF7euT6X5Spwmr8M1x01TXbQ4w9nExdGlgbhLrNSi?=
 =?us-ascii?Q?g04VPKQfzJEmFL38H9F0n+4UBFrR/7mDB2C0kZJD9kl3Bvl7qYl1tU1hC/og?=
 =?us-ascii?Q?9j6EyufsPw4zeaM0N2Fi/K2qkToEYzeFRYZQq10tgzE1sYJlEYcX0e2j2ggL?=
 =?us-ascii?Q?QtHr1aNo1M+JNa+lDpSwpRLq9U5GLrZLZBizpBlHJ1qLrrmPVeNRiFVRVgoM?=
 =?us-ascii?Q?2fGaUH8wfU/6YtukYk7qizETXp+0M35Lld5xGmM6ZHm7DuP7/+7/ozoEFRgJ?=
 =?us-ascii?Q?j65I6Fa1obeIn6grlBlbSVAmqXcRM4yWkvBviRk8zqHW+NIT7EfySqPFo8fQ?=
 =?us-ascii?Q?LcT47f33dWhR3kJ9PR9qdTH32+GBebiew+Vs4qFLCJYLCXJXWIxN0akIyK1W?=
 =?us-ascii?Q?Lbn9OZbX9scERmVVug1AOM7yXWeAFeA47G/3FvZD8b6ORazkSpOVIf2hiuRl?=
 =?us-ascii?Q?fyp2JnGpXIawy5ZbmHiqenwCyK4VPn/eBMUYnO6YAxeDNhpGH04qzd7SKCIY?=
 =?us-ascii?Q?TyiUn6cawXOgAL2LQ0JPmCNbpo2yIRW1mccF+oc0vjeu+lUIVgtp+uWEHU4z?=
 =?us-ascii?Q?/LfOipnSv8cRUm/s5UzmEx5bgZap8WUH36R4CkdOLwondu+VjKB5lr64u87z?=
 =?us-ascii?Q?vgFO9sDgyz2XETqa2e2jcNWEn6MPaE9EregHLzbEfsDsZz2vZQvrDYgJe3Xe?=
 =?us-ascii?Q?NO0GlQgWlXOkrIJf2FPhvOPMOOtKmWe2TZYtGzXFdmjSpkq4YvmUqz82V1xJ?=
 =?us-ascii?Q?ru+wdrACimzhn+D2c7DIpy2SyZOcuxlZWwUCvPPFbqAhI7gqMgrFPvTbQ4R5?=
 =?us-ascii?Q?GwHODtBIhaIKhATP+uhiVmDITySlhcdSl3buji9aQwSBa8+YY4Q/GxBMub1D?=
 =?us-ascii?Q?6g5xUUZe11M8gdf4y7z8l3EfJvsd5hyS7TE5kCQ076HqrU/Lg8tykkWqA+36?=
 =?us-ascii?Q?HFFz6doWjf/DyfQurFWh2n/PmKS6gu4Sn9wmIc6GJ8wY3kwLmNp6eUuEV6Hc?=
 =?us-ascii?Q?3RxLt5L81T9ZwDj5pE/iGcYHMicKuj19YnqdMcGerQUTM4OzJ7PgIxDcrKpU?=
 =?us-ascii?Q?/TWADp1f5Cmn+26h9/NoPwWu1lzbxW7n0QOY6rsD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pVtCFP/G2m8yKdMGx+d6YSLg/1qUJmTD6BKS7OIpC4xCoWbTSrePfPLIRRva?=
 =?us-ascii?Q?+P7XN8xpYXZB24nIrbMnedYWGB1kDAo2DgPBn2osSCRdbMsFUEfAwjAb312D?=
 =?us-ascii?Q?y7CHgWaJwyeSrRUHh+T2lvUXlgGMwFFoCjovZatd3OEoV9PzDniC8TQMUlOt?=
 =?us-ascii?Q?RUihnb8H+v/pMtNyxcmX+OKRsx79S/r1s5N+A1+qRbK037OiB7zq56NxHCyT?=
 =?us-ascii?Q?qChGQ0xK1agMLjB0beVbFesDHQyM5j4KCsT8/q+/nqlOCX+4PN4sRsk+R4mE?=
 =?us-ascii?Q?cnhZO+ia++aun7j0dx0IeOJdkGyP0Ek6JuXye96B94GxwXbQP8svSTFK6Rea?=
 =?us-ascii?Q?anm5dVmR1T5nyndZ+OYb/JIOzs7ey4FnJEFB4Q5p3FHSe8Tutto0qQOpKIrO?=
 =?us-ascii?Q?QaQFYdQL0VHFwVfFyufNo7h0WW94HbfhVJJlpmF5sSmXZwjSkIDoE+7F1CYQ?=
 =?us-ascii?Q?4FCHvwDPwvd6CxCB8zEKpTiL7WAaJSvGMjEVx9vapn0HqaoOWgfFkWt5Y3rm?=
 =?us-ascii?Q?hzAsPAWczAW/pa8Gf//YqTgqIj6nDwenbvpHFQIOOGR4geRQj5H4xMHdoOHi?=
 =?us-ascii?Q?g3A5TZoRy/NvVzi1y+UCYhofFsRJXkzYCo8lZRGGcQoT2W829y2CEIVd6DOJ?=
 =?us-ascii?Q?lyuBjMsMBLHh6uXlbeF2jmb444OORkJ+au8TEABOWrytcSR1nv9JlwlqYBrC?=
 =?us-ascii?Q?HDNbwZm4e/BMxCq5xU2aQBJwhZd8WMBdH2WPSWuLbddd/MPIKHkMb7dFWbtE?=
 =?us-ascii?Q?UMTy49lHqRfUZZU9yxqt5NbqBi0WFGZzTbBbuYcuhOGL4Ay8iUA6nRD38TKl?=
 =?us-ascii?Q?Nv0ga8bbTLfP/tUEgJDrCc/Drc9Qjoicqv3dF03CYIwIbfSNwKYNmTaoHXvC?=
 =?us-ascii?Q?KW0+LIMdnoJTbqt3ftsP0o+vy88O37C0odqV7H+/amGj+F7X/EWevuxgtOdv?=
 =?us-ascii?Q?eSTw3N7y194yGe1M/p1jQ8wFZ4ig/WdBAyVhKaDHWYh6rQ1WBw/7dGVbC9ia?=
 =?us-ascii?Q?Mtf0amm54m38DLwfObjqeUPt5iYs2csSv9NNT0I9cLFyYIRqo2b4//uXjN+X?=
 =?us-ascii?Q?6461lGYgsifuDokmV0/TqNEBexGCG4Bwpy2IL3XjfG+AcSVdLs5KC+8QUFoA?=
 =?us-ascii?Q?fjjne7Mi5iFD0++9n4r20y4P4LcOfTvCEdfW+k9mRl5Ho+BLABrd71R2p13W?=
 =?us-ascii?Q?iw22vW4ll2kqvK/qsUQcry4TIo1PPwB2MLIHSbuloo+cdGFjf61VEMTgCVPL?=
 =?us-ascii?Q?FjLyYJoefPMYUmZM/teyMowS5uCNoe+BYhXtPPgYHtgzz6bpzFSl+/8z1UOa?=
 =?us-ascii?Q?KdXcJoJyqj/6NQ0R3Ld68HT0EzWDyj8fYf+pc2gyAwdVG2kUpcc2oS/8ybQl?=
 =?us-ascii?Q?J6iz9YqMyTxeNNKs+i+1icy0dqydNxf7HliHmzlcZeVk+dr/NYSBWsmsXP/7?=
 =?us-ascii?Q?KWMJxBCoYEdLu85YvOtZO6WGdCAgVjgQvRIOyvVXrWmzYfAGCXcpxdCvMGJb?=
 =?us-ascii?Q?bywHH6hJiUZzlqp+YaDNnFMnXDwV7RvbfFOa7XJ9+s3D8J/5qr9q9KhsuiT/?=
 =?us-ascii?Q?jDmDVKwsW7EBWvDeFByl6CjJy1C9wW9w5aW70O6xCfqUX5ZT5twKflY3rhMg?=
 =?us-ascii?Q?+qpm0d4QZYZRgoryo2aQm4DEOokPMHYMwc84VOKtL/st+EGJUW2Rp7jTEuPp?=
 =?us-ascii?Q?ztNhPwP4tgErUNj5o65l19jsRtMXGSGdJIrq6XxveHceJ5WtEIAWZdvBOnXK?=
 =?us-ascii?Q?9k/X+MTTDA4OZE3VglWDkqW0Uhq7fwVxSJ0Zn2vh4Ultx+ryF03U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63987e9-3132-43a8-29fe-08de5e97ca42
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 18:05:16.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHb3gdPBlEvKMTUt/EwVwtTAhxSUVg8hW6qEoMkbXFEYjwg7lDwjmxF+VcVTNexH8lkVvCma8AlCUCyQetBvEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4436

On Wed, Jan 28, 2026 at 11:12:27PM +0900, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 2:27 PM JST, Yury Norov wrote:

 <snip>

> >> > Then let's implement it better. Can you comment why the suggested API
> >> > doesn't work for you?
> >> >
> >> >         color.set(blue, 10);
> >> >         color.get(blue);
> >> >
> >> > I think it should solve the problem with name clashing.
> >> 
> >> That syntax cannot be implemented as it is written. What type is `blue` here?
> >
> > 'blue' has no type because it is not a variable but keyword. We do
> > such things in C all the time:
> >
> >         DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
> >                     ^^^^^
> >                     keyword that becomes a part of cleanup function name
> >
> > And in another email I seemingly do similar thing for python_init!()
> > macro in rust to pick the right constructor.
> 
> Yup, and we could do the same in Rust with a macro, but your example
> above was not macro code (macros are always ending with a `!`).

color.set!(blue, 10) is equally good, if it helps.

If someone will point to the excessive use of macros, you're safe to
ignore it. This is the very basic fundamental type, and I believe that
it brings enough attention and expertise to make it safe.

> >> The closest we could get would be a macro, that would look like
> >> 
> >>     bitfield_set!(color, blue, 10);

Or maybe bitfield_set!(color.blue, 10), but the above looks more natural.
Is it possible to make it color.blue = 10 by any chance?

Again (and again) - usability and readability is a king, and I'm glad
we're moving toward the right direction.

> >> And beyond the scenes it would call some more intricate (and unsightly)
> >> machinery. I'd rather define the constraints clearly for users - they
> >> are not so drastic.
> >  
> > But that would not be chainable, I guess. I recall, Joel said it's an
> > important feature for some reason.
> 
> We could make the macros return the modified bitfield, which would make
> them chainable. And the bitfield-englobing macro you proposed in your
> other email could also reduce the need to do so anyway.
> 
> >
> >> > Can you share more about the other potential users?
> >> 
> >> I know Joel is using bitfield for page table structures, but there are
> >> of course many others. Basically any structure with fields defined as a
> >> subset of its bits is a candidate. Registers just happen to be bitfields
> >> with extra properties for I/O.
> >
> > OK. Can I take a look at how bitfields are used there?
> 
> Check out these patches:
> 
> https://lore.kernel.org/all/20260120204303.3229303-10-joelagnelf@nvidia.com/
> https://lore.kernel.org/all/20260120204303.3229303-12-joelagnelf@nvidia.com/
> https://lore.kernel.org/all/20260120204303.3229303-13-joelagnelf@nvidia.com/
> 
> But be aware that they use the `bitfield!` macro of nova-core, this one
> doesn't use `Bounded` yet.
