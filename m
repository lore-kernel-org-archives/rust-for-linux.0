Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FA02F530A
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 12:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769258412; cv=fail; b=Y5NnFkdXJcxTe3Crm0kiopJejQC461tNl+0ZaxA8CjkMxwiHAZI8WekRiJrX1zD6Uh6gLECx8dHm1VKjfw1dgTJFNokVLfZgE6LNuRUFgvFtzh+gmZ2qSIChTElCXFWW1OVwMUpJGpFxW8eRBWHxgTHfIFsUPM398ao/exHzK+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769258412; c=relaxed/simple;
	bh=0SdHKdg/l4DQBSku1buRYxt0KSQhoihEjNgH9lQmA1A=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Ll7ysYAjz0dExPpCWQXQtlas2DK9GJB9S2tstWKy8kW0zGBOb4YwtwLadVPnja844tjD/Arz7ijwHSGiQwwyEICy0GIF/L7oRmS9KUhH/Cr3YzqBJSdUqbzuDdYo9tkMHkgHf1W9fHwiptrtZlD5JSb2eicQ/yPZxW7c/95/hB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WNbK6FyV; arc=fail smtp.client-ip=52.101.56.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WNbK6FyV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pm/j7EXmGqEl8m+FK3OP5pqHidcyBLYZhGdVlF3MoYnC4HUm9bRHAeeMZUMZ6OjO0AzmhU0cRGaif7eC3NHL9wswhM5eZ/ps2yay5iSJ3xJyRZ38HuUVvsPktRUbSLtpKdFCEfGkXrMPGLeQaAPKiMlJM19PikIuPalZ/ah79K3sJfduLj4YTbBO7QTj+hVGq6I8Qm/qJvmUxh27TmAoY6ruoQxuYkPO/WjAT9WlA2fGjccFE2RvvyakZSwwFphVIFVC27xUDdkd8dr9R0yEIpEKc9QUf2gCLf44j84NtYiah5w8+yXuFmjVrGMeSRdzp08a5pdpVgszYQGiFarC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn8oHIg/SmurzZHXEsmG4f6S25xwFkKkcsZNEtUZPXQ=;
 b=Tqk4xsAD37ImvJe0QyzU9+sitjZ+5N7eOvwXvIdewijBW5SGkINkMN584KNkBduAqxgb327ntOx7HKHK1iOiVHrbcq2QZXe6bPbBHca+hoPZ576NStqcdcrKio+Feq7dHh0FWTq9y7TdavinHWXw3liBrs1dQpnPVtLpIjaU84ezFpiObnlCG3lpk80pNFbl9m4mLAQAbejlTuH1PjLSUDMCa2QBb+Vyw/dXGKZpK8izlQ8BYFvNW7cuEYhrTy96h04pVdi+2NIp/eTSWE/evYNO5l2I1qJgB1glt9FDhSCjWUv8+TtF17+yqOQk6Vajeix1vO9n2CnJ/arOyFUE8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn8oHIg/SmurzZHXEsmG4f6S25xwFkKkcsZNEtUZPXQ=;
 b=WNbK6FyVbJa8ftdVqScpawo6GkyunaoMjqHLdnanDJaLky3mUacTPLpxXo1QLkNuGcRBGmRl2IpZUxt95mDTHM5lIZJDaYLJ42JA0E3JEzDBJrWBVXB1UZTErFUIffLiCIA7761jlv9le+SmxuEjEqCPGAMskA8sifY1IAuPJYBYUT8KJv8eyxVfziNkW3f7ilkpns2PWrDk9SyEMr0QrLqFDKNBe6P6ia/ZKSn4O5xL1TnKkPwUaBJSLZ2EJUboDt7zyBwnqGyj8qAvS5bmg8w8HrbzdDc/12EFygautwosRlyfMTPOMXP1ukZuNoxyvIdWaezLCNGsswwpP1z50Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 12:40:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 12:40:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 21:40:00 +0900
