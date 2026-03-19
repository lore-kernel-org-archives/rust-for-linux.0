Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1E538551A
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 02:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773887066; cv=fail; b=n3EpjvFz7d7WPHy1sJJ+d/TwBhyG6irmRsRIZXmQAw/RDnWNraTraIxAFVkP4ZKS3A1f1K6/Y7j7bWuQjRoqqUedqKRZj3aLfucIAt4FC/owJMmgSAZeNBq4qErRaK3kirwVLsXi+7zokKyUoXBWRR/xz7eG5BvVEAY2v5aK5sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773887066; c=relaxed/simple;
	bh=oMwNlWDZ8K+L0yFim5l2wPDnmyVg8hDRWPgI3Dg9uvI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=a7bA2AHKPne1YygxG/2mBWE3eFGc6SKdM4yzeZwWIEkxcwkpln4YaOIJzaIo3p1qomSfb1QPCwSnpf0a/txktUlzCYG2rLKxQlMhqSJZEZ0YN2qWjIUKSPYJDKyV4FIhiDYCKbg8i9CYYR84vBbjb7kcOfaLDZtdwlxcNNi8ELU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mrrOSJa1; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mrrOSJa1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyRy6nyNmXLzoFTqr9It17/khJRJ93XMhCfieqIyiVk7u0akwHnyG0ZLzC6TQ0l8Wj62Ui9d8A0GpzYlix61tmekjrJusARCSHENHdY8u45S9EZ4gXGxqfCaN3iwSSvFjpFuNJuTBrmKFwHEsvJuKQ0wNfTwzz5E0Oyb0mufJrc1FlCbNgCOyKdf3G7kCN+52+J71pylbqqfJ1Cm2zCVr4G11S2wJMs2n0k6eXXHPXEyb1zmWbpkPL3uUl4TCHf2hqJHwCMTXeBhX2zKyJia7QUBkh7Ndf+A2WTtMFd9zN4YlKT90iZ9dL1TQR4zBbMldtxCb8glI8ZNMHX41Qbfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VthTXA3Pl1PVauEUPCCWbEd7ljiQWSfx1hQN45BHIg8=;
 b=wpJ3uIsdQanFtvlOX57X7BMYe11t9Kq/ihOUSFwQKxODnAjR8/ksulT5sjqPXxLXDMfeBQP9ogl+1ZaB8UzQ/JQ5/T0dA0euY6l8AWidsEeRdlEvIkTbwi2XaBmkRMhtwiLjcnjKbOs24c+mzDKm6wlhg180cmo5H5K9p/lGV3Jxj+S/ESEk8q/VZgKPDDrMAWf2JKnlIO42/gIb0CKnglschE/p00XxG9WmouKhdpHP4lt5rh6pvL1QFFpjJvLxMu62f/HXw2CFXtAStrMBQTAMCtMactBayoHYlXQ0BlP4NINmnqEtZbcdhrchj/V4t9si3AnwpuuirzoJSC4EAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VthTXA3Pl1PVauEUPCCWbEd7ljiQWSfx1hQN45BHIg8=;
 b=mrrOSJa1teTpclrdZOaW2BHsV+x2EKWayR7K5okBxyWlN8qniJuwmzNnG4j7MfUF0UZsGl+d8V092Vk1R1vGqNf4N4fc5iPUwkxCZrmh42WMkBeIQvsRXGBaP2bcbuKt27UDSAR0ObtmAh+uOQckY69IZ6MBsZ7Nr3xa1KyoQvLwFZd5VJvHF0FajZtf1374nQ+oTU8gH1S0MzK/kbEr7QS92fMJS88xGdaAq3YTuHZ9nlmIydI9hBvvG893bD5fwzjziZwclNkIj1q5rqSFsvnHqZv4PO4uCJhor9Xb0u/7ngVgsIqkmFYB1PfJlZbIbRING5sze1b0/2JDh5xRdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 02:24:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 02:24:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 11:24:18 +0900
Message-Id: <DH6EHCK2R001.3E7Y7WELEPW01@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>,
 <mmaurer@google.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v10 4/6] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260317235403.1094713-1-ttabi@nvidia.com>
 <20260317235403.1094713-5-ttabi@nvidia.com>
