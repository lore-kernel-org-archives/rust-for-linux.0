Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021136.outbound.protection.outlook.com [52.101.100.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD48C1F
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771066248; cv=fail; b=FYPHIwtuIcHQBWiWA4CfuA10L+5AlqAvGz1ogBU6zhkimT4IFlSAZeNnCvahEyK9gymmRAMuQEwUB3DEYkdxqQ5Fo1xHrlusdEK8TTUreDpG0+SuuG/zwGPqm9AxfaXSgfAT4Hu2S2MFzZb9+ZmcVTwc/ROpMvt/YmhbYmSujmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771066248; c=relaxed/simple;
	bh=iTMeiMuC63abP2AkjsAmYtV1tA0PsuHN1UcGnQBI09s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=QYaYw5BWbBXQOZ7hTUFbwCEzbKbqFVjcNrXJgUFqnZpj9SnDRJb/0ToZsfSIa7Yqbgz/xGZmiWOv+Cd93/2kBSX2FShR59auo6RjjHGZX6sGMErZ36/WLZqTZULqBoXPc1EhTtREXfO1bhTXIqkDdrnscc2UipdxMpnOLH2W7qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=D6h6xcL4; arc=fail smtp.client-ip=52.101.100.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="D6h6xcL4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTLtFCyEjHwSq4HLGM7qiXFPdlAkGFESry5ie4EmbzA4yDPa/CN5fk1n3eDxGQL+54uIXF8+/B8mOHUPzdK9uNDVxSbQ5zPPMWgWjaLIUMAXgBJq41q4glaEt8oLJVxGSlzij70SIHe7xAapJrAI5al3SGGuQjmJHyHWXEVWuDsfD7ncBioPkIoJPuCz2idpgA+e5hHIvRGDgE1ZDaYE/s+PiHI5rR9rRO/gH/nT4u9E49dWoNtiDsIOYHM6jSnvGSjVWpDYzy6h2NEMpnc4cF2DjLUgJw4HlIiGsC2HMCTTxYkyvmfR1Onhe2CGPgywXoQvlGzmvNvADBvTdgOq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQTmzkZ1v9ysL2Gm76W3oO10VdyBI6hgIgqlgm75q74=;
 b=GbkxC9ByPt1Nr7RFQNFvDHNWQ1rmS0lYG5IshGwOILDfpGgbT8/iNQZKGkjcnBCmj0XRHfX0oABlrlwLcMWmpusgK+SkZG15S6iDcIMJ8yx+4EUHYj1WInuIfcOO4GwdrF3Pz74Tdue7LG7dNGFv7k5s5aS0CN3QxYuUjQJQ0sVoMv6v4eq5UoxJaeFxPbqCIgN/vD+l3UTSJP8t7flW/fcu55hPXld8BnUVZIK6VVTAebqhBrB4WzmGrszHSbozAvABY6YaerPAC2rPZnEKyU9xE4p+AIueUEAM119p7F+yNx4AodDw2CHzz/UNmg0Hdw6hNVxzUpBmwKCB3dNpog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQTmzkZ1v9ysL2Gm76W3oO10VdyBI6hgIgqlgm75q74=;
 b=D6h6xcL44xbzADQfgt7gk1VLwfD1Fpl1b1oYeVzCfIpyAIESwjPs3JP4GoA3z797nM7rOiVHBGYaB7z9JGe7BsBTbZKz79yKI0CNhWQlyvwwq4G1VGJk5mGo14ct3mnSqHPdWzZhct3wyljmRr4XZ69bNn4xDkpdwHLgt/E5EEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2911.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 10:50:44 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 10:50:44 +0000
Date: Sat, 14 Feb 2026 10:50:43 +0000
From: Gary Guo <gary@garyguo.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alexandre Courbot
 <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
In-Reply-To: <DGEM8AITP519.149B3IVELY7HA@kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <DGEM8AITP519.149B3IVELY7HA@kernel.org>
Message-ID: <1aff48c8afbd0965946dc69f5e10fb5a@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::20)
 To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2911:EE_
