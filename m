Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011006.outbound.protection.outlook.com [40.93.194.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188F2C159E;
	Wed, 28 Jan 2026 05:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769578062; cv=fail; b=DNUUZ+piXHfZHZUq6StcYmpdCJ2mYhTrLGLQ0aEABaIHnKfB2NsSRBHzYd2DkSOga+bmoUf1B3cxX7wFirATZZro7nqdQb/9GtLh9SkD+pTQbklEPbUKyWeQPuff1NfynQ5WdXnMUEUSm1gXWDoLr09jJ+Ir2qciF9u54hyklKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769578062; c=relaxed/simple;
	bh=TQcdaKmU5CKK8Dybx5qrGikpSanFOG6pIJ/Q0kXcmDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NeyQzZb/qsDbKfvsYE/NmBjYfxooX58jqqzMNqilJzyf5RYhGQo++TjZ9ZWsp200kRvlCaYBOZbofi8GTewraD4QiVTAODbREHJ76E3hBGHgdmjhr++acfl878ZX/vnzHI11z2Lo3E+Zz8z6zC94D/YCKtwGivX0is2cVV9rH9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ai4WeCO5; arc=fail smtp.client-ip=40.93.194.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ai4WeCO5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJJGHUWhaDk0bMykBUpVfKRYHlFQKCxuW/4g5qNyf3XX0BQJXJhf8tbQx1WP8rMYJJyZgIPG/HmQvBYK+J46BXAAaMo62Qim9usH8i515Vx1OWNX2kryrEG2VkBtiO+Eu1kEnYMbNd4oy7H9tkY1dmNWIiSqfwJE/GqHVdrnOtMQuIesCqJ69kRBNRzlckHaSQkwxBRLUYtCb4HspBlFu1mLNxm29VwUbtmaPaKdENMeSl9SbbtYnwp3wFhwsOlbLQgX6laNPstwgUPrO79KjqjKZB6qwWOAcB8WzGVOCELwqPfDlcMhIdi/iFLyji+6aRxBGG1t3jFLprOFJXijRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qZl1l+4PyFd7OuEH46XyOMWniYeWzPuzX0nS4xZqKM=;
 b=yWpXJU8CZm2ZuMuhj+v1IVQ4+jMQUOzO3ll2LK5+X/r/cCCo0/bguoO8bf80q/ItUA7eE0a7dgNB28xPrPqIYuOREPljLbdTMlTgWE1VVgvZ8euYhgYqH56iC7ix3iWwB2fCJLH6flCsWmrTtg913j1ONfj5GVsPC75bcGhV8VRDE0WN8JOrv9dPCx1/JwOSuI+X+JwAjZAZU6q5HGiexMphWVCcXEm8neBSdByaKp1G2d75nOEWOhysDMLSgfPRFQve/St4cyjKVTW9jYQQsNFTWkh3V+fVafPwA+/aLeDXkjDQO08B+SBLy7zP9KkcBXSE4z8a1bBlduKlEUmffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qZl1l+4PyFd7OuEH46XyOMWniYeWzPuzX0nS4xZqKM=;
 b=Ai4WeCO52r3nR1J0lYG90GCdyy4OZ2Z1SHkQvEflCpHcK+NyPduUEji+y7MQjiDqe17rPgL5VboMTHKKcrpO2mZbTW5TDLrRbxV2m7LtD1+wCaNuP6Z6FhDhonmAeIoygQYRQ0oMt6ygNVYOMRBv9vtLXn3XdCInkxCX9chLh3l97o4b6XF4Eq80p61MpeRPYiPnbPCyfzX8bOia2fTjPDTJ139yxcYbRHEThGFETW82wxzns67+IH63AJNpdFuSiuX6FiGzi8zXheC099S0W/Rh6e06mBa+V5WrL2MksAXUAyEVQ9jfcJBpFmCTIQbUSM5Ez2v5/H1X2aI7xkw0Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 05:27:37 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 05:27:37 +0000
Date: Wed, 28 Jan 2026 00:27:35 -0500
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
Message-ID: <aXmeR2ocKm-xPM-w@yury>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
 <aXhD4sI6MHdAvgNT@yury>
 <DFZB4ID2H1D6.2ES3VEZQEGEQO@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFZB4ID2H1D6.2ES3VEZQEGEQO@nvidia.com>
X-ClientProxiedBy: LV3P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::25) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b240c22-1463-400d-2f7e-08de5e2df2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dTjYZ4d4KShAuko3V/nIYr/nCUNu+EIJ8p0l1HmGmuzHpz+0LwcucVhoNdfo?=
 =?us-ascii?Q?CXuK6RStItKmWULh2uTjiN4byDMeIc1PJI+3G+FUunj4CJPFgOGpHAND8Fil?=
 =?us-ascii?Q?Uz2cC0HkrKDKC7Qv1aHFgKIFkU8U52nEXINjlsXk7Ozw5LSBlRCsrbchTFuV?=
 =?us-ascii?Q?7EiwF/zgBX2w2i3gqkhpp8PbeJ3ppkusoeXGasAr9K7EDqCqln+Z3evnJU7E?=
 =?us-ascii?Q?5bmuNHZQ+FRMZQ6Vrj8qcuDJX/50PO6Pw9NxUlDull9yyLokahdTYwmCz9Q5?=
 =?us-ascii?Q?RL/nKaBZ0wRltgWvsK/SX0soxC79Uf2AcYl8YWoYqXzlKT7YWXxDvvB77Ksg?=
 =?us-ascii?Q?strcqiSXDLeaRXR99FBqmMJp7zOD1qJUOpSyk5cREqUnHIR0+DvGtsM3Otxh?=
 =?us-ascii?Q?PIdLMVFFKDlXmG2U12LuNgWxyS14PV6ETOZMiYiviPHINSpwCYLOPDsTXclo?=
 =?us-ascii?Q?VGcM9TYiZ6SlDs/Pe7fubT9eCG8vN/4gJ/I6389MUF1O2Ka9BlxUX5NblE3U?=
 =?us-ascii?Q?ZQdqsZZGC3VhA4qnfv6/DWJYZBAIhlo/GwWx9NyfqWDPJ9rem6KeqgMHGpbj?=
 =?us-ascii?Q?Swta/EoGlLsGzbFpTNhavg4IPcC09Rdhs44q8MvzXSxljIARJvM9WwlhoGQb?=
 =?us-ascii?Q?guufkDKzyU418Kau8B2V7teJ47m3eWL2VbKAOgJNL8St7+QrsQCp+/UxXicu?=
 =?us-ascii?Q?p3rjykJ3DfdF4NHHvUiECIRNgUmAFuW21kWWMAI5a/1oOEagv07fP/rzkmi6?=
 =?us-ascii?Q?/fPY7nJBGOuKmyGvEeoOl+zOCo/oZDxigcVepohtWjSZSl5eQLbhcmhcamTP?=
 =?us-ascii?Q?UV+ivqs3ZlvegdKuC/3PnF1+kgMlBCuwq7U2Z+CFN1nEtKoUl5/uAiNCG1+f?=
 =?us-ascii?Q?1GM8Xtv+qa/RC+VaqQpFRTkvajmKgp/CzgRhdgU7zhG5h22KCcptAD1mA/IL?=
 =?us-ascii?Q?fXYcVDAFx0aHB5lrh9oTv8xl33BLAV9kFUaiiscZ36H0BWMfYJVQ/tYRG8kH?=
 =?us-ascii?Q?Kl7LUmbKlAT1vQbFkr1RGfyCzSj53jKDDE7IVGoQuQR+KzMfjvLPJs72w517?=
 =?us-ascii?Q?UyzeGN4ltARmey+nHa2+HerL/gzmYWC20iPDTShhyNJzzHj48rtnK/z7fjQo?=
 =?us-ascii?Q?jfbwv0uPfjYSWzG7L9Kmb8tIlrcJjjbIa3tyKi3D2/E2GFaHDR8OQ9xBPPNW?=
 =?us-ascii?Q?MKXQ7LQ55UdnlCuICElRzkvxGKHhqZ0c3NW5yTFFvGaIRgBQ4doy+ncOWqGr?=
 =?us-ascii?Q?Uawqf7skh4NRPSwAjstlVjJkdOI1bM6sVQO89HTVrMwRF6rODEmJHK86HHUF?=
 =?us-ascii?Q?21IRTuTgCdVLbLaBMZcH/I5ZZaogQt3VovQOf5KuecUPLBtUgEqOHAUxMJB4?=
 =?us-ascii?Q?HjcHMXrMZGcbVLTqNbfXX4ezMcAVDH0U1SP0YqapIBxtJbLBixEhxerU80d+?=
 =?us-ascii?Q?yFmDBK4xjFWSOgnECqI8QxO1LY1srFkYBO1Ek2hy/yJtLGi2BcMEuw9jZA+/?=
 =?us-ascii?Q?+8MaSLiLBsCh1UmKvJYoVfpD0CmM1txttdd9zVNOFTxfNtpW1RPjhHxY578V?=
 =?us-ascii?Q?Kq5fcrEE8quFw253pAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FVCoMpyCQQJsTOuhX0D7V+09wCz78Tz9bAFM2MBNRi/gGS/F0KkhaN+FMj2P?=
 =?us-ascii?Q?3eOeUJwBO5UaBGP7iFM4pa/OPvUegDGHtANJCq3tIYJxirf/Nucm0XE5yfUh?=
 =?us-ascii?Q?rrEvAW5PQjcqy9XHAPztNB5O5OPVY9Ggv5wyMDVjf/z4t8me2Q+3nGOSEfzU?=
 =?us-ascii?Q?YiCrbzo9gT9mJUBHhu4F4M5QEC682qdvECURMIvDqCNWDB4eXT/CsAy3LWcG?=
 =?us-ascii?Q?9t/GBlKlhu30296ywKTfHlBpiiYTYV7YOm3r8E8/XdazqDCDezoeHHget8Dw?=
 =?us-ascii?Q?a4yinxfwMI9dw4ga3JwmELEHE/rkGDD/J332AsOzmWWLMGFjnzpz+yAS+UWd?=
 =?us-ascii?Q?fo35Zc9I2Vuv29SOb/HkNTIyZfctYkN29WaPAd/pGl6TMNaPbpbT/n34x/Rg?=
 =?us-ascii?Q?KCNkfTgzMldyZKPIQu1j5jvbM0xv56EKPOYH16Z+FPfrvyJSOkDYlsWxrE9N?=
 =?us-ascii?Q?Ms776e9Bbf/2ejDEpKzip/zzVehrbd2aeuPrv9iCJh24OwD3WrJtTwir7vdk?=
 =?us-ascii?Q?Jl9BoEMpi9bEQlTRCfjh0xoYdFo1QCqJN5hveBNX7JngOj4LbWfP1zMenl3L?=
 =?us-ascii?Q?W9IZ5z9wKDn9/uo5c/X7kApf/2uQJOCqAOAw/mwCHerm6nn+ONuGCYHP+FNH?=
 =?us-ascii?Q?PcDoFTxunVKK+pcT7UfQZ2pKTh1wrexICm2aIKjyMrk3QdDovWixqpppYVbq?=
 =?us-ascii?Q?ji7bF3yUZwYvj5XSAaP87GzZFlF3yOxM/sw0CwnyLhtMVbujZyZnebbFxOaF?=
 =?us-ascii?Q?1SwpdU+aL5uPWz6pn2SzsUgEVSNdbXyr/66qnvNy8DZRwFwSkrg8RpyLpeSn?=
 =?us-ascii?Q?PyoXwXdoKj73KoEKFuMpf0jQfkmIRSfa84aUmsVRZ6NOgd+xa1EJTP/q5i6+?=
 =?us-ascii?Q?ZxX9/GBOB2YjwYLdj/PWKWixJazOHPEiNXXFc264ADpYoFWL3fj/DX0Avvwj?=
 =?us-ascii?Q?In0HWN4uItpJRWL8K/VZE92Ad8eDulNAdvl6lN/xe4kOOinpfhMDQCR21i1F?=
 =?us-ascii?Q?601NUYCfSYY4HTjQjavugvmRDCFlNcKim7GgNHBGstzBHTUV9wbAAF6D6tkQ?=
 =?us-ascii?Q?KiDkpz1ATF8pazSOpv2njmEZLzao+XeOfNeLEMpULDDUuxs4fR0HRvmIp7AH?=
 =?us-ascii?Q?bfEgvrVhehTk63jaItClrbeBQx4giYtZKNa1ucN+LuvUoTz5eMT+2zNheFMb?=
 =?us-ascii?Q?K7HCqHjCWAtdlO9MmNJ2JhK2kV5hRNtAB5ZGsYX2F1AF75YxdHFU7SfkZqrA?=
 =?us-ascii?Q?TT2eHKIZZxksmMTGBb2y3Uac9Zem+cZxbCwE5zgRdtmWy+HxLlfdPIUo1abR?=
 =?us-ascii?Q?QXmAaN09g1gzt2l8Iii1r7EWt1WZYeoCLP3HVQeNroBSSx61AwAlQA5o7kGY?=
 =?us-ascii?Q?gF1UjYH3wpxdclU5v9F9tIOcHvx2f5/z/Xz5mhjPBf4GFnmot+V7WtqjyZ8g?=
 =?us-ascii?Q?brf6WmQi0UXe7AdAKGRtUS3wMZTMOJBlnRvHW1tXDcxlWl8We43Uz0mhu2+B?=
 =?us-ascii?Q?Ng3+OyjxkpRWgSzf5P5FoxqLAqu3JmaQOoFIX11UTK7Fe2JbY65yOxY2v5du?=
 =?us-ascii?Q?qO3W5yFSZoDdKVxB4Axi9O+E++TPa+VmmS0BtTowdVBD4FvMicB/3a2gW3nG?=
 =?us-ascii?Q?jDgthTunvlla+KooK5mDH3ezNSPvsG/meeRBMomkUwRttuMKoZL3pgeLw8Gj?=
 =?us-ascii?Q?xBw+ULgjKZEM00nFHipv453AR06WQzPLe/CMCddAeFAhsNa5sd+60tRW+eyS?=
 =?us-ascii?Q?1lgQkFd4NUVTTAlV9ZrbbRGuS4OFVmErlzha/GCYJhRcUGzVJ6bR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b240c22-1463-400d-2f7e-08de5e2df2b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 05:27:37.3696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwB4EVAIHtM1YKc8AjjPSZjN5R7tCAltcPtg3Qk+dH20pusfYnwyhuQAxlpNjvN2kDhYo6cxpcJh8lSOOJZcOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229

