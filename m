Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2F6BFCE
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 00:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818126; cv=fail; b=m8qz9+qEjnZfsCVmLzpgTMTlHQxQAvZ5+OvXMjxflHNPWQj7gR63Qj9XO3HNsMhiD8obeDcwczNrO0UY+n/ARxeYqjcTEXQGkNukX/5EfoflUc3bBF/4VrFPOtWsbnTKswKbmgMM7jpCZf1qaN8+/xD7igUHODpof8plfDxWleo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818126; c=relaxed/simple;
	bh=KozQX8EKSrzoGaduSIJGUJ9EjexUfL8VhI7OyAalGfk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HOSCW01HZC3QNdJPaom/Ru3ErNrXd3laQ/Kh1p+CDAxH7UEYbx1Rr9Fuklzv8OHzc1Hj8VYy6iWAZKuu3vGf3vDzddXGzMPhJ+Z2nSnA8hVcyGpjzwApY75VO8NS/RAXeNgltBuINGPjB+1qRFPDmOBXttRX1Xmai42jXMLwy+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SrgOpJqq; arc=fail smtp.client-ip=40.107.209.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SrgOpJqq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4lxpeATmQtEsdT6nHXI7EwmTrGqmGTDRRNzq5fFphYpSfRcEL8k+UfnnLLGgH7bjYSfq9Ld6S4RRaLW6A53DDtYyoPLEIpr86F7MSkOtjDjwhis+PVZLd3dFYTp7yqRjtsgvBw1lFweOAWdkj1z7fdw4bSRJdCVMhGBLwJmVHUEfLwVnXusyo+lr4BJwGMLEdOrJEj/VYXzy2xY6kk/+ULDfnb/HecVpb5PY4Z+BCrB8O1GHYpp9x83CZuZHtoO/QdXkwmh/8PSl7DFgJG9CJJpRYrcmzOp2sn4zKnyTOwqiJ6qk3yr7MiS89RpUu5OqiNpF8pvXm1YtxjyfR+pyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu/TkAue6QX4/Iw/mVJIXMscKNcQHVVc91uDN5VByMg=;
 b=T5eA8ZVZn2YJYc2TnfswB7Xvv9d8SBlJBdA+CklCgWyPloXVrDaY/VvJ/YEl9l9uNsbvVWJFK0VKOk+jTfkKTIEV40LUJ/7yhmT+Yep6N2s0CfR0ooVGKB//HbZXA+/mni6oTiAITj+r8ObZjeEtdDeGBES96r0pwLDydxrIUaMTBIKUakThpFjJ8LaY1qnetvdilazNiFhK+xcToQ4VBUszCQJxJMyH1UdBuCdpB13cMAXjXAUHonDAiXhfq/iuAvFZAaPmI5lcamvZNmw+T6f21fxlrqRNrM+D4wQkWxRurxxKYlvAq1cUvv9LblL7kQlFFRT62yqFpI7Pa8iR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu/TkAue6QX4/Iw/mVJIXMscKNcQHVVc91uDN5VByMg=;
 b=SrgOpJqq3+XlvDYk7J8U1RNcR5TLGliJvKbOUkhkS1Jl7kQJZNXHvbnnC1j3uGw2BzK/CWicymllnO+a66TPaYZXxdyz3xzQdgnmTOS8rxs9Wf9J4Z4ci2DvkgLwrTDuGL83OwFZCum5qz1XOicrU0IUlO77CpUHxO2mtS8nowhyp7QQulIVlAVVMySHPjlYdeEnnrWuYudbBXu6loMKnY+gC+2yraZbTWEhSu7mUXakkJK+AAwOz0PiwARtMoRK3pcwfFrcjY21Cmucn9b1f4aUNpst+f3Td6hc5Su7BVExSKhhjvUA0RT1m4K+jvRg8MCAaKMsUDlYeKmFvTinjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.8; Sat, 31 Jan 2026 00:08:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:08:41 +0000