X-MS-Office365-Filtering-Correlation-Id: ac19fe1b-6fcd-4ccb-b4bd-08de6bb6e729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?umWjsImvslrcjcDgpjjarx1pakfXSsliSlHs8ohT7hZ6kRHj5IE/KdxpAQl+?=
 =?us-ascii?Q?AGuZKlDXQjjy/RoLY5WlL6afob2SvEFnhq5mGfv7+W15NMwuEhOINuz4W+pO?=
 =?us-ascii?Q?CxD1FgmDg8sMk5HiJ9oiQKl/zvdM9F85U1RthnNfGNzweQowOFctSLH4uebq?=
 =?us-ascii?Q?/TMPrcAlPJg5/wufhzYI0Di8+Pil1MBew9mpqD41b7WaWCptfHUMuZJyd6q7?=
 =?us-ascii?Q?8LhWxSxgGCKCFt542pmwuNKoP/uIKJpsTgHrLmrG35TS0gEFFQmfULlg3Ny8?=
 =?us-ascii?Q?UrZq6i6EyCUoOUtpSvGrV5GuS31V0qvBBz4GTUiUc5EPYkpeOFp/V5vjQKtt?=
 =?us-ascii?Q?QGVj+AO98RW34JSfs69/UISkF05jYywcNc5Kjv50faiYyM+zJS748Bb7gZek?=
 =?us-ascii?Q?MGHIdgW1JfRxgsxOv3kF0ntR1Ew75zo0QY/N1IvHNaArRjggE1P+/N4vXms0?=
 =?us-ascii?Q?cy7W0XlNob6M0Fb+DhPmVXdiohI+xqIUMjIOAay694gJ+X4ckYkWhQ81zXeJ?=
 =?us-ascii?Q?3+BQhMbZDDrD8VAj8WB8EtgI652bkI/Oc2+H01VayzW08oDYBXU3fk6CAjuy?=
 =?us-ascii?Q?R8CuNY1xngJoNTJ8qhXC9I+TOjEUCO+Ob8uZG1i+kTwr44pNMYWqL2oRp4E3?=
 =?us-ascii?Q?wLcEVM9w1tEw3L+0sgM0k2nv7/kX2dQwpzhTraP9EQhR0euzK4nqgnBniHYm?=
 =?us-ascii?Q?U59AQiL4pjdQ6XH0KsoM812Jo9OVIGonvjq99TnrSAFyHNQ918VkSarBCtZY?=
 =?us-ascii?Q?DVuSeHoojYfQGi4ayjBqv7ZhpDTi/r4KUeJ1LitWEuKFGaPxgFNET11CgheT?=
 =?us-ascii?Q?7xEHSQgip6t9DXW5xr7BGv7uaOZmRN5gupqiB1Jks2ZP8GwKU5fJOdTO2tNf?=
 =?us-ascii?Q?ghzKU8WIQG64n+EAdaA/N9CRosOzebbbiRK7+wyTc9lKFFwJps01Km+Rivxz?=
 =?us-ascii?Q?NwBOsEJe+BJxuL9ybUv0/wxkx1n18vR0z0EnmCq+k20VduGFEHHLp7MThsQx?=
 =?us-ascii?Q?FmsXdcGlYDrib2nJkw31skcCPr80XmCVblwL4iFQ3ZYU5Iizkr2rbquYevgc?=
 =?us-ascii?Q?dKA5c6lpYrEpI4oJZ76F9FrzMEZs6N/cEunVgi1bN27xkau1VTvDhMZz2Jhs?=
 =?us-ascii?Q?BPGiz5pbhDV4TUd6Rfnkj3MfHy/JM+IkhDphNMpM8cFFpWH9HE3uQzwP6Vz4?=
 =?us-ascii?Q?X8xfITbXa1tth/zCgczYwSc/SH/H4a4Vlln2cuqCCdqM8+eTIRFFFXhwrnEp?=
 =?us-ascii?Q?tZL3cnHlLz2TDETXO/K/l2p2VgDdbIFrcXr8QTINwi5lF9SkMZpAGH4M8FoJ?=
 =?us-ascii?Q?gvN6kmKiFLk7eUMr0i6fT8eCwm2RDWnWSInjHdh4GxsPnYzU5muATBPjIHg/?=
 =?us-ascii?Q?lumBG3OOn2t9XH8U7xzNxmUJI76GzJ5wmme1stQKbvL05PTlfWiduSfzMXZx?=
 =?us-ascii?Q?XUhBk4M6leWq32zbgnN70FM8NGqwVw30wvisv1oFplxlKFb9Xi5pvBx1Vaqw?=
 =?us-ascii?Q?SIvQH3AjeNbdBSarwv05CoezgZ7AcxwvgRr7nBpDtvvbpPgxnCh1Y6EZsxrx?=
 =?us-ascii?Q?Ex27NbLLpfXD6Es1CdA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vokTmEEq+gjKGuC4hG8texCvBhZ1lWQqphxSyg5FJG/ccZz52NBhPprCW+Qz?=
 =?us-ascii?Q?Gc8wznOclT3F1c5mvglA9zz1lb3yPeasIqpWA9jIWurXs/0leAZ9Bj94tJp0?=
 =?us-ascii?Q?OKAF3MoPwnnz3auBr0CAltX41p3UUS2JvZRSDR8R/kiMRgiub2o3+hu8+fv5?=
 =?us-ascii?Q?G02eZGW28/v3Od+6aVt7ETrWz79ap8SSNPqLWLH/HsJpMuk8MsSh3OZXiBfe?=
 =?us-ascii?Q?zazci4uRu/nW9DN7+E0WfZrDuuk+wxUXDqEnrdfRyK7K1lsHTPckL3DciSHe?=
 =?us-ascii?Q?ylzSoTd6j2neuhs9hkxxaScefAKw+8EtjphOdFXVHmPd6HVcnIeEpluPysti?=
 =?us-ascii?Q?OiZBnfCIeA2a0hnizOZy1IKzfsXN+e7AyS/99z35aQeMOmIApepH8po6d5OS?=
 =?us-ascii?Q?S4+9RUTE97xUnNmPfYYsaQVOqR0/jafscedC8sh7y5KhheQ6qP0d/RwtkoR2?=
 =?us-ascii?Q?5oWQTsp2eWOusXq+c21Fl+29c6omRm0Oh4D0iQ2ROHALgeLJZtG3M6LWq6Wc?=
 =?us-ascii?Q?pmcVrN6xQ+Aaop3NrRptMl7qjHBYHpX1UprN52IGdadM1V4mbodLiUsvs0LU?=
 =?us-ascii?Q?QzzU3+KnVA4uYVw1h1K/UI4gpoNNSUBurf7HRlHDspBUwnIrKZPxWxNxYzpl?=
 =?us-ascii?Q?BQxO194apjOVeZcqFh9RWdbHwGe89dwFAwTI5Y5IvdQ12sRMa3aAxRjeBQrY?=
 =?us-ascii?Q?cQQXnSW73xJEcRHKspqBRiaLgvSe3VVZ+o9r5/RMCsTfE/kthpssTwwPiGPc?=
 =?us-ascii?Q?1XGTp5ByBOSTFSyKOL2mlpcLM5W6GT6LfTgoy+hJSKOipq0fpl/nV5WAaesU?=
 =?us-ascii?Q?B2lLVlNO6/gBXzM3JVoSoUZnp4brjcIEiEYhnujMI21cTmWOa7HGi7ejS1lA?=
 =?us-ascii?Q?BCMr1FCbTvG9Wo2UY/5RTdjdqMPNSFB7eHkSk7cLwz1DsdAMqv/yPToF6Cym?=
 =?us-ascii?Q?NHndDqMya4asdyXwY+9YxYFATpt4edkLmQrNl9e0tzc2sf3D/wRhQljrss6N?=
 =?us-ascii?Q?3prt+ilX/DulP3eqOsAJ5PPIdYqFp4fuulXUI8FSEidpmPwAMWYmYbF25IGa?=
 =?us-ascii?Q?DmtXKLc3cbkNuVio/+o/vVoN6n5UBLvRZJcR7oIY4pXZnVPin3qI0aniG8kf?=
 =?us-ascii?Q?p12mgHkoI4o8ISyEiC7H1tYCsx5ArHiWni2aJmSNfbs7Wqh1AaRFufSq170f?=
 =?us-ascii?Q?ihQXVDeY+wU0Ey6MCzugAcCMQ/QCOFhR+qI/NI8oJYQX8eUvLBw00Qtssjwq?=
 =?us-ascii?Q?zPh1n7WyfKNYOJIOhCZvBrLSpYSIfnt+jRB+rEfby55K1MUCP5yNWSowf75v?=
 =?us-ascii?Q?eDMFDyHRjj/jl2pC7pMDjN/uQSrwBtGiKqt5EVc54Ct3NggTduDL4JU0NS9f?=
 =?us-ascii?Q?E0Xtttfwp2Di0+S7MmqAn4wBcE0Ilq4EqF8SUTvD8g6COe7ErjG37Y2x14wl?=
 =?us-ascii?Q?GJ8fjOq/KWurSKXyfmncnw3tJ1DGYgP8ZfZelFhcexi8qg5idCVc4dIHHhqK?=
 =?us-ascii?Q?TCBJrAEMi/fkz7uYbQdcvTbYEw5VSvLzDHxp5yReMIZk0BFUG+NmEiOnPJfs?=
 =?us-ascii?Q?fafrcHXQWMjcctFUCbBx0mqnllHxWTc/MqKN+30ZA5rKxZi6iJPBvurcaW0b?=
 =?us-ascii?Q?AOgpYTVcuua/qm8VwSS/qYGwoSGVDO4ajt/0kyYxYPh4Os9K9Zi47a2t8AOx?=
 =?us-ascii?Q?iROu6iJyG8Cs4qGaqzHNxbEfITFHY/d/GxYS30a2VpkdXBGmRixXpVYl0PEh?=
 =?us-ascii?Q?2Q0+9zCpGw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ac19fe1b-6fcd-4ccb-b4bd-08de6bb6e729
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 10:50:44.0366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLiZluUm6AXy6/9Ke/sw0MpJGv1IesM0t42DDt3Ahe9Jdgm/jz55tew1G/pgG3wq/rx46Hm7KzU4DWDIzLvypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2911

On 2026-02-14 10:33, Danilo Krummrich wrote:
> On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
>>   rust: dma: generalize `dma_{read,write}` macro
>>   gpu: nova-core: convert to use new `dma_write!` syntax
>>   rust: dma: remove old dma_{read,write} macro compatibility syntax
> 
> As we treat soundness holes as bugs, I think it is easier to just 
> squash those
> into a single commit and stick a Fixes: tag on it.

I put these as separate commits so it is possible for you to take first 
2 patches
if taking the 3rd and 4th patch would cause merge conflicts. My upcoming 
changes
to `dma::Coherent` would also further update the Nova-side callers (I 
guess if you're
also taking these from driver-core tree then it's not an issue).

If you think it's fine to take them via the driver-core tree without 
causing
trouble for drm-rust tree then I can squash them in next version.

Best,
Gary

> 
>>   rust: add projection infrastructure
> 
> Miguel: If you don't mind I would like to take this one through the 
> driver-core
> tree as well, as it is not only the base for this fix, but also the 
> base for the
> upcoming I/O infrastructure work.
> 
> Thanks,
> Danilo
