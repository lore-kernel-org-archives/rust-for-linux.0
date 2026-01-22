Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F24B1E1DF0;
	Thu, 22 Jan 2026 03:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052385; cv=fail; b=kisRutZMui2I6Shw6IxQVSNs+/HC9gQLneVQNxFy9sX5lhF87PT9K+qJ0YIT0fO8XuMooOf1IJRJ8uZRmUo74BLvCuydNzUF3kl/SVDrwzYpKynph+8wTkzjlFGMSzvuXnljKI3KHbc0a8s89VdMkN032Nf8g6en0WjzhsFdxV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052385; c=relaxed/simple;
	bh=C73hI31vvL+JXzuAJv82sWuJ8S+SPogMZlx8CeRV8Yo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fjkesEzskVUJa2Z+FFr97XU/+zLTejMloqd4LtYqKSm47rC6e2pxYj3W78v1H7bGKe4ozJrUDy3f+hHPY0G6MkzyhMbK+Z+4YLHeu+a0IwWT40kgFcVEL468HTFkE+NFx3EkTlU8HqPrKRQEf/ZS7Gn7QcIz1DcegzzJIqH2ljs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S2RbbNgD; arc=fail smtp.client-ip=40.93.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S2RbbNgD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3jkEtU4nCABb99dxhqQeCyEvLRJ3SvxU51Y+n+SdkXl6gtK6076bR+Pb8bUKl3FWS0QvN25vzI0/d3Jn4eCPMjsmiyZAemXXhP55yuCXF7trmnTP3tmxvoRa78XgV/FDejx0qeUOnzG25sWt1NkbyrY6dfphE2dhWlDK8P2TmIwU3qbor6+KMLX8vEASCuegpm/aDzv1pmOKB2NL6KEORqSGxBxSmHHpQ2hZ4QYlH4qomQUYxztNSu+KlPKBoZ1dDbxtE3tdT8YLIZ7T0hEKAz7qxKA5D5rSW+GduDquAXEzWabjVfrPvjvUTo0DYJRrecvhAuM7p1XlOnnCZ6V/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJegxlSF2zG2x+gcoT0H1FK6d/puCPe0JRWDwruX1G0=;
 b=StyrLTyi4rc1srWfIjXdxAZebesWAQWY1b1vyIHxvDzHJY+Zrf4C8FapopsjHEGWXtxkTZ+Fq10PF7iWa6bL6Jf3E+Qx6+cxmd6vowe10kXPdM54lI1N1WTf3aRgkNauh1mr8TvEV1uHKe6WOyOzrOTQKaV5byVNZT7tEqm9637Ob+3YNqlhaZXY4J8gpOhEfpFT18zpE+zqVPP7SetRW+U6dOgim5rqPJ6dDXHSdJIA4tfAEiF9gzTGcNov3rT+4ZmUYKGWkpfZT9CWTOngq2ftjPT0MWAwxqjjp7+GNgf2PVxR7diAXPhDWJemqjLGvSb6PYacbKrtbWyLmjdTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJegxlSF2zG2x+gcoT0H1FK6d/puCPe0JRWDwruX1G0=;
 b=S2RbbNgDkhMdjr8/IcgOv0CT/5TROzGD+Z7A43hx1CMn855JlVckaPFFQNQ7WpMi5lrZGyUxKABHVKpTSUtovVQjWyTnFDJjnqXthVowj5SmDNb+EU4eCaYO7kalXvE7IcEDaLHqFQLMsXEaJmXwHAp/E7D8pIQ3QekHtOblMhEIOTXawJ/Wn730JRpkTnhcCE5eJqF8njz+X0YbTUaU+PzHCulIjFKoghgLGQfvmvS3tpmpxJMf83WvGNgUy3gEeKsgXQQyoC52AAsF7aXN7B5bNvk/SjaRZqFWyIL9h15e1bMXjv//nSf3VEfA7KkkoSu28Wo2zbEDWP1DRa2Wvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 03:26:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 03:26:20 +0000
