Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73673FBEA5;
	Mon, 29 Jun 2026 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743271; cv=fail; b=FAjRrcWfD7Srn1hHTFezKRBTxD6guRws3uHxgvNyBueUB0nHUxJUXRnrho2awM/arhjDwMuYkBxuSUJFwRHTYsZZU+pdNpVXi2omfAiiE896hslEjgF1ZmYYB/9WUm9bZENE7msPo7/+3mrP0wXoyEu8yB1Uy4xGE2nIVYd/A5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743271; c=relaxed/simple;
	bh=JEdz6eg36hZ1Ve49aKNiZ/Wt7o2au/2pl8PvQDpSbRQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZyKaTf8Je3ggNzDervF6kjU2R8unC9m9ne8PGXPYYWaT7RzCdLRhFXVKIzet0dkm1NsYUesfWqZSssND+QtnxhqPUsnLIRSUqozVN/zbxmw+REo7cAEYskIeMqc5vBqgyZKhdgQ6LD1+OIK3vZ59biphRB4QT+8Nvc2P6w5uyAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i/BDRNmh; arc=fail smtp.client-ip=52.101.52.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i/BDRNmh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkgjPqrkegHWDZWJSSyG4YHK3ZAI9yWng8pB0mmkxjY4L5pmF2X2THpumUcriXq9OWzUp7fNfwKQv925ATcJ9qUwdWsZMDp5p9cekKDrItWGFV4W8s+Mv5KN2I5enofH1a9qHWnfHluwFX99LQ+DxOFMSii2bFcqtZzkZ0KdHJP3x+rAI7dQFIlNDBnN/dpioKOuPNicvDrKX/OlkwcyxdsftG9lasi7ZM0e86kPQxSDmDl9CwWqRfZx59mmK9Xx+uERIwSEC4bClC3iOV6nsIGFvSuRfDWjVwP5TRE32QI7t/aebpP8WElgDp2Lq/EaXxU1f9q5xAZ45DwOaNr6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7/DJ2SVojtCSKVBujVCcuMr6W0vTKYg5l4+HH0+VMk=;
 b=E/Q6G+FCkkdkSrAzB6NuWy2S8bwk18T6Sw5Wqfa0tfL17w2gtto9ATBRES5+cusyKZKo1KUhE7JC/kng7cOioX7GIxlTXD6KUPPcerBCalhkTeSSXFuAN2JUMf3vb1DBX6nBmBm/cfjsjljwuU79doJTZHzMQYWMOed+GTmoDNFsWWjwvNnoz76unGD14LNYuuVSs4yWvQfcdwMh6tI2rX5sD4Pbtb3JpaXQl/W57xffgE1E7bmg9XVAuZcwTvowGK/OlvdwHlQqLZacNilAR73IB9ZLtU4GnfqL1r1rhYBlmeBhT+fbM0wEUVDSlhixg5RHM448tOUITSWMKI27Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7/DJ2SVojtCSKVBujVCcuMr6W0vTKYg5l4+HH0+VMk=;
 b=i/BDRNmhdZfzUOjY2F7Gvcd1juH6rFUaR6YeLMaI6B69hc0lM5XQxUR2chWNdTAxIt/1gjd7U3A8jdh4f2G+I7n0s3U52TutqF861OK5pkLihXVGEAINe7HTOYUGvg9wbfarWsuHTfgLTwEm3wg9jjCBag3JH5DT12smVFX5s81tExn4jz3Jy2v8+LnXyYfcS3Xms/wIuVb2icg2iJ3gOyOfWA6YRYQzPpRogod2KMLLZYV2rugehWyE887g9oJG23/7Lbl0SJ+/9yun0XUB/VE0Ao3dc3S6WQQfeyqJqUw59kMX5IUiwmpAWVUbCxCyJ9aOVejOo9/ldAbjcfFrMA==
