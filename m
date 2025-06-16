Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8447B1DF244
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088251; cv=fail; b=bI300HT8d63s3yzYoNLKc9e7YJNLCFZ0IC86fY+CjiYvjydXiI3Q1lk54SIHpXDce7ZtYuJYcTAZ7fobQ7+wgVkGS8lT3uRkxmMikZZgJ+ngnFHgWOHCwNpVBQTTpV8Jv18w7KEVYeIHLP4LUvFIddhJlaqGe3oqO5rViiqlAHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088251; c=relaxed/simple;
	bh=WpErxLROOXYsAVHMKI4HlLAhZhQL56M6WqkYsdAAvOY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U1CsJo06O2yFzinyXoRt+uv/zHmeDw/aU4Sb3enhr8fc84enfyPk/4o5bfvTeu68/QmuSadB2wNw/SPAIEyS2G2/SKJXnAQeKCOTM0MSRxzHzY8yguA94TGuTWXVOdsY80XhGbh5zywR1VocRyuKrL9DfI82BjdFgfGw0i7R52M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VO7nEy7h; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VO7nEy7h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGclVy/GNLXokhklbLLXCB+kP6RH8BHyy5Io1pBQEqlKV4hAR+C48q5ZljWUT5Jd+0YEpsBaAcziaFAQmfG7hoxSSWJryIY9g0G7r5OZ1HfioBM1lRXbsII8xMM8EJQvBgrW4xncIOUNNGTIbR4CW3QNxn7kRsLgLok2LSo4mUfuTmnxK6gBVI5jz3dZl9CLsmZ50QlzgvMN9aguinTlOy2WH5WdW9MjW7RFn4MuqpJL24i4EChYun9ogurkQHSRveETZOc8/9QF2S9CVFUA5iFx+FmnEAfJqkBdcXnIBDVoGpEl+Gz2asFqIj65eXxjumULdJVU/FjN/Jcp93tC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpErxLROOXYsAVHMKI4HlLAhZhQL56M6WqkYsdAAvOY=;
 b=YUsRGX1xa7lHyze8z1FcClOED0gdgTMIcn+NFIUj2T/wybgn2nIqiQEZC1kD0zc6EwJtqFN0svp3UHoynIiX2DN3KYTi2BUbZGCS8R9JSe08D41As3xXS4wvSu9YWF7AtiEkIPl3Bfh2+DIl+GZLT3bq25GZzt4CXzyJgaPl41TkWNlW+/98eIYMpYVW/CziJEOCxrpyfnGU4L6P6ay1kCPOhmkBpw0vyNUxs5a+DK0c6PNP4D4Wka511JwtH98O9cLMrFznwla1U0Pz80Aulq8PbqWMUdEfH8A3pcZboZxDe0HGXrzjami9tdZGZO28XPyz9vCYO1g3DX3yOXJ2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpErxLROOXYsAVHMKI4HlLAhZhQL56M6WqkYsdAAvOY=;
 b=VO7nEy7hPbgF4C0P3cfUZVscAx2E/IBgpc0w3EHMi2fdOhGeixD87OJOtX454hsKD0WvNnzc7XtmCfQYNcIr8wujMuCGil0MpPUZ9udBfyi3N1j724jPcrKkP3pNFS1J0ljMWOSaqcSZBn6Xdj2gCsskHS13bpvaAuQeY+G6QKy2cEUp9oIbeZn9f1x9j7Bx5xLVzmCoooJ1CW7KcyeoU1IQTposJ3u8lZJhOarecCRUvqZvp64NTLt8D9fTqe9i+OXOSXHuiKDRoXyJaME7W7KBn7jJBINxmQpGOy7hsHiWxipILpcUMir2H+j1CDF7FalwcOYa4d7FkoDgkgt1TA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 15:37:27 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 15:37:26 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb2Y76GidriUYRM02FngySpVCBwLP8FOaAgAVrw4CAAAmKgIABYKOAgAMLKYA=
Date: Mon, 16 Jun 2025 15:37:26 +0000
Message-ID: <62d73bf7771852188d915fbdf5dc23f7d9260121.camel@nvidia.com>
References: <20250609223606.2897030-1-ttabi@nvidia.com>
	 <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
	 <123f682b56e1ecc24bb2dcc351f536641920fcf0.camel@nvidia.com>
	 <922a39510eb74ebb2e463d20d7d5cc5c23316155.camel@nvidia.com>
	 <DAMF71ECD17E.7C58IZHG946V@kernel.org>