Message-Id: <DFWTRCR9E02H.JFMO28G6XEQX@nvidia.com>
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v8 09/13] gpu: nova-core: add Falcon HAL method
 load_method()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-10-ttabi@nvidia.com>
 <DFWGPVUB7Q7O.XCM4MOK1SK2T@nvidia.com>
 <8dd8d8047615cadc73e0a888d5172ab15cc372a1.camel@nvidia.com>
In-Reply-To: <8dd8d8047615cadc73e0a888d5172ab15cc372a1.camel@nvidia.com>
X-ClientProxiedBy: OS3P286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f7::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e81de12-bbf5-46ab-a99c-08de5b45b47f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzN2a1pJZVllS0lQdDBRaTNsWGRyU3FhUWlndloyUE5LMkZQRG9DNFVuUWcw?=
 =?utf-8?B?TVZGdU1UWUZRbTFET0pveGpuZFFhTUMza1Vrcml3cEpMdnJaYjd3cTV2U2Jw?=
 =?utf-8?B?SC9xbSt5MTRCaWNTUDhrUEplTTV4d015d2NFTDBzcEh3aTJHWmV4ME5KZVZr?=
 =?utf-8?B?blJhZnY4azdKWXNmYXJLSEdvN1Jlb1l1ZmdqeVpyY2tkdENJVTI0VTAvYXpP?=
 =?utf-8?B?QjlPZkRLMXVYNlA0WWY1ZmM2dVFyeW0yV3NXbHgwd0N2NHlvb2V6bUVFMzd4?=
 =?utf-8?B?UWhZZlo4ZmJTcTd6UmtPNGlmL3pFK2JBczVScWhFR253NDI5c0MyNkFyYVov?=
 =?utf-8?B?RFVidjdKSnRFOVd3SWoyNWVjZSt4elptK0ZwMk1SY1hRZE40SG5RZ1RRVWcr?=
 =?utf-8?B?K2NvNS9rdzBWV25tMEtuY1FGUTJDRm5udldEZ2kzRCthbFVrTldXcU5STzlT?=
 =?utf-8?B?TFhadnFjb1QwVGQ0emxmSUZZbVdLRENOc1pMNjFleXU1MVpwdFZ0UThtcW9o?=
 =?utf-8?B?bDNpRGQxYlJ4L1hOTlpMQmk2TEhCSnBqaVZvMk5TZHZ6Y2RZeFhINXRlSnZK?=
 =?utf-8?B?Smk2N2Z3OWQySmxFa29tUDZxNCtYbFNZN0FwbHllMjUrK05ZSHVsRjE0ZSt6?=
 =?utf-8?B?UGFabVBqNThVelRXNkpkRTcxMVZpS1loNXNyWFZjM0M2cmZXWGhkdmJRTFJE?=
 =?utf-8?B?OGRjU0psQjV5M0xra21UVEJWRWtYQmc0S0k2ZVc4UWpldUtNS1A5dXo5UHov?=
 =?utf-8?B?VmZ0R1grZVNtTzhvU0dQLy9LRWFBaW1vVW9JdklpOHZLN0F4TDFaVkRkY2VV?=
 =?utf-8?B?Vy80VmJsc0FGQkxZTlp0QkhhMlhJWHUwc21aZWdFaU5aeVR5V202empLVElS?=
 =?utf-8?B?dGRBOUhiY0F2NU05VmlIQThueDZFbkhHcWFIQ0FaZUR5U05IUmNDam93Z2Mr?=
 =?utf-8?B?V1N1SnBLelNWRU1aQXdMbnhQK3J4WEZQam9vRWs1TytEZVVnczJRN1VhcXRa?=
 =?utf-8?B?dzVEeWRUSGJ6QWJOeTNCVk9kRUZMR0ZYU1hUeFFRNFFRSnZRMVg2OExMQkpM?=
 =?utf-8?B?SVozV0VHUnVKWkVDK25SU3hnMERuWWFMZ3I1dmFCRDcySGtEQ3dOdmRUbnk4?=
 =?utf-8?B?Z05PWE9SRkpBc1plNWFBY3d4cmpjZVNwZ1VpN1o0UGhsSmk5SnJvZ1NhNHg3?=
 =?utf-8?B?bWFkb3VvWGlsVlA3QkE3b2I2RVRFQkIrcmtPdnYxMVdKY1d6TlRXSE9BZUNJ?=
 =?utf-8?B?K29uOEZNdjlSUnYrMEZvNG5zRWExY2pMMCtObEFJTDA1UjVxbVdCL1lwZE9P?=
 =?utf-8?B?MlNMYXNCcnY5WHJXQzdCVTJzZXhOdnFKRE5WM2NEeVFXSXR6aUJQS2UvL3BG?=
 =?utf-8?B?eWlRNXhuNlg4TStpRTZIMnhoYlo1R2o1OTJoWDBFdzR3VE02Z1pIOERzbDRl?=
 =?utf-8?B?THVSK2xEMEFYemVaYitaVHA5Q2NEZDEvSEJlTEZJQ3FRNGxpR3FpZk1JZjRo?=
 =?utf-8?B?NUxRYlpWZUxKRFA4cXdPdTMyWVVEWlUwZzV6MEp4N2picEQ0MjBnOWVHSHlO?=
 =?utf-8?B?OVZ6cmJVMm9NN1NzNkRUSWdITmtWYWQ0YTM2MFl5R29nSUhOdmRhL2ZNVWFV?=
 =?utf-8?B?dG9uWnRiakpIOTB5ZzI0Wm5yc1pNSTQ1NVJsaENuWkZpUFFZd1MvNnFoMlFw?=
 =?utf-8?B?M3BvWFg3Y2VvU21SQXY0QU53aWt3M28xcnkrT0N6ZlZYY3Z0eWMzMTdzSkVW?=
 =?utf-8?B?NnZBSU9yMzRJcmNVNXNTYkVpd1g5R3FsY1paOEV0ZHBZUjIrYUNWL1dHRlQw?=
 =?utf-8?B?MUJrNnMyb2JNMG5PNzF6WFJzT2kyMDVKVUROWDN3OTBmWVhadHFaRkRKbVNL?=
 =?utf-8?B?VFpkUzBGMVptV2UwY29OUHkxbUhnWjdYVU9YTDhUMEt4MzlQVm45djBQT0g2?=
 =?utf-8?B?WVBlY0FvYWtjb3RUK3RDeUtJQ0hEMGdPY3BiaVoyc1RqcVJGcDlqeWdrbkx5?=
 =?utf-8?B?YkE3MGQ0MzMzU2hZd0VNV0I5aVhpQ3JSSElCb2dHOGxlcXdEckRZL2ZyYmFn?=
 =?utf-8?B?QVVUYk9xZzAzMzMzVjdzMVNmSGxiRFA1ck1ZQ3UvYk5JdERWZlNIOTdBRUdS?=
 =?utf-8?Q?jLq4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjdXRDZQdnVZT0diVTdoemVRd2NsSVZSUDBiVWJSbi9RQ2VCMVBsbUJMaGhL?=
 =?utf-8?B?eTVnMWZSbDNyelk5dTJFWXM2YSt2eFk2d1dINTI3RGhkVW4zdUdQRjM2anMx?=
 =?utf-8?B?YXZQbHp6SW1Bb0NTdStxZ1Fla0ppVWJhdnpGMWgvTU5qRGtDRWY1eFR4Zjhh?=
 =?utf-8?B?d3YxbzQrZ0tDdmlRT1lIelpZVmdxVStNRUI5VlNqMTYxTy80RnluMnJrRDBz?=
 =?utf-8?B?ejJDWEJrc0JIMHNRMG5mVDFQSlVlbGtZM3R4VjI1T21qQjNhRlJ6OVplblIz?=
 =?utf-8?B?ZTUzOWZxYmdWaWRuNWxDaDJzdU1uZk1rUHFyT1lmUFVhSDg3bnkzOVFnUFRv?=
 =?utf-8?B?Zk5qQ2Q3N3FHVHdKb2x4UVA0bmgwcmFySDVJeGlvZEpLR1BLMDl6MVlZdXo4?=
 =?utf-8?B?S3Q2clVxdWxXZ1NQVk9QZ2ZiRSt4NU1Xanplc3g5V0tUelpqa1Q3ZTZyVTRI?=
 =?utf-8?B?OHluZUZ6TTRZVEljY29YMDJmcnVqdmRsWkNDdEVQSmhJSjZwZ0tNNmgwMmFw?=
 =?utf-8?B?dXBrcWJYbUswL054SitRZjVubHlzRTZaTjhkM1VNc0JlNmNLWEZ1NDZkVmNm?=
 =?utf-8?B?NXRQcFFxWXVXekdTYWlFSWlWQmp2RXRNMFh6cmhiM1lRUFlXZC93VmpjaW1J?=
 =?utf-8?B?YWJ6bGlKZVk5OVdXdDVRdUd1QW1zYzliYmI1QTBZMGR0czFidG9VQ3YrWkxa?=
 =?utf-8?B?UE5QRGxNYkhtdFVJb295OXhweG0xLzRaRnF6R1ZLNHp3S0tWZE4xYTdqOWsy?=
 =?utf-8?B?YnU1U3NUQWp6NkFJVUZLc2REZ0ExdjNNR3Faa090Ky8rTWJoN2I2ZWVuZ21u?=
 =?utf-8?B?WW1sb0VBV2U2U2IraGdrZlQrNlpYaFZOVWlWWGdwMURVWlRFV2dsdFRRNEE3?=
 =?utf-8?B?cktsaHVIWFpVSWEyQmVBSzZVWnZSbzZQYjNrcExLSzMvNTZ5QnI2bW00NmYz?=
 =?utf-8?B?K2xXY2lvRDdFZ3ptY0hpZHgxZ1NIYmpyRVpWZjF6bEFOOWRrOXJ0S3pDQ1c3?=
 =?utf-8?B?VUZhSHlzRHlGMFFlTVJ2VXFkcjB4UHFFTndOOFhhbHE2UC9WSGdoNndRWkRG?=
 =?utf-8?B?N3BGbE9HdCt3M2VDZGVBakRwVUJ1cHRHTTg1cWltV3VGRmVKQWhWVTBDQVA4?=
 =?utf-8?B?bkNQQk44ekVLQVNHbWhLYVdveUdxK0RKYUFNM0FHV0FndnpWdEE1S0E0UXlz?=
 =?utf-8?B?Y1pJYXU4MlhKa3psZ1NlRHYrZkh0L01SSFpYZHZuK1ZrQkFFc1NvbGYvN0Ir?=
 =?utf-8?B?TzU0NDNxV0tXeGpVM0lybi9XRzF3RGI3TWQ5bldiMmJ3YjRPL2NuaEhjVTMz?=
 =?utf-8?B?bS9ieUhlalNSeTJrZFh1Z2xnSFZvZ2JXSlhibVJOVGk0cG9SeFJBMlZpOFRu?=
 =?utf-8?B?ZXp3SURKdnF3ZHJ3UVJSRTM4ZUt2blpJTitwUVU2SEt5M3BVSW5Nd1Y5VzhF?=
 =?utf-8?B?T043bFI2V3dBV3loRm02dnQ5SVhGTnhHaTVGK3dQUW1qdEh3a1dlcDhQSGU2?=
 =?utf-8?B?NXlIUmVveEFxajFOTThuZU9HTmdoQXJtdUVRSXl3Tm5LUFdvZWhUZ2RUMEti?=
 =?utf-8?B?RDZ6L2tVdi95RnQ3LzhzajhWRjQvckk2Sm1NZndEWXJla2dUTEZLSXEzeU9X?=
 =?utf-8?B?LzZ3amRmYkYrS0EzdmtKdHFocWdaNnhJQmVBZHorNk1zaUs5ckV1d0pHUFMy?=
 =?utf-8?B?UnNmUTlwalk2MW5xa0RZcEEvWm1XbnZEMjBkOE1tTDRHaStyWjJqK01tQUJi?=
 =?utf-8?B?YWxBNFh2RlNVQXdsZFV5VEpxR21HeEJYZEVGQ3o1a1Q5NXJ6UkR0TmUyUVZI?=
 =?utf-8?B?b2ROYUp1YUxYWFo0TnBNMnl2SWoyRi9yeGF4eUs5czk2RDdIU2l5VCtVdy9n?=
 =?utf-8?B?NEVFZnFhNDFBdXNKSDNFbmNHRUljYWQ0RlNLTjJ0NFdHSFgxTVBQMmE1azBh?=
 =?utf-8?B?N1Fvcnk1YytnRWx1cUd3elpubU9KOHkvWkZFSFc1SjdVUHRtQ2k2V3ZLNzVL?=
 =?utf-8?B?VGNJK1NhdE9wbWYyaTk5YWVaWDJDVTByU0tBN05MQ0RCdFVYUDZrcG1vRE5B?=
 =?utf-8?B?UWlldVE0VC9oSmp5aUFPVjA2aVNVcStPd1lyM21jS3BkQmh3aXZZS0FUU1Z0?=
 =?utf-8?B?OHE0WUVWRms0d3JiejJKZyszNWxxSEFWUTNYbjBySW0vUkN5ZVo0VzRQVDl3?=
 =?utf-8?B?Rk5TN3VZL3RXS3B2bEc0dExRb1BPbEx3MjFMc0FLV05vZlhVcVdsdDVBK3VT?=
 =?utf-8?B?T1dFVFJ4RTJIN2tFT2t5cnBrYnN5enpYNDU1dzRsVGpWbXkxV01JdjF0K1M0?=
 =?utf-8?B?d1RLazJhTm5HYWU3cmMzMXhqN1Z4TFZiN21CZEp1T1lVZ1VzSWUwOU1NTUZN?=
 =?utf-8?Q?l/RcbzTaoFI8uhOyaZjRycfJ/4qEe/h+uEikwYeqMNf3F?=