On Tue, Jan 27, 2026 at 07:41:50PM +0900, Alexandre Courbot wrote:
> On Tue Jan 27, 2026 at 1:49 PM JST, Yury Norov wrote:
> > On Mon, Jan 26, 2026 at 10:25:54PM -0500, Joel Fernandes wrote:
> >> On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
> >> > On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
> >> > > On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
> >> > > > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
> >> > > > > Add a macro for defining bitfield structs with bounds-checked accessors.
> >> > > > >

...

> > 'Into', 'as_raw', 'shr' and 'shl' *are not* the reserved words in Rust.
> > Rust makes difference between upper and lower cases and doesn't break
> > build if you do:
> >
> >         let blue = 1;
> >         let BLUE = 2;
> >
> > So the bitfields should.
> 
> We can solve this case if we break the Rust naming conventions for
> constants and keep the original case for the field, e.g. `blue_SHIFT`
> and `BLUE_SHIFT`.

Or like C++ handles static methods: Rgb::SHIFT(blue)

> But again, by convention fields should all be snake_case or it would
> look weird in Rust code.

I'm pretty sure that for such a basic data structure people will
eventually find a case that will overweight the convention.

> >> The user simply learns not to use reserved words, and the compiler enforces
> >> this clearly. The same applies here.
> >
> > Most likely he will learn not to use this API at all. The worst thing about
> > those 'reserved' words is that the set of them is not definite and will
> > constantly grow.
> >
> > I'm trying to say that this approach is not scalable. If a random client
> > gives name 'invert' to one of his fields, and you'll need to implement a
> > method inverting bits, what are you going to do?
> 
> Bitfields are limited to a _get, a _set, and an _update methods (and
> possibly try_ variants for the last two). If an `invert` method needs to
> be implemented, it can be done on top of _update which takes a closure.
> So I am pretty confident we won't need to extend the API beyond these
> (famous last words).
 