Message-ID: <0763f715-0690-4742-85ab-dbbdd2edbac8@nvidia.com>
Date: Fri, 30 Jan 2026 16:07:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
To: Gary Guo <gary@garyguo.net>, Timur Tabi <ttabi@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: de36c779-0024-4eb1-599a-08de605ce406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QSt3aXB1YWoyZXNyQjlHUG5UTnp2VHNNT2FEb3FleEpLQm8xbFRxNkMya2Rz?=
 =?utf-8?B?OHdDd1hrc2NablpmY0pDN3VaaWtGSkg2K3pWeWg3UWRhTjJaNFZ2aVZyTTBE?=
 =?utf-8?B?RmNVNDllbXlYb2greEhxbWh3dFNMSXFmQkN4RHA3YVZrVXNlNkNzRWZzWm9N?=
 =?utf-8?B?MWEwa3YvMW5pWGFrTHVLUXRFTTRFdDR4QVFST2RnM3VlbmNaQXZZODF2SkZQ?=
 =?utf-8?B?UEpIM3IwS0NTdEtESkczb2F5MmdqcGZjclY5Q0dzMnQyeWpyVlgxMVJBWWl4?=
 =?utf-8?B?ZTRTUUFoNnA4eUJqRUZmUmxXSWNOY0pBN2U4SHcrbFIxMUJFZytDRXNUMFlC?=
 =?utf-8?B?K3BINHlWaWd2UXY2SW5qc0h2ZEVUNmNjMVJRZlBEUUgwK2VDQS80ZjJtUEsy?=
 =?utf-8?B?NFVQd1FtTWN2S3JqdXVqZmpaVUlJMDJiREpCVlJ4UmsrbHgvZTVWOVV4T3pX?=
 =?utf-8?B?M3ZKd2dXZ08rSlZ6cENITFJ2QjNLak54MWFBTFFtMll4QjNpV1JRNW9ZTnJx?=
 =?utf-8?B?M3RhYXZJMy9sVVdhSWMxaHhDcldFU09DdFR6czhLMkhYYk15bXRNM01zdHl0?=
 =?utf-8?B?Q2tZazBVTTNYSFJXdVlvRHptUG1nci9scnY4WWNCSmFoMVl3YVZkdDdUamI3?=
 =?utf-8?B?TS9tUXU5eVg5YkVFY1ZZM1lNU1ptMHJTenFINjdYcFJBVGNiSjk2VXNEeDl0?=
 =?utf-8?B?SWF4dnVDWlg0eWtRSjdxVlgzUERRbkNsWmRHa2p3UzAxWWVKS2JkNzh5Wjlt?=
 =?utf-8?B?ZW5Sb0tzUDB6WUdyYm1PTml2cGtPV2xRTkVzRlVDSkxpemhTQSswaXl5NnJE?=
 =?utf-8?B?RHZHU3pUVEY3T3ZTalpPYnZnbkZIZUg4bzNDcUI4NVg0RmR0eUxtYk5Ob0Ry?=
 =?utf-8?B?R0kvYjcwcGdNeWIwM0s5ZzdlS3h1VjhRNmlSQSsrZVlRdHU3aklrTDVuZU52?=
 =?utf-8?B?cnNtbXowVFVablJmMzBWamZUS2dMakRHZjZwczJ6dEVHbFpxYWdLemVoL0VS?=
 =?utf-8?B?T3IxdTlGeWtCMFJHcVUxSDBjVnBIWXhOcUpCekRxM1NHdi9iQUE5MW1QOTZY?=
 =?utf-8?B?TCsrMGxYRGtRWkJ4bWxYanhOSDJYUmJOWEcxaVkydDRhL3psSmg1ODZ0ZldR?=
 =?utf-8?B?UVVrK1FkYkJkSm9QdmVCS3VXTWJnV2FJMFkzOXFURnFQRW5ROW1tZVJyS2E1?=
 =?utf-8?B?N0NSZ01wblRzWkNHTkdrY3NZZXJHT3NHcEhhT0RTYi9JUkM3cWpKbWpvZWE2?=
 =?utf-8?B?Z1NtNnk2MGtUTmd3T1c1K0x4YVpHdnpLRkhkWjFUelg4YmlwUVBObjI0M0tZ?=
 =?utf-8?B?aVB2and4dDY0VU5MOEJRTzFmaEF2U2REU0RveWJaNUVTM3dBTnJqWlkzNGJu?=
 =?utf-8?B?TjdBVzloSUhneDFWRTBiRkFqZjgxaFk0bU5maFEvYWNMVW9ZUmRmdTR5SFRS?=
 =?utf-8?B?bzJ6UGVuNk11SENlbEhBOWpHR05saThDeUl3SW5tcUI0RENhNVlCQWRmZmIw?=
 =?utf-8?B?VlQyWlBURVA0MUVZQlNQVUlHV1hEVEVGYk5xSExQd3VNK0lyTnVWakNJZHZT?=
 =?utf-8?B?RVVvOU5OdVJYTnpTUTkvc2l5ZFFpVmg4NXVmbk5iT2RUOHJoU2tYLy9mRGVB?=
 =?utf-8?B?NnRlV1B6OHduVFRvSVpTS3Byb2FERUY3Z2krRjZaWWdFYmZHNWF4ZXB6NHFQ?=
 =?utf-8?B?M0Z1L2Fvd2ptOGdoNUhUM1hta2NtbitLdGhwWWt5UkVqamdvZkhsSHg3RG8y?=
 =?utf-8?B?b25GMDhYZW5lb2M0OUFrcmxBYys0OG5OdEQ0d3JSYnRlc0Yzc01VWWJwSTFz?=
 =?utf-8?B?cERsd0NYekRlbERTK2VIMkxYTEsvRFRWN3JTbWxYcjdPaDZPK0NzL25PMVFu?=
 =?utf-8?B?MGM5dFNuYjN5YnhlRElwbmJZbkh4RWRSajN1bG1vUjl5WTBTTDcrbm5HZ3U2?=
 =?utf-8?B?eWpGVWlabUJidU01QnFSY21UMVZzUGtWQ3l6MVMwekdMMCtCTEFIQSt3bXRo?=
 =?utf-8?B?ejR3NUFRZlNZS3pRbnU0Y3c4OSttRU9zTnZDazJyNmpmU2QzQUFRaGxzblhz?=
 =?utf-8?B?bTBYV3cxUlV1bkNCRlNHTWZKblJPRWpKYjQ4bDVwVjcyTW15VXdaN1dTeVAr?=
 =?utf-8?Q?CotU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REVmenhrOUEwdVJDWXg0SlpHVHBLZTZ6WkhIeGgvWVlUTVRydFVjUCtITzRn?=
 =?utf-8?B?WWpPYkVOZkhxSkdNVGwxNnhVa1VZT1FNNW5VUVZTeW55c1RFT0dZZm5iamdD?=
 =?utf-8?B?YitjdkpCQVhLUlRDVExkdUt1SUJyNjZiRy9aN0Y5S2dZMnUzakRWRm1pdHBR?=
 =?utf-8?B?K24zbWp0Q1BYZTZGSnBHa3RMVzJ2VjZ1eEhCUFBJcS9McTRXc1pnZXJrS1VF?=
 =?utf-8?B?SG5yUlIxRjFSaFZmSGFjdDNMZzJPajU5V1hRRFVJeHdSMk1ZZm5FUDNNMEt6?=
 =?utf-8?B?SEpFYU10QWRqOUQ0TmxOaFNsNTN0bGtHMGVVTS9DOE50aU01SXRqL1I3RGZK?=
 =?utf-8?B?NjNDVmZ6N2c3R2xSZ2ZPSEpkcE1pb29CdjNlUXZoRFNnQzhWWm91ZDNrakZm?=
 =?utf-8?B?T0wwbld2WHhLUjJxdUY3Q1BCbGF6cmJLMC82NGFGMUFtcWF0andpZDFYQXVP?=
 =?utf-8?B?bUNUVXRPQmdUTjE2N1pqRUxoS0hPQVZycUFXVnZHc2Joei9TYlUrU2lUc0VL?=
 =?utf-8?B?OGcyT1I2NThtd2drb1FyU21tUzdtL0pRRHZwUkw5NjhESmR1K1hZVFJHK1Vz?=
 =?utf-8?B?d1BCdGVWZC9LRjF3a2RRWDM0MHBqTFFuWjB1Y052UEFLa1pxL0UyZCtPUVRY?=
 =?utf-8?B?em5rODExM1d6eSs1LzZ6QU9rWGZrSTF6OUxITExVQ2VDV3lMbVA2NEtFOFBN?=
 =?utf-8?B?ZkNKRmhiWWlKcmdvRGNLRHdvc2RtdE1KMlZ2WHNjWjBhZnppRllsMm1vV2VE?=
 =?utf-8?B?bzA2WHQ4blJSQVpFTnRVdjF6MHFHOVc2OFkrSGdaYWt4MlRnN1lLTHpsbXl6?=
 =?utf-8?B?L0NwK0p3eng2cEdmOGFpVVBQNDZpYmxsMEN0RmhBb2xaNDVxc0F5N1JvM2RZ?=
 =?utf-8?B?c01FZHVjNWdJR01mcGoxUlpadmp5TmVxUnFUeXhaR2dzTS80d0JQUFFubld6?=
 =?utf-8?B?UisyZFM2QkU5RTJzMXVnVTRRM3pYaWlaUzJjT3BHMEU4dktvSTMxdDhzR2ZI?=
 =?utf-8?B?SmhQRklNbG9RNDBOMkJMdmtmM2xVT0gxb0VIWVBxM3RwVWZZNGJiRGVuOG00?=
 =?utf-8?B?RUVlUVkzOUhmR1piamMwaWVkYVZSQWVkUzUwdy95Yjc1Mnh4eFNSUHgvMTZz?=
 =?utf-8?B?RStyNG94a0VudnJxWUhFVGhJcmpDRXhJTzliS0VxalhJUnoyakF4R05aK0dm?=
 =?utf-8?B?WENUV3hDbkQ1NnA4RktLNnFZZ0JaSElwblRlZkhFajdnNEZ5Y0YyK2xmZE1P?=
 =?utf-8?B?WitUNzRhVmd6bGpsYit5ZWRIUmVxS3JMd1FIdGR4emZQVGFXSmZPN1BIWUQ2?=
 =?utf-8?B?blpOMEtpVHlNT1VSNFlzUCsyMWFsNkw5c3pLSVFtcm5XajBYODZJdDZUTkp3?=
 =?utf-8?B?K1ViaXpvd0tGT0lLaHA4NDI3Y3h4UER1RmxVQVBUMSszR3l0QTJ3WnErL1gr?=
 =?utf-8?B?WXNiNnFrazBXMGlhSzNwUkcvNVRTWVJkOVQ3cW5qLzVlNDd2bHUvMDhrc04w?=
 =?utf-8?B?UE1nTFY1MGdROE1QcEtYNHFPek5WUUovNEwrdzlrU05VUHcxODFsZldibkJR?=
 =?utf-8?B?YXdEZGtjajlvTG1vVXdMZi9jN2FTb01hT3pGUmVEQVNpMlA0b0VXQXVrWFA0?=
 =?utf-8?B?b25iblFTc2NhZXFpeHJ0bUZMRUxXQ3pYK1ZqQkFsazNjRFB4RXQ3c2d3aEcx?=
 =?utf-8?B?RlRoV1NXOGdRWlZzNCtQNm1PRmpDaVlJRnhvR2RrekNhWFNRMUFZQUZIcnk4?=
 =?utf-8?B?cExORmQ5OSs0UHd6akZPS1FGeFJ2d0tTMmR4R1l5c0hvcUV3OEZOeXlYS2ta?=
 =?utf-8?B?SXFqZW9wT0I3QTNVdTlPM0VnY3ZDUjhaRy81SHZZNmg1cU1jRWNvMDUyZnNu?=
 =?utf-8?B?Y2VmRnFOTWZnUkJjd1RRZ2IwUkpYWmx4VGhuT3NwcHIycGZPa1pMREowbW1D?=
 =?utf-8?B?aWtRSFRxL2hFVlc3b3Jsb2lEcStpYXNPaUY2L1JpSW82dlYyR2t4UVRIcGFt?=
 =?utf-8?B?eFhicnREcFBobmNuRVFLcFpEWGJzRUR5V3ZvY1FpVUFVckR2YlcvaGhWdmdD?=
 =?utf-8?B?UGVLQmx6d2hhdmVuQWtnRUdZb1RaZm14Yk9rWWYxWG4zSG5SczYxK1pncDA4?=
 =?utf-8?B?S2doN0R2VjJRYTRRUFd2RUExOEtSUXRBY2tnZy9jQnNCOFlZWUd4TkJVTENh?=
 =?utf-8?B?MjZzMU1hZUc5eVBFTkwzY3EycGRNZmptSTJSTDB6OU1uVzJ3RDg4dWNQaGcr?=
 =?utf-8?B?NXJkeUR2VXZ1bS8wUmNWRHY0Y3Qxb3BvM09QbjRKUGVsK1dxR2dNSlVUbG9M?=
 =?utf-8?B?TEpVWlJERmI0bXVsc2JFNmduRmRXM3lVcU90VlduVXFMSWMzS2ppUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de36c779-0024-4eb1-599a-08de605ce406
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:08:41.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUMLrZzltd/kKO5Jxa3rM/33z3UJw/dXr0hO3xKdTJ4n91M3FchRDZM4M2X4v9Q/ZOBW7eKxW7i44gi9YBIe7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758