Message-ID: <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
Date: Wed, 21 Jan 2026 19:26:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
To: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc83e10-11c6-4032-ea4c-08de596602e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VisrNC9SUTgyaU9ZdWoxT1R5L0pZNEc3cUJkV0NrYWRkNVBsZXRaZ2k1UXJ1?=
 =?utf-8?B?YWN3dDNoVFI1akZXQlluemxyUVNnS0Z3ZExneU1NOU13VTZvM2FvM3RSSjI2?=
 =?utf-8?B?cGhRMmMrRVRYSXpESjVwd2NJUDhNWGJaYnQ2VzdxaXh2d1FqZXp3YTVJWjFF?=
 =?utf-8?B?VHRwN0RZWTY3YU5rbi9oUXY1bWowckVhZjZSMDFlU2ZPVU1hT0VyQmx5ZWk3?=
 =?utf-8?B?N09TTi9taDJrbFdPMW85dTdHcS8wUWt5UGN4cmRueDVIRk1INlU5UHBaTHJ6?=
 =?utf-8?B?cjZRcUd2S2FGZW5KSEN5Vi9OVWh6Y3ZUTHI4aVZjSHN1aWhmaUpnWlVMcktB?=
 =?utf-8?B?WmZGZzBiM1QxdG93N0xXbW1xOXRzc0JwQzJXSFRYTWVwZ0hDZ1YyL0U5eHZC?=
 =?utf-8?B?ZFdmQnpUQW4xaUhPMFVxZ1dkNGUxQk9LT25tOVF6aFI2R0dpeTgydENTYlFD?=
 =?utf-8?B?cHFaMzdKZi84c2lQNjNvNTkvdHdGTGhqRkUwVnB3U3JqUHB0TlMvaGVSODRH?=
 =?utf-8?B?bEJFV2lXQzVuK1dDdWVrb2lhcU05WVpNZENQa2Nlb1oxVzR5dXNmRnB1aXZ2?=
 =?utf-8?B?YzR4dGdwSkJ0dHRseUxwR1EybDNITXh2ZllBYXFWUkdaeW9vQzV1b05MckdN?=
 =?utf-8?B?d1J6eHVEMXZERm4wS2dyQzhNeGcvWnFsNEs2ZzR2WjV5QmRYamRCR0RVTzJT?=
 =?utf-8?B?Z2VhSUJLcVZUU25LWHQrTHRkOENtbEZydkR3MFZyd3BWT3poSGY4dG52UVkw?=
 =?utf-8?B?M3dFcnNqWHA0OHRaaVV0WlF6MEVFa1FQQjRpK2cvL3ZBRk9COUVkU0N5VWg0?=
 =?utf-8?B?c1FlYXJhcGdaOU1JdzU4SS9iajNGemtBNjdJbXdTK3pYMG50RFErY0wray9J?=
 =?utf-8?B?cGZudHZDK2FlUW9WTTFBdlFQZFZGWXFaMTZ2WXNSWTFzYXJMdjFBbE9CZFoz?=
 =?utf-8?B?SHZnZnhhbHBjYS80KzVhaUlLQTBTcm9RQythTzRBdlMwWExDQnBRWWUvdUdT?=
 =?utf-8?B?TEVCVW5uS29BcVJYWkVZNTJIVDQvY0JDaGs4U3hxNWRiYmpOUXVrVUNGOVE1?=
 =?utf-8?B?STlZYVJERTNmR2d6ZW9MUG9nRE5UQ2IwS29LZDhSNTJkekdPdWR5RjJoZy9C?=
 =?utf-8?B?RHVpWjRlWi82TVlTL0hOYmhlODJPNWJVU1ZGSDZ6UDZjMGlhREF5dDVCSmpY?=
 =?utf-8?B?cVhTQ29oTFRNeFdVZWxTVW53K3JqdU12TXd5SFBpRDQzQ2lQOHU2RmRxRmpu?=
 =?utf-8?B?SjNTMGIrMmdubWY0SDBUcXo1cHMwRWZnVytCcVk0RktWcnJOcmNmRm9KN1RM?=
 =?utf-8?B?aGxPL29RWU90ZHJnaGFtRmlqYTVDVWlwWnJyR1FJcjNzZkt3a3NWQWJXRkMz?=
 =?utf-8?B?SmlNWW8ybWZJYk9yZmVqVDhnNGlzb2hNdExqWEVudDBsT3AwU3lkcVk4cmNo?=
 =?utf-8?B?TzV6SXFDa29WbEN3eG1SOVhINFJpZG44dXZLenMyMGZZUFpOdExpNEViOU4z?=
 =?utf-8?B?S3ZDRmdzVmx3QW9HYTZnaHAzc2VKYUM2aFBFaGFIaFJLeWpxcDFSOEwzQ2Rv?=
 =?utf-8?B?cmxwTU03TDR4bVM1bWp1YXVyRXRkUnhiaVVGc1JhNzZoUjFiZlZPSHAzQ2px?=
 =?utf-8?B?ait0QU95cEtteEF4dkhERGZ3c3c5N0ZjTVBnaEEwZ3lxSFBlUmJOQjA4SHM5?=
 =?utf-8?B?clB2bkJkQU40NFp3TDhlb2lTdStmaGovZ1RHdTFMREJWVXlSblVKS1ZIdDlX?=
 =?utf-8?B?eVdmdTQvMDVFMU9tYjM1MEdpOEM1NE5ZQlpHeVdURndXL1N2cmhGWnZ5Nmpo?=
 =?utf-8?B?cWI2OHY3MnBEcHRUVm1yZFFiQm96cXo5dmZ2YWwrVE4zVFUyb01FSzRQUWYr?=
 =?utf-8?B?RVUxS1F0Q1dyaGRkMG16TWF3RnRSL00vclhUbnRPVWg0SUlwZVVkamJOOUV6?=
 =?utf-8?B?KzZsMk9paXVVV21sM2xGekhzWWZHMStCQ0NQVmJjNWZyL3dNWU9mandwT3FL?=
 =?utf-8?B?RHhjaVkxb0hGRHZWRzk5eUFPTHFpTlBPWVZ5M3NPQk1LdXc1bDdwQlZOb2Jz?=
 =?utf-8?B?b1VIckNka25tanpsYlNnbVZHSnc5Vkpyc0VLdUp0b3AzL3JFQ3N1Q2xFV1Qy?=
 =?utf-8?Q?Lk8o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUZrMEVFckZlYk9FL1ZJVDRUMWRSdTI3NzEyQWc2TU1GWFNNZ3d4SDJlaHRL?=
 =?utf-8?B?ci94UE9mM0xFalYrVWhSMkRZRXlPaWk4UFQ2Zjl0Z0l4V1lpMzJxSlVhb3kz?=
 =?utf-8?B?OHpVWkVmVkJGVGpNK2pTZWdVRWlySzU3UG9GbElNNkhsNi8xcithckxwOVRD?=
 =?utf-8?B?bk0weXJoWUdCKzE5cHNTaHdJK0JoQkE4bEg5VVJiMk9TZXZSRGpJU0NkWEhm?=
 =?utf-8?B?TTVLbTlRRWNZWldTMTV2bjZzRFBJTk9vQUQ3d0N6M2V4WElqQ2lzbTg5L2ZZ?=
 =?utf-8?B?V2tlck4rY1RGRnNBZWY5WUZjNkdhSXNNbnIrQm5IUk9lMUlSSVlwaXcyTU5R?=
 =?utf-8?B?TFpFblFaQ1pTL3dEMTZnWGdWd3l2MUFHZjU5TnliWk1hQ1Q0cE4wKzQ0USth?=
 =?utf-8?B?aFNtelk1NVFjdmx5bEJmSC9rVFhKUzRkR0J0VXdmdk9hdEhDOXQvYmM4MEZU?=
 =?utf-8?B?MytXQjdyYmUrT1Nqb2c3RXpialdGNk5VUkhuakNldVZaeWVMV1F4TGdUZTUv?=
 =?utf-8?B?UVdkYW1xYWFkbzZTUEhjdFQyQkluUXE5NXNhU0hHaHNuWjYwSE55L0k1YWtW?=
 =?utf-8?B?NlNyenQ5WjFqWlhudVJRS2xkMjBKN1RvUXJwSFlrUFFGOW5IbTFsTkdReDZn?=
 =?utf-8?B?Tk1RSEdHLzZ5NFI0ZTYzQkhrNEtsTk11SUNRRlpXWVd1c3liNVNkbFI1V3Nx?=
 =?utf-8?B?UEQ3RFdQRkFOMFNsVWdhbnF3WnNhSnpGT0EvWkpJaW5ScjA3YzhKOFZaRFFn?=
 =?utf-8?B?cDVSeGJpbmxJbTJCdk5JYWI5dHZtR2gyanFucnR4cDl4T3QzbEg0TGt3eERJ?=
 =?utf-8?B?WndFdWtqa2tRL0hvb1UwN1FZbnhheVBrVjR3Ni9zakEydS9neWJudktrSVF2?=
 =?utf-8?B?OTh2T2N0d3hYaWNzbVpUb0xEaVFGNkdUeXB6RVpJY1MyNjNXdFBUaysyb2Y2?=
 =?utf-8?B?K3V6UjhLWVVEempPaGVWOGplSjBPOVhnS1hKL0lMazdLQTIxYXhWbDBmS2lk?=
 =?utf-8?B?eXd6RzdBQmNFVkhQcmQ3aWZGazBJSkx3TzYwK0dOUVF3dDQ3QXNZWG5HUHVk?=
 =?utf-8?B?ajdhejJFMmtURUJGOU5Mdm5TK0Ivd3d0d1dyR0o2OTZlZjdoL2M3aWlaNmJn?=
 =?utf-8?B?cXlLTXU4cU8rdzBDLzJtSUh6a2dQdWpiRXhsRVd5VngvYURnczdSQlhIL2do?=
 =?utf-8?B?bE5PSmtaakY5OWRzODMxUk5Odlc0UUNRYmVQZG82cGlTd28yOXRhNTMzNTFG?=
 =?utf-8?B?L3NEOVhrL2pTc1hkM3RKYlpEVllLNms4SXJlb1k2UjN4a0lkbmpsS1piRVN1?=
 =?utf-8?B?R1ZnMmQ3SmwwazZEdVVTb2FEaWZ3d0FINGRzeDFKYnJSaWZNdEtLK1Y0KzhZ?=
 =?utf-8?B?MmhMNVQ0M1FJUm8vZnQwZTB5bE81dUlDNmZYaENzTUFFWFRsRHdVelZjTWpR?=
 =?utf-8?B?NDJ0akpXTldrQzFRVjJlSGhFQkU2Z2RWdGU4ZlZiTlF3OVJIY2wzNEJ4ZTZ1?=
 =?utf-8?B?QXg3djlCM1J2Znd1V0FHOWpwWDAyTWRKaE9QNk5lTmwzQUU3THNqUnZDejNz?=
 =?utf-8?B?bVhiaWxQbjlsRGlQenkvUzV2U1g4UUlTTHdvNDFhTHZRY29Vcy9hU3F2TVE1?=
 =?utf-8?B?U0o1aFdHNW1Zd1dmK0VpUEhrdkh0RnQ3ZkVRdWJrcmlkeGx0d21ydmtqYW1P?=
 =?utf-8?B?SVNLdVJsbVRNOHA3VXE2T09YV0FTOWZISFFvbCtYRTlsWHpvRUxSWmN5M2o0?=
 =?utf-8?B?QkFoU2dXL2ZnVFVQN3krQ1JxL05yTUxEemJ2TVM4M21reG9LNWk3S1NQdVpP?=
 =?utf-8?B?K0YxdTVic2I0eGNVMHo4aDg0ckhSQllGd2R4ZTRPVk91cGZxRWRPaHp1eDkv?=
 =?utf-8?B?dk9Rb2M1UHZHa1RzTkpzSlVtZ0ZaYW05eEtNNWZnU0RGUm9hMWpzbldVbTBi?=
 =?utf-8?B?KzYwdG8vazc4WGlwcXNYbTZGcDhWNUJPbzZrc1BCNk12czNoakM1Q1FXWFU5?=
 =?utf-8?B?a0I5RXp3c1BGMXZ2akdjSndadGxkTEt0UXJPZGFSVEc5QUIwZ0lMdXhpN3Z6?=
 =?utf-8?B?bG5leUxRN3paeENoZTk2cWRhZG9oVWpaWlBQRzlVUjMvUURzNEJZK1F3dDYr?=
 =?utf-8?B?ZmtWaWkwZ285NjR6eVJPWkc2bGlpVGRXb1RhQTRkNFc5SDU4QWExc1FOeHhn?=
 =?utf-8?B?UzBVWWczWmtNM21MVUxTYlcwRS9RZGhjdXRzMkl4Mi81bmZXNm5KcXlRUFJy?=
 =?utf-8?B?WUNVQTVjSWNYYnFCVld2Sm1naHVuYnlPRng4R1pTbTdUdm56YWtsMUF5ZGRH?=
 =?utf-8?B?UHhsN1JLVFJPNElvMEJtSFNDR3NyTzUzbURPTGdWZSttTFY1ckNRUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc83e10-11c6-4032-ea4c-08de596602e1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:26:20.5626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaANmOeCLS7TATAm+r2Xn2Lkuey1mH9bQY/3O1A5kE9vojqUOqx55h/7z4Q1bEDPcR3RBXqLc0D1H0VyYSAz5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740

On 1/21/26 6:59 PM, Eliot Courtney wrote:
> +            // The area is contiguous and we leave an empty slot before `rx`.
> +            // PANIC: since `rx > tx` we have `rx - tx - 1 >= 0`
> +            // PANIC: since `tx < rx < MSGQ_NUM_PAGES && after_tx.len() == MSGQ_NUM_PAGES - tx`:
> +            //   `rx - 1 <= MSGQ_NUM_PAGES` -> `rx - tx - 1 <= MSGQ_NUM_PAGES - tx`
> +            //   -> `rx - tx - 1 <= after_tx.len()`

Hi Eliot,

Documentation nit: the proofs are great, but the above just does
not go into my head easily, because it's a proof, rather than a
sentence.

Can you please reword these PANIC comments so that they are complete
sentences, along the lines of:

    // PANIC: a > b and therefore c cannot overflow, therefore this
    // cannot panic.

And please also use words "and", "therefore", "because", instead of 
symbols such as "&&".

Same for the other patch with PANIC comments.

I did a quick search in Rust for Linux, before writing this, in order to
ensure that what I'm recommending is How It Is Done. (Not to claim that
Nova in particular is fully correct, though.)


thanks,
-- 
John Hubbard