Not sure I understand this. You already have into(), shr(), shl() and
others. By the way, maybe again follow C++ style, like:
        
        my_bitfield.shr         // field
        my_bitfield.shr()       // method

> >> > Again, this all is relevant for a basic generic data structure. If we
> >> > consider it a supporting layer for the registers, everything is totally
> >> > fine. In that case, we should just give it a more specific name, and
> >> > probably place in an different directory, closer to IO APIs.
> >> 
> >> The Bitfield macro is very much required for non-register use cases too.
> >
> > Then let's implement it better. Can you comment why the suggested API
> > doesn't work for you?
> >
> >         color.set(blue, 10);
> >         color.get(blue);
> >
> > I think it should solve the problem with name clashing.
> 
> That syntax cannot be implemented as it is written. What type is `blue` here?

'blue' has no type because it is not a variable but keyword. We do
such things in C all the time:

        DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
                    ^^^^^
                    keyword that becomes a part of cleanup function name

And in another email I seemingly do similar thing for python_init!()
macro in rust to pick the right constructor.

> The closest we could get would be a macro, that would look like
> 
>     bitfield_set!(color, blue, 10);
> 
> And beyond the scenes it would call some more intricate (and unsightly)
> machinery. I'd rather define the constraints clearly for users - they
> are not so drastic.
 
But that would not be chainable, I guess. I recall, Joel said it's an
important feature for some reason.

> > Can you share more about the other potential users?
> 
> I know Joel is using bitfield for page table structures, but there are
> of course many others. Basically any structure with fields defined as a
> subset of its bits is a candidate. Registers just happen to be bitfields
> with extra properties for I/O.

OK. Can I take a look at how bitfields are used there?

Thanks,
Yury