In-Reply-To: <DAMF71ECD17E.7C58IZHG946V@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CY8PR12MB8068:EE_
x-ms-office365-filtering-correlation-id: dc6b19f2-8baa-451c-5e40-08ddacebb27b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c052bXQ4U09ZK0xQR0RNdkNxK2JPV2d6Zjl6M0VWOS82MUY1bzRIQlFPMXNQ?=
 =?utf-8?B?QzRwMkdNdHVXd2RVVVhpQzZ3NWdVMU1ON055RmtieFZmZkJzMUhFd1RaOTg2?=
 =?utf-8?B?dmdmeGNxUDhTTEwvdWRKb04rd1FDaFl2UXlxUlBxdGxXdVlvMHBNMFVUV2xq?=
 =?utf-8?B?bWJRS1ZzTkZuTUJyUDB6eXloMHF5blFrMzNLc2l6SGZBNVByc1NxdndYWHJl?=
 =?utf-8?B?RUU2YnVaVUl2V0FySFluMmJ2eXU1b0QyMTVkL1NwRjlEQXBKZzUvVDhOemdI?=
 =?utf-8?B?NEJaSmVnRVdycnA1Nmh2VzZrYjgza3ZtTlpLcnBvK1VWTlNKYnNvTlFZMHVF?=
 =?utf-8?B?NjJpVFVaSkI5QUpLcmVESFpBbHVWTlVTWUxpZ1Y1N2FMZEM3SUhKWmdWOEo1?=
 =?utf-8?B?MlRmUnBOdUx5ZnhZcjhXVU8xOXJhK0w3QUVFRnJJeHNiQ2xTWURUVXVXekFF?=
 =?utf-8?B?ZVAxeVJhcnJpRHpsS29jOXoreWIyaHFuTVZjUE90TGZ1aUFSa0N0NDVwbG0r?=
 =?utf-8?B?ZVhCQWF0OWl0eUY4TnpRc2hhVzhkTURqSnRCWjFwZGJ3TXBVYmVCRnZQOGwz?=
 =?utf-8?B?bWkrNUdSNktud1ZTblM5T2t4bGhwQjhiSnJzZk1aR05TUXljUENra3Iyb05X?=
 =?utf-8?B?TVhYcXFDcWJzVEl4QTI4bXlucjhQTWh1TVFZT1FQOTc0bW95MXA1VGRZVkdE?=
 =?utf-8?B?VmtDMTl4T2hMSFdvcDVYOXpkQmYwTnpMcDZtSTZMU1o3QytqY2I4MFFXaTlZ?=
 =?utf-8?B?YWxQbU90VjNpdkMxOHQ3Sm5MMDYvbVV5Rnc3a3V1QlExQXlmL3dVcUVueHpW?=
 =?utf-8?B?dmt2bFk0TkcrSjlLSlZwVnNIMGZvcFdZQXEvcEMzL3Q1cEpkckhvYmdIblFT?=
 =?utf-8?B?c3JXOW0wYnVsZzhlZ2FGV2J3ejcrYTcxbldtWTBQQXdQbzlMdG5tSXFUUEVv?=
 =?utf-8?B?U1JjKzNPdHVDbm5QTnZnQ0t4Z3IvRFc5YkNQOEM4LzZDNFkzRmNLUHUxZHpa?=
 =?utf-8?B?STZYYkF2VmZqK0RjQXVKZTlQZ3JCeEhYcGYveENndHVZZG9IajB5VEl2SXVr?=
 =?utf-8?B?V1Y1RVRiOFFnMTF1WVlXUjZ3SVZyemFKSXRKOTYxQkNQSFI1YkUyVEhzaEFr?=
 =?utf-8?B?Z1JPNHZFM2I0dC9lcE5vMEJ0SzhuejY0S0Z2OEFwMmFsWjhYTTJiK1ZYN3I4?=
 =?utf-8?B?QlNXRlJMNzU1Znk4TWpiZHJWMmFJZk9mWkVkcVRMTXZyUVRtMU5EaTdvUnNs?=
 =?utf-8?B?REpvMHl5ZVcyclAzMkVtblJkNzd1U0FDQWJwNUpMajNVaVVUUHVQem9GQTRk?=
 =?utf-8?B?Tk9wbTV6ZWQxVEFsQjVmb1RtNGJWdmNlK2Rva2pTaUtyditscTdQMEpVTnN6?=
 =?utf-8?B?Q1VRUGNRdEZYL09HYzg3aDRwUFZBUVZPS2l4c1g1QUQ3VzhoMFZ5UFA1TnU2?=
 =?utf-8?B?RjFHSHdyT1NOaUhHZ0l4STFhdUVoS1h2NEF2TzdGZWY2RTBWczQxTitjK1pm?=
 =?utf-8?B?R2VpT2hxT1NsZ3FHL2lCdVF3MnJhUlFqaWhHRVNabHE2Tm42d0EzTStLODJt?=
 =?utf-8?B?MXJlZFgrQ3k0TTE3QnhkdHdTYVNhaVRrQUZZaTl3eEZFbksza1ZxVElRWnB6?=
 =?utf-8?B?Y2tpMmNpckt4aUFDWmFacERDc3VXSnVsV3FKT21PWDRoTUx2bWhFenh5ZGNn?=
 =?utf-8?B?RzFMUVhrcmNMQ1hTSHdONkpSNHFqR3pVMERsbzM0Vk9RVVlONzRidmtUd2c1?=
 =?utf-8?B?NXhpS1RTamFiZEZ5b1lCQ29yWHRwUTBVS2ZsZXlKTmJaRDdYK2dRQTNaY0ZU?=
 =?utf-8?B?aml0YUFlNzAxYmNra2o0RFM5c3lYOEtYdjlxZ0M3K3ozSSsybVlSOU9HWHRN?=
 =?utf-8?B?UzM3WDJ1a0h5Q2wxWjRlb0lQUFNwNWxQOXpFVDVqVDdYY2Fvdjk2YzQ2eDdN?=
 =?utf-8?B?clBoRTAwUi9vZkJWdTEyU0V3ajd1RjdkSFdSaTNvT3hOU3dpaTNJVU9MSUY1?=
 =?utf-8?B?UWVPTUw0YnZBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0Y0UExZOWhUWDV2TVBpYmhhMnp2NHBobXJkSW1KMzFqUEZCT0dZd2lud1pi?=
 =?utf-8?B?SEh5cnhxWVBzMm1qa0xTcXB0Y3BwMDgwSFZsVjV1OS9VTVdubW5YVVhMdzI2?=
 =?utf-8?B?OUtpc2syL24vT1VLRWl6NlBMQlhpYjJscnBDRysxMi8zbmNoTXRLKzhRYUZQ?=
 =?utf-8?B?S3dkVWZVZ1o2MHludFk4S25vWUZUS3YxZGZDL21ZYU44dk0xR2oyazNlb0F0?=
 =?utf-8?B?OXlLVldrV1dRNDY0ZXhpdUgrcmRhMGJuR3lJVVZlNGRpS0RhTFE1QmpWeEZi?=
 =?utf-8?B?aGZ0dktFSGIwZFVPMmNBUHUvRkhlcStVajZRZ0w0Tk9TbWlxNEZvaC8xSzF2?=
 =?utf-8?B?UU5uTS9vcEg5WGdsZVBET0dQZGxRdytwUm1tSXBZTnRPRjFOZWJjWjdOTWtL?=
 =?utf-8?B?K3B4aC9FSUI4QXhSbndXMFNjWk1tVXQ4L2l5SFRwQzBzY2pFZzFSOFd2Ynpp?=
 =?utf-8?B?dlpSNHoyck5rZCs2VGtNZGVCRjUreEFRbkhBQ1loakQrdzA0azVpT2k0L2J3?=
 =?utf-8?B?RGxUZGRpNVJaNk9NTjVScmxhckZBN1diTVJlUjltZlB6N01rOTFmZHhEWEJF?=
 =?utf-8?B?eGpWSTBwYXFOZmtoZHVXaWlFVERETFFxN0NKendzVDcrdFdrUlBaSm9hbjA5?=
 =?utf-8?B?ZDNpMHNBS3BSanJDSk4yaGhrY2lEK3ZwVHR3VG5JZDBOT3Jnb1I2dGRKQk1X?=
 =?utf-8?B?a2dZQkkwYlp3L1REbEo0eDVVS0VCZDFMem5ncVpaaVBFOXJiZnFTdHNCUjlX?=
 =?utf-8?B?b3RORkdQRnUyQ2dkRDJneVR4U2Zwa2dvNEc3OGw3OTEwaHArR0w4ZnEwNGpG?=
 =?utf-8?B?cnpuOE9aY0RKWFRHeWl6NXFzdy9oMFJSd3hoeVFHdGczSVJnVlBqa1Y3UUF2?=
 =?utf-8?B?bmU4VjZzQ2ZrR1BZMkJPTEhjUUVob2psSndQZDA5bUMrdG1nZ2NFOVR0U2ht?=
 =?utf-8?B?L1VSRHhUdW53MDV6bTdkU3llcGQzZE1YRWpMS3lEdS83dWJEYTRWZ2w5enBy?=
 =?utf-8?B?YkFJSEVHcVVWdUMva3VRVnZ2c3dUSUkwelBkYnB1dDNmSGM3SVhYUm1IdUgv?=
 =?utf-8?B?Sll1OFJ6NExnK05JanlUNEV1WmxEUzBEZWk2S01DdEVKU0JLY0xISTZuU1FV?=
 =?utf-8?B?Sms2UFVMdWRZTFBPd0tEWSttTGQ2bEYwR3RvTHlqYkNpK2d0aERSRDh2YVhH?=
 =?utf-8?B?VUEwTitKNmMzTmV4RnVNUzBudUZOTlFhMmJlejdiRXlYVjNMMU11UXlkSXF3?=
 =?utf-8?B?S1FmdE1XRFlYUXIxVHp5QUhPQW02Mk5EdzlLbms1azJUYm0xZHdLSTlXbUIy?=
 =?utf-8?B?bE14OXI1SU1uUCtaY3BYTytybS85TGtnN3BSTVA4QmdCL1Q2eXZzczZ1RTdy?=
 =?utf-8?B?SnorR3c0QVk4ZkIrdUJpemVmKzlNOUlwRUFOelFXa2Z6dGE0YnpaRmQ2SWI5?=
 =?utf-8?B?eEc4OCtBNm5ncXV0Y09FMU1EdXh1Zm9SZkxKalJWckxvaUpZLytZSmhGRjRD?=
 =?utf-8?B?aXViRU0wRjAzb0g4T1hBNEpMN3NpNXptd24yL2xQOVd3VG1kSGxQUnhKNjJw?=
 =?utf-8?B?NEwvUyt6MDh5ZTBENm41Qmk2cUFVWThZaWYvRjduTkJRM3ExeUgya0FGZlZu?=
 =?utf-8?B?SlM0VEF3U2Y0MXhMWUxkdmtJVzdjTy8xNkd4Y3l0aEgvM0ZZcHQ2MVFHNUF5?=
 =?utf-8?B?NktXcGt3ZmZVQVNCV0VNOUlJelh0eVorcVlnRGs3dlpLK2FybGg3b2ZCQmhq?=
 =?utf-8?B?QWdQb2dmbHd0YUVsVEFjZnZaZkRXMjRkUitiMkk4eEhLaEVzT1d3R2h0UWt4?=
 =?utf-8?B?VHpNanZxTzVxZTJIckE0dHdmTjFtS0hiajVGb216eFhDZ1Yvb0tLay9NZ2lO?=
 =?utf-8?B?U0tRN3JjRUV3em83MjNTeVFXQW1SbXd2Z25Cak5tZ2NPdkQwanBRS0Vzc1Fv?=
 =?utf-8?B?bkdXbFFPd0ozQzdXTFkwenpyR29mMVJpdHAxUE55QnQydW5QajBlU1NqZGow?=
 =?utf-8?B?SlVhbW0wVkZyQ3pGZS9EZURqUXE5ank4SFhRUUo0UENJUzdlMnJYUlR2em82?=
 =?utf-8?B?Z3dkZkxnWUdXUlBVUHNCVWNmVWNrZFF4ZUUreWRnZVRXbzJ3VFVSMnpSZy9P?=
 =?utf-8?Q?dE5sMR3zOdO1N6mwlLF7jEkM9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEAF977EEB184E458E762C076737A774@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6b19f2-8baa-451c-5e40-08ddacebb27b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 15:37:26.7643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yOYHglrVPPEmGnlvS5EJDGep/6cHHEw8A2C5V1nmipJ3HsxnOwPvKMWXlmmlvX8G78RqRj92h6qQiqHa0vQPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068