X-MS-Exchange-AntiSpam-MessageData-1: z4WgtIIU2S/HTw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e81de12-bbf5-46ab-a99c-08de5b45b47f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 12:40:07.4174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyaH0Fl79l7vxoOoyBdjze1m6ECx9VCP9m1PIQ4JXIl4gO6V9W924w8/+wsXzah8zGJwPv2oAqWUdsZYGs6rOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101

On Sat Jan 24, 2026 at 1:56 PM JST, Timur Tabi wrote:
> On Sat, 2026-01-24 at 11:26 +0900, Alexandre Courbot wrote:
>> rustc 1.78 didn't like the unused items, so I have picked a small chunk
>> of code from patch 12 to exercise the HAL.
>
> Should I downgrade my compiler?  I ran everything through clippy, rustfmt=
, and checkpatch
> multiple times.

Thankfully several rustc versions can coexist and it is easy to switch
between them.

To install 1.78:

  $ rustup toolchain add 1.78

To switch to 1.78 (in the kernel tree):

  $ rustup override set 1.78

(you can then check that the correct version is used with `rustc --version`=
)

To switch back to the stable compiler:

  $ rustup override set stable

Having said that, checking against the MSRV is something Danilo and I
will always do before pushing, and problems should only arise on rare
occasions - so that's the kind of stuff I don't mind taking care of if
it is too much of a burden.
