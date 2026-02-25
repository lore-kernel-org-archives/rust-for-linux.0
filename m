Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79CE3EF0A2;
	Wed, 25 Feb 2026 19:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048667; cv=fail; b=HV2xgDqvs6GkFbmBb7aEzLc1DzlgxZ4+ZwJlCDTzkR+RSQeS9n7jaqc8qy/qUQXHkdDUSoIGwSjk70vdM5xK1x6Rh0g0l95zsG2BWaxHPmeceMBRbmMw010irNixQcdjLUDR/Hydpgxf8a0jJ3jJJWfNobwK7YToWE+M8lfV0fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048667; c=relaxed/simple;
	bh=haEFPu4UmEjBkSyYRkLlLP9rr3104T2PweLbt7CqI2k=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azgnYP9O+ZfeOLdvlr7VgwUh7+/0xkyfkRxQKx+xS8nRL2azLYukprtV4hkL6UG4g493pht6xlhPN9wS430u/10s/ly3AFpgYNS0fZSOe4s5n1tWErzPcAp+w4k6y5nSFKbwGV5Cb6qk41pV2hjSBDKcQ2tj0aHI8Jluf4VkmpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WH6VgdPT; arc=fail smtp.client-ip=52.101.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WH6VgdPT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6mqqn8cRf9R3L4dK9H9mDqpUsAmc/CA5YKrcTld+USRnQdXi9MxfRkL8vwQFF+8MxE5ENpdFgCG6YvKaR31pwnAq3yzctnX/DeMugOBjhuwtFGCfm+Vg1Y9OHvthhnfAx1iIFl/PlUnLMmG+IELzBKDiQNS+DVyDJyyJHvI270ccZIz3016v3ueQM0nPP/N/H66aJ2YnTlPmfLKFLe2ihqwwheXhFgh3Ikr4sYuhzyTj9kYbfE/ApAGAR0TSNSuCw8xYaVM+tKGD1Kmgp8Q98V19saTgIv2YIXNwAhZwaXxkM9x8Y6TrNh3/fTUvIf58K2S3FL9kQO5tTAtygCtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEdL63KlyiqDC69u7AKO++bshT5YaAN1nnYdjc0Rbk0=;
 b=fastwF3ruOG3Cip3ezg50qJ4kvrn+ElKX7o9ZciYSofepSC3Bo2xMyW3AHeuM3/HY8Z3hcodLPaWY3cJJuV+PEzxj9SM+LrsoX4AhcYvull45fpcQrzoj0OJnif+GyzSmuFTQ2xKDs7wh34N47PgL16+KBtaoxdT19ZpK5djxyg8+BAiwAaQ/ZBnl35Ge179Td/JMYbUwpCXcFAtwNBXv0sTeTXQWnVUwIU7LPIwPG4eRUy+GGVemHW0itezGWQqJ1rjlfoMEnSCWkI5SRjlrYzCdfdgQeF1oJF3npazK/w6bSMd2L+Nx9WvwPpDUbAmYF8q0xII9z2URyruCqA+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEdL63KlyiqDC69u7AKO++bshT5YaAN1nnYdjc0Rbk0=;
 b=WH6VgdPTmnKtBAFKvsKJR81bRv2JHIxTaJHE6Os82zYZZGaKqchnln8JA2W9gjsDRitVNJCTYIT/+be3EYCAZz6j4oUIcO4mX1HOUbZIpGaUzxgvn2dV7YPGHYHJzRdzUB9G5wED/FpRqOaELlRcllbwLXINi84B+sWj0gJRAzpBTLIb7Yv3b386QGdxqYFx5XR4R41AySiIW8so3eHmJHTZLkuEQnal3wHkfeAgEsgUB2pehhzK3TYX8U1ijxea0Mww4Ba5rx7qEwHA6DLCS17Mq0j5LSG5I8Pq+0tQbytAdFOBy8H4v5vQNigTVObXaVwf/WWunMyVgrH2azQy3Q==