In-Reply-To: <20260317235403.1094713-5-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0329.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d218db-4442-4e2a-c7ec-08de855ea13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RuWjOvCYRTaULp0vb7xZb67VIoLdz0liGDgBF/w/pCmzZ5Kb4PYFG9i966P9LFk5+lunMFgTWzgZs/ETK0t+SMRKUregU5auYibA+M6S962uHFxJ+X7Aoq7qAdHYjmCuUdq6EoHWlq1XEnzMfW8sAdEm/B+5gZl+WpVkDo2AUXUFgQ0vQb8jftmS9oY51fsAxw5lgnsUA3O1FFYKkbQTkKr+cxeb0A6PRbtOuXREGTYnfH3KEVWLV1B27RbVh6VVgLcBe3HaFJisMr/3+VJGUW2DwTHBTNhbkiXc5ZPMsbNoYEMrIG+a50tUSyEOoGeYqUzILA75HmD/H1CcgO/TQQ2y0hi0xQtKaYAVapoMXSbPUaZmRZsQEeMgvIwOiz2Y6vOK8v3q7HrbsXwHWqm9h+EBAUV3RJVvzqKxWE0CI2hDDByZ4BUCnyDZNbNyHl7544oKut6GZekR5rR8bmtX8wtuNSbLHQ2kAzU7VyVvVvsn2djhCF/AohidD0kCzkGR8j8tof13m4SMgKT9a0nFdgjqUQWf/6R8/D9ZgelDAzdPrR/XDBonLChrvVCvkne5Elq2r7hBnggcM04WKE/OAXtvVhhA4xknPnm4tfS6TpOfyKmvGGd6AOlJGsfBCP22j+vYwkdGHMnrYf0vlYNlSZRT6ZET/3vrw1J4af2oj7TBxDX8bzVEXi/vnhqvjKVMbq3Ud3CUf+2zAgvsuqhMa5NIEoQOXSWy2J5FlRfo5lE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHdFd2U3bFM1M25UWlB6VFd3d2RoZjVUemVkU0JjaEdEK1RxM1F1dThWd3RD?=
 =?utf-8?B?ZEdOR2oxa3F0NHAxeHpEZG1GSjhVM3VnYTdiVHhpbXpqODRmNzl6RUxnbVRO?=
 =?utf-8?B?M0x3MWthNGFqVHZHV2VLVkxEemoyNmtyT2E4ZDlJS3l1L2p1cGFWU2t5OVZy?=
 =?utf-8?B?cWRMeXlVOFVBK1Avb1Zzcmd5L0ozM2paVmJ0ZWJsczJnLzluRHBqZlJ0U3By?=
 =?utf-8?B?elVlRTV5TjhXdWZSYXRuVWRXREVBc1lYMVhIY3hZK2NyVUNNbEswTmg5dW9h?=
 =?utf-8?B?QW9VMU5jeXlGYkpEKzZLMzV2ZFFES2xMYkVpMzc5cGFDdUJIaGptV3ZxVWJY?=
 =?utf-8?B?VFptNUJoczR5YVlQcjM2T2xzVHhYZ3hYcldKTFhVMkpXNnpoOGRBVThqU3Yz?=
 =?utf-8?B?dnRSWG91OXBDeDN3UHFZanQ3ZFRaUEg5ZWdYZUNqcDdDcGw3M3dqT3RRL3JM?=
 =?utf-8?B?LzNmMVBpSjRMY0NFaDFJMFNTOTRhdVY3TXhKR3lKa0orR1hiSlRzR2taOGJj?=
 =?utf-8?B?cWsxYnFTM1piazRSajlaTDJaYStXU01qMVU2MWNzZSs2RDRiSVR1ZHNsbHlw?=
 =?utf-8?B?UVc4RTRMb1RqL3dzNXVJM1M3M3JGRnBRS1Brdi94WGlPdExWdUhqNW42L2RX?=
 =?utf-8?B?bFVZc2EzTzVNYUpsYU8xSHZJRWU5M1JlczdIek9lV2NIbG9YUVhuc1Y3ZzRK?=
 =?utf-8?B?ZHYrcGs1eG1Ucm0vdkJ1SnkrUDF2eXd1bUJHQWkxMmVldDVGSHdjWFBhdGJC?=
 =?utf-8?B?NmdVNDRnQVFTOVg5YnlqcDR6SUVMQ3VvczVsSVpYUU40c0JVMktNdU42UnBW?=
 =?utf-8?B?TWRmVDhXZ3NWWWZTZkMwTE1BYW9zUlM2dVF6c0MxN1l2cWt2TGhERzVLSDZr?=
 =?utf-8?B?OEViS0VXdEhQdm16aWNRY0lDc24xVVNKS2x2b3FPVi9rL2RqZnlBbHJvb1JR?=
 =?utf-8?B?aStkeW5LcG1nN2grNmNnYVRLeW5oekhST284NDBhcm1LcE1KMUR5dC9yY044?=
 =?utf-8?B?VHBPNkhESXZ4ZGxUUVh6b3grNFRKT1JPaTVFTGVudkZUSUNYVkpuWDNnSW43?=
 =?utf-8?B?RGZyVFNKcWlEbUQrRSt1RVM2NjBMMUR6N24ySWRaczVLWENYZnY5RjZoeXdQ?=
 =?utf-8?B?TUMyZkpyVU5qaGtzR0pVME82MkFSVTZ6enJHc1R0aHNaakJQSkkvbitROWhs?=
 =?utf-8?B?UDFCR2NkL2gyd2hId1Nobm1aTWJmektHa1VVYkplc0lTUHY4YnhRbVBtQ2lZ?=
 =?utf-8?B?Q1locWhCUmFieVJYVldnaml1dXdNLytwRlBnTmEyZndiZGIyQmhOMFVvR0sx?=
 =?utf-8?B?YmlQU2c1NHVrSFBtdWlYbGNRUjdFdW1KMm5UM3hybUpQNFBQRFZUckthRHJj?=
 =?utf-8?B?SU52SlF4VkExRW1HWVY1OGFzOGdSeWdyWHdTK1BMbGdqT0oxU0NVc0FSZ0hm?=
 =?utf-8?B?dlBpcTRkTHBnZFlJWlRpSDlDb1RFbG55bUd5UnE3cEVyVkpCYjRUREpTSGQz?=
 =?utf-8?B?bkF0RlE5MkZJcXd6UnBpY0g2WjluSzdpeXJ6eVprVlc0Mk5NU01sNTR5aTlB?=
 =?utf-8?B?bWZvbDZ3UGg5d1N3NjkvY2ZpVnBUU0FiV04xeTF4d0Fob21EclVUZjdZVVBp?=
 =?utf-8?B?THZteld0SDV4bGVCUDcybjRWeUFUY0tHR09XcjFsVms5MER1ZEdtOE9hcmts?=
 =?utf-8?B?RjliVWZXZ0NwSDFDZWFlME4xRnliRWczMFJLeXR3M1o5RGNvQlBQTWJMdHlh?=
 =?utf-8?B?TGJvcGVIUFRvUk9yVGlVUkxSUWhkb0dTSU5uMCtzMVhHOEpkYVZwb1VwMzVF?=
 =?utf-8?B?L0g1VXlJMC9nZ3JqazM4bzJQOStkUGZOUkxyTnBuMm1VMHRnRm1uTnlxTU45?=
 =?utf-8?B?V2tFaVVlbXV5QXl4dWNObUQ2emdsSlNuMEJCcjR6VDlrb1Zsb0Q1bStxYjdz?=
 =?utf-8?B?N2s3dTF5UFV5V1BUQ2srUlc3bmhGcEdQdlRleTBKUmNIWWpzZ05IYnRpS3JM?=
 =?utf-8?B?K3krZU5vTDhnbENkSlQ1M0p3K2FlNm9PSnlWQzN6S2dVblo3cW53MkU2a3Nk?=
 =?utf-8?B?dTRhZFNqdzdWZExHK0V6WTFxYjc1M1RoZDBSOFNpRXNvQTd6RHh3VFc0MXk1?=
 =?utf-8?B?VDVEMXlUanFaS3ZGQmN2VnMwazdyeHQrUGdYVm9CakMxZVVBb1dMdzk4eHZQ?=
 =?utf-8?B?SUNqYWpKc1oxNzBycmthRzUvYTVXL0ZKajZqSkVFRmVNNVMySXUxWVpCVTFn?=
 =?utf-8?B?dExQb0xENzluSVlsbjRNSG1OVkxub25HSVRqKy9uUDgvS0FPdDV2RHdoc0I4?=
 =?utf-8?B?cm9VS0o0UnZ4UEU4WG1qclRRZXZySEdiS25jN2dIb1RRdjNqWDBUcE5IZDFY?=
 =?utf-8?Q?ognnLRimz2zEHziuqOcw3cuuw15PfbDT845w4QSgKsFZq?=
X-MS-Exchange-AntiSpam-MessageData-1: Py8aGLoO9q18lw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d218db-4442-4e2a-c7ec-08de855ea13e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 02:24:21.3367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsnS143gcJJ8kL2A7UEwbJFPWjT46SxIXQgBKWWQKZsfI7iIokvLSygWTPY7556cyfCmdU/AjEEQTAHBYc9A3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180

On Wed Mar 18, 2026 at 8:54 AM JST, Timur Tabi wrote:
> Replace the module_pci_driver! macro with an explicit module
> initialization using the standard module! macro and InPlaceModule
> trait implementation.  No functional change intended, with the
> exception that the driver now prints a message when loaded.
>
> This change is necessary so that we can create a top-level "nova_core"
> debugfs entry when the driver is loaded.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Tested-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