T24gU2F0LCAyMDI1LTA2LTE0IGF0IDE5OjA4ICswMjAwLCBCZW5ubyBMb3NzaW4gd3JvdGU6DQo+
ID4gDQo+ID4gTmV2ZXIgbWluZCwgSSBmaW5hbGx5IGdvdCBpdCB0byB3b3JrDQo+ID4gDQo+ID4g
CWFzc2VydCEoc3RyOjppc19hc2NpaShGSUxFKSk7DQo+ID4gDQo+ID4gSXMgYHN0cmAgbm90IHBh
cnQgb2YgdGhlIGBjb3JlYCBtb2R1bGUgaW4gdGhlIGtlcm5lbD/CoCBJdCBzZWVtcyB0aGVyZSBh
cmUgc2xpZ2h0IGRpZmZlcmVuY2VzIGluDQo+ID4gdGhlDQo+ID4gbW9kdWxlIGhpZXJhcmNoeSBp
biBrZXJuZWwgdnMuIHJlZ3VsYXIgUnVzdC7CoCBJcyB0aGVyZSBhIGRvY3VtZW50IHRoYXQgc2hv
d3MgdGhpcz8NCj4gDQo+IFRoZSBrZXJuZWwgdXNlcyB0aGUgdXN1YWwgYGNvcmVgIHNvIGBzdHJg
IHNob3VsZCBleGlzdC4gV2hhdCdzIHRoZSBlcnJvcg0KPiB0aGF0IHlvdSBnZXQ/DQoNCiAgICAg
ICAgICAgIGFzc2VydCEoY29yZTo6c3RyOjppc19hc2NpaShGSUxFKSk7DQoNCmVycm9yW0UwNDI1
XTogY2Fubm90IGZpbmQgZnVuY3Rpb24gYGlzX2FzY2lpYCBpbiBtb2R1bGUgYGNvcmU6OnN0cmAN
CiAgLS0+IHNhbXBsZXMvcnVzdC9ydXN0X21pbmltYWwucnM6MjI6MjkNCiAgIHwNCjIyIHwgICAg
ICAgICBwcl9pbmZvISgie306e31cbiIsIHNmaWxlISgpLCBsaW5lISgpKTsNCiAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eIG5vdCBmb3VuZCBpbiBgY29yZTo6c3RyYA0K
ICAgfA0KICAgPSBub3RlOiB0aGlzIGVycm9yIG9yaWdpbmF0ZXMgaW4gdGhlIG1hY3JvIGBzZmls
ZWAgKGluIE5pZ2h0bHkgYnVpbGRzLCBydW4gd2l0aCAtWiBtYWNyby0NCmJhY2t0cmFjZSBmb3Ig
bW9yZSBpbmZvKQ0KDQpTYW1lIGVycm9yIHdpdGggOjpjb3JlOjpzdHIuICBJZiBJIHdyaXRlICJr
ZXJuZWw6OnN0ciIsIGl0IHNheXMgdGhlIHNhbWUgdGhpbmcgYWJvdXQgImtlcm5lbDo6c3RyIi4N
Cg0KQWZ0ZXIgYSBsaXR0bGUgbW9yZSB0cmlhbCBhbiBlcnJvciwgdGhlIGNvbXBpbGVyIHRvbGQg
bWUgdGhhdCB0aGUgY29ycmVjdCBuYW1lc3BhY2UgaXM6DQoNCiAgICAgICAgICAgIGFzc2VydCEo
Y29yZTo6cHJpbWl0aXZlOjpzdHI6OmlzX2FzY2lpKEZJTEUpKTsNCg0KVGhhdCB3b3Jrcy4gIERv
IHlvdSB3YW50IG1lIHRvIHVzZSB0aGlzIG9yIGp1c3Qgc3RyOjppc19hc2NpaT8NCg0KQWxzbywg
aG93IGRvIEkgYWRkICItWiBtYWNyby1iYWNrdHJhY2UiIHRvIHRoZSBidWlsZD8NCg==