Received: from DS7PR03CA0201.namprd03.prod.outlook.com (2603:10b6:5:3b6::26)
 by IA1PR12MB9738.namprd12.prod.outlook.com (2603:10b6:208:465::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 19:44:18 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::1d) by DS7PR03CA0201.outlook.office365.com
 (2603:10b6:5:3b6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Wed,
 25 Feb 2026 19:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 19:44:18 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 11:43:50 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 11:43:49 -0800
Received: from inno-dell (10.127.8.10) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 11:43:45 -0800
Date: Wed, 25 Feb 2026 21:43:41 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, Gary Guo
	<gary@garyguo.net>, <nouveau@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: make `Cmdq` a pinned type
Message-ID: <20260225214341.42e4f885@inno-dell>
In-Reply-To: <20260225-cmdq-locking-v1-3-bbf6b4156706@nvidia.com>
References: <20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com>
	<20260225-cmdq-locking-v1-3-bbf6b4156706@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|IA1PR12MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: fcaafe31-c931-463b-b712-08de74a643f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	qEGbweBIaZkAWXwvpMH3Gh3cmCxnyqx+jbYDoeoqARsO2tBwYT2nx8ktRC0OS2oE0T5jizfimdUaR42rlGT7htGdrkNN/VLKz110B0mCdZ8uQX4tjrQDFzYWIF2loBx33bLvQSEi/3IJA2MAuN8vMX/j5uSnsVkWXuis/sNY33TXUado4YZPvt/1X78f6wWiCd4KztT8zSC2gEbGn3wvWq0IAi/rg2/KduYHXuQvEqZKxJbUk8ghXDeSis3MXTJewlAW3nfGERL3dITwuxb/ae1+J5pidXXOvgM3pAoYW1ENqH2QN2elsmXRe/W6HtDaQyWTkJsLXuRTFuqL6wThN78cvqqnu4UsHdJet9RZoj9SeRQkfimmjzyWNuWKcJpkhqNV4QydNowvH6As0DndoWxNhgW7KutriKxq7LccwQtQNcN9D7FW9dGl8QeMZWDCYymTB5WBv62tlzB41qWhJ83aAPtjGiBzbkctmxcV1BiyITAIrq/gw24524WwoVx7ngB9mi0VDXzjj8Sot8o/IG6ZX5ZueCXAnzdFNuJG8GF39Xgdlq6nEe83sVE6G9//aouk4yzlaO/ra5jA8KbhBICv1PiWEzlDlCWPRP+cjgFp5h+P0YADcL4LOxtFYbAiRF3W6UF3piwRr8/Gx5Ee4feYMq/re119QYbXILNyQtWkzCtbvbo4FXmi9mMEmGvohHDhB+1W67CZqeAcj7DcEYlVh/A6TiFZrFWGmYkNpQElg7VJbNR4c86qJOmhmVLNpgT4VodujwMBFCs/b8QO2t71wso5s8ObO50dGMtqwEAEHIwB6kBxCxCeJyDQBiC9Pnhb49lbe4SVvu5EyVBm3Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PagXgarFozPUR1VedguS2U+Pben3dwglpmOO1h8nLvDN6spyl0Pp9adGk6rRCAEQYu3GWsAyWBBQSXnM+zlPn8tT7KIdgh8AiFfK18/CjWyMErbiW398+TKF34bWYSTNOuYGPEmmmNyLr/OPq8DX2Q2uzfFW1PvjNmo006d6SS3i3zR0ygUh3ycCeXrcJuFY1IyPLxpEoj2b5GccNo1kAOspTq+MKQ6N3cWHfhG4gUm2rvWphteZ1wuy1oUY9mh2W2gYSjLCuDq9VWGhkjJ5iLGXVe84Mn7FsEFflAFYFk0ulBAHXurlsnDqfoNFVaUpmdM7dS/Fe4WvOWCOG2LiWLAjOKUj8sIe30IOwuna1rvajmN+EsNrDktaqSqdlt74HX2QWM8O2ZbC4XvNrryGweFgwVRpDmtRGcHz8MWVj62C9slYrJVDqCyCi2n3eqPx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:44:18.5244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcaafe31-c931-463b-b712-08de74a643f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9738

On Wed, 25 Feb 2026 22:41:50 +0900
Eliot Courtney <ecourtney@nvidia.com> wrote:

Looks good to me.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Make `Cmdq` a pinned type. This is needed to use Mutex, which is
> needed to add locking to `Cmdq`.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs      | 5 +++--
>  drivers/gpu/nova-core/gsp/cmdq.rs | 9 ++++-----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp.rs
> b/drivers/gpu/nova-core/gsp.rs index 174feaca0a6b..a6f3918c20b1 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -112,6 +112,7 @@ pub(crate) struct Gsp {
>      /// RM log buffer.
>      logrm: LogBuffer,
>      /// Command queue.
> +    #[pin]
>      pub(crate) cmdq: Cmdq,
>      /// RM arguments.
>      rmargs: CoherentAllocation<GspArgumentsPadded>,
> @@ -132,7 +133,7 @@ pub(crate) fn new(pdev:
> &pci::Device<device::Bound>) -> impl PinInit<Self, Error loginit:
> LogBuffer::new(dev)?, logintr: LogBuffer::new(dev)?,
>                  logrm: LogBuffer::new(dev)?,
> -                cmdq: Cmdq::new(dev)?,
> +                cmdq <- Cmdq::new(dev),
>                  rmargs:
> CoherentAllocation::<GspArgumentsPadded>::alloc_coherent( dev,
>                      1,
> @@ -149,7 +150,7 @@ pub(crate) fn new(pdev:
> &pci::Device<device::Bound>) -> impl PinInit<Self, Error libos[1] =
> LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0) )?;
>                      dma_write!(libos[2] =
> LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
> -                    dma_write!(rmargs[0].inner =
> fw::GspArgumentsCached::new(cmdq))?;
> +                    dma_write!(rmargs[0].inner =
> fw::GspArgumentsCached::new(&cmdq))?; dma_write!(libos[3] =
> LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?; },
>              }))
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs
> b/drivers/gpu/nova-core/gsp/cmdq.rs index e1ca1bb9e07d..44c3e960c965
> 100644 --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -474,6 +474,7 @@ pub(crate) fn command_size<M>(command: &M) ->
> usize ///
>  /// Provides the ability to send commands and receive messages from
> the GSP using a shared memory /// area.
> +#[pin_data]
>  pub(crate) struct Cmdq {
>      /// Device this command queue belongs to.
>      dev: ARef<device::Device>,
> @@ -501,13 +502,11 @@ impl Cmdq {
>      pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >>
> GSP_PAGE_SHIFT; 
>      /// Creates a new command queue for `dev`.
> -    pub(crate) fn new(dev: &device::Device<device::Bound>) ->
> Result<Cmdq> {
> -        let gsp_mem = DmaGspMem::new(dev)?;
> -
> -        Ok(Cmdq {
> +    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl
> PinInit<Self, Error> + '_ {
> +        try_pin_init!(Self {
> +            gsp_mem: DmaGspMem::new(dev)?,
>              dev: dev.into(),
>              seq: 0,
> -            gsp_mem,
>          })
>      }
>  
> 