Received: from BLAPR05CA0042.namprd05.prod.outlook.com (2603:10b6:208:335::22)
 by PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:27:39 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::93) by BLAPR05CA0042.outlook.office365.com
 (2603:10b6:208:335::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 14:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 14:27:39 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 07:27:23 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Jun 2026 07:27:23 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Jun 2026 07:27:17 -0700
Date: Mon, 29 Jun 2026 17:27:14 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jgg@nvidia.com>, <dave.jiang@intel.com>, <saeedm@nvidia.com>,
	<jic23@kernel.org>, <gary@garyguo.net>, <joelagnelf@nvidia.com>,
	<aliceryhl@google.com>, <kwilczynski@kernel.org>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <acourbot@nvidia.com>,
	<jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
Subject: Re: [PATCH v5 0/1] rust: introduce abstractions for fwctl
Message-ID: <20260629172714.23433d7c@inno-dell>
In-Reply-To: <DJLJ3UNHDAU3.14K32FFFAHY8A@kernel.org>
References: <20260629103946.3117152-1-zhiw@nvidia.com>
	<DJLJ3UNHDAU3.14K32FFFAHY8A@kernel.org>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 862a848f-1392-4b16-8420-08ded5ea92c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Jb9mVYCrpBQbHGrTG5TkeROMNeljqjVHI+/VcUIZ+Rv+WrMbW3UafdfRb226JeI6ajlPNCQycmKbIYynTeCS1B7b6lJ24mrKi/8OLi3cXJXn19Owl3oyFHG9VNnAqnb2YOF8gfR8IYt2oHosHpfjf3zdkylaxXFTDvKPCiEghwplRlF0Wg00v84PNaksWOGmgoREjMGwq5xs/NqkejmHSJ/Cxm/whKm70utpzIZg7AZi73MbohMjK2kD+J6rz1yc7UlmvTrQcm9eOc6Uk5XLdq7ezKXadxkCnjppnoF0Nga8T9pRwoq9R2Z4cEWhEwI2WrO+tYFCEUDRQvWK/pWE2FfmnIXiVnfDK8p+QEjIlkq8oX/acv2iDTkLSWrEpwarwBh3sHPKxPiWxhr0ueyubDzbhe1Cl4wCC4tuD80nQejvWTAsTKsQ9EYMFExGSAtc8VT+SQsywob+mzOW71zmVtc40AcyutsFboQcwd3QSMMDEgNbl2IeaIBJh2lwplStKDX2RHJzs+Owd+UpQQbkuyInUvp/DGzZcg5ZQTj97ITvBitFxWc/c1npXfJLXVk66Bp0iNXSCBvqqCfWORU8tKuB+3mv7kMA05Aj4TFpWbhbKHvLhGYupcHHI48RjJD81zipLnEgWAwRxxOQIfIodZfRSBrGCBmZOxyUBw/ltMLWQZ6+r8DGMlNEdHz2+t53Uiu7KWH5L2yhcXDiGLof8Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hQaaLGdGic+v5RpmkaTTEZ/0UN/VzELZ+Huti+02Hukifq2NWcNFcnLzSJO1EhJmv5fAFuxFQ0oJIiKX7E628ZBjFmfA716bgURC76jSqvxlhfJAJ4x8GxJM5rQzC0W89rDEdgoT2KTOFonDASNA+MrYXaLByDXtYPZzJBTYtVvw4NePxzI3TlZJRdCN2GbP6ih8+7VL5CesZCZ+ioqPl0pNETsE4gWuxnvN+9577l7AEp+VLkQJaU+DW0XExi0qkmkHWekh4RpQeTypw7on57oF/CINX8Rbkt+lgVQY7hg+yj4+VKVO9jbtxBumYxfO1ThLLlEVo7clH1WsM66nKX9O+uDiiiywdtNdNOZoBNGjHzn6aTK7FMwqvecIljp/CzFz1DJtMlmJenaPadJo9f3K8MzMaWjPJmu29Ibv/V6MFvya1XtSrLMpTPvDbSRo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:27:39.3133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 862a848f-1392-4b16-8420-08ded5ea92c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819

On Mon, 29 Jun 2026 14:23:42 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Jun 29, 2026 at 12:39 PM CEST, Zhi Wang wrote:
> > - Adopt Danilo's higher-ranked lifetime model for callback-visible
> >   registration data.
> 
> Thanks! Have you seen my subsequent reply in [1], which achieves the
> same thing without requiring ForLt, but uses a GAT lifetime instead?

Ah. Sorry, I missed it. Let me re-spin it. Do you mind if I put a
Co-developed-by tag in the patch? since for Lt and GAT idea are mostly
from you. :)

Z.