On 1/30/26 3:58 PM, Gary Guo wrote:
> On Fri Jan 30, 2026 at 11:36 PM GMT, Timur Tabi wrote:
>> On Wed, 2026-01-28 at 20:28 -0600, Timur Tabi wrote:
...
> However, when debugfs is enabled, but CONFIG_NOVA_CORE_DEBUGFS=n, then using
> debugfs functionalities would *not* be compiled out (so, for the `Dir::empty()`
> patch in the previous iteration, all of the debugging facility would still be
> around with CONFIG_DEBUG_FS=y and CONFIG_NOVA_CORE_DEBUGFS=n, which is not
> desirable).
> 
> The straightforward solution is thus sprinkle `#[cfg(CONFIG_NOVA_CORE_DEBUGFS)]`
> everywhere where debugfs is touched, which is non-ideal.

Another straightforward solution is to not have CONFIG_NOVA_CORE_DEBUGFS
at all! Just use CONFIG_DEBUG_FS. That cleans up everything nicely.

Furthermore, that appears to be how quite a few other drivers do it,
too: a quick search reports 117 uses of CONFIG_DEBUG_FS across
84 files in drivers/gpu/ alone, and zero major DRM GPU drivers with 
a *_DEBUGFS config option.

So I don't see a need for this granular per-driver approach, for
this feature.


thanks,
-- 
John Hubbard

