Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013055.outbound.protection.outlook.com [40.107.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05137163
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768352400; cv=fail; b=ko3DLbx2fPFIN4fAGUMLL8zvnDfJNy5oQ/g3Mn82M27o2gTxn/qijOLHqDeyD/oI0hEf0eAHCl6c8rvGloXvHtTPFC2eSd4QZS4Svy59vxBn0pPH+dj8F2O3iyqwt+e5S9Rb3ds7qVmv1lTS/QyEeoEVze6O3hylcBJNzZl89JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768352400; c=relaxed/simple;
	bh=gbWL9xaCG8dU027EpHF8CBet627gkaW8PMwBVQF6E5w=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qd6+xOaAnXZc8jNB3HXh0gH6tOquZdFT/uXrd1PutzJNw+/+g8AR/IQPVF3xDGRHoj5QKzwetVhIkrLUnKNPNlsUgFOQrD+/UsLQnw+Za5Rt0BoSi0QaCWx+SQvKLvj9bu1B7jdUSFXzWrhpYnAVcM0ownaFzpo+blpn/6me2q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jXgqSvqf; arc=fail smtp.client-ip=40.107.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jXgqSvqf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUlQRMApQC0bj/5jmKNQNaEdY7ad0/Dh58D9euLLWquBT3l9ks86E0zXU0mWVtD1YO1KBsDxRaI//iRiOlm5pfim4T8vhoILcAUIHdEJSWqWYgUfZMCs/mi1DDCnQhYRr6HomwWPBGhw+XI49AbQVS3mRU64tTTj7r9gwpWEW4OlRV21Nww40if437lsL8pgaxSwp38tquPCns4db+6bguWxCUiiKFx0CwKOLpLbrvvUTL20ocT2sAorYw4epkVzMBU85yZ5sKT5t4kykE4gc1dlgaOlrj5y9/VB6hNe07P/dEUrXkeYalFw5VXqtzxaJ1ulJ/EopIx6UgQh+RDeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mooV1JRyJ7KSuyUbcPXP8ME6MN+ZoGEYEmteBYJleB8=;
 b=hHTk3oD96hCCHJfYkVqT11zZx0hBe7F5mUdIwzDzQ7j4hi49vw24s5MXWwdYEUhHeHskutxXc36U3wv2W+fzA86o0sgXdKJdsXASJhU0xD/da3fBYQmpmfLhJ74OGLlv6qfW1QcapXWKzjmTiAVTqIeILQ3lQjW7BEr4/zGIF48ESjtyEqDkx65UsFOarw8urkm5njgkBoVOJntLT1VsHgqXF/s96dpLrtiw3YBRFSQpxtPTWhwsT11D7IuCVxFUC9JjiRjdqLVQd6+SmJq6ImIYT7yBzVk2emkUvFTKFwAFjQbucUZLX6j9DTVA4Qmm4w2nK4+s6I/doH5IGrG9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mooV1JRyJ7KSuyUbcPXP8ME6MN+ZoGEYEmteBYJleB8=;
 b=jXgqSvqffMaOWt6pi/zNZ4iIPfDZRzoEWOlhf/oAXkC9VHIWm9HSCMLxvqnT9iV6eXov9F4A5RtyDxvyc155G6GwMlQSaRP+ctzh6CVOZsT4f8w6Hl2NBHWnGV5mkHxJ5koPe5E39Pt0gMMvMpYTgz0b1Ml/TU1HiWvrXBfE2eWycv4iusvoVcy36jY1zBgt9vOO73cQr0S5Tc0PcRhSC/92C8S3yUzLZYLjtj1r8pb+kbVYyHAGAzst/sSrZrfmjTFFyuVmhOZitqSntPYQ9Brtwzpxm9eP9NGWU20s6ZY8/gsCQnjAowoUrt7BeyumnrKw7bIWJbQuAi2sQW7NBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 00:59:55 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 00:59:55 +0000
Message-ID: <edae561d-ad5f-4699-b5ca-c62f3a5a4383@nvidia.com>
Date: Tue, 13 Jan 2026 19:59:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20260103045934.64521-1-ttabi@nvidia.com>
 <20260103045934.64521-10-ttabi@nvidia.com>
 <0fcef086-c309-4789-9ab7-a3c4581da6b7@nvidia.com>
 <227c49fb7b21ad372c1d7c0fcbf1879ef7b7f76f.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <227c49fb7b21ad372c1d7c0fcbf1879ef7b7f76f.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e740afe-1bce-4766-b232-08de53083b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkNZVlJKWkdpbkhhV0dqenhzM1FiODRKNlc0ZTYwN0dtNGlaK2NDaFY2QjlQ?=
 =?utf-8?B?YXNmVVJ2STdvSHpRdWowNFFTTnNnS0JHaHhrQzI3M2ZJQ0lUb0Y1endWWlFD?=
 =?utf-8?B?SGgyL05IbEdFTm4vQW12K0g5N3JmN0IyWnlHRHJLa0s3NGJ0SWRLbEJXU0F3?=
 =?utf-8?B?a3VCZ1JHb25wd2M0SUdVeWh0UkRNT1RuYkYxNlorZnEvcW1Ka3BYYW5Wdi8w?=
 =?utf-8?B?c3M5VWlTY211R0FOYnYrYS96MVVPYnBoU004Z3piOStnbmhWWmpjSGhMODVk?=
 =?utf-8?B?aXZSR0xPWUlXa2JCSlNtbldWUG5yd2xEbXRtdWlmVGZIdWpJOGV6S1VyY0hE?=
 =?utf-8?B?T0hHZTExeEw2WVZxeGk1YjR3cjlQelFaL0xRY0xQM1BBa0VVQ21rRkpiYy9s?=
 =?utf-8?B?c1YxdWNtK0hNTGNsMmRRSWhXcXd3ZWZYZWJ3eWRJUGFGV1oyRUU0UUNJNkdq?=
 =?utf-8?B?aDVyc3RUY3dlQy9BV1BWVzh3UkFENlk1SVpvajNPTE5DSUFMaVRpeStkdkhO?=
 =?utf-8?B?TVoxZnpnZGc1YkxsK0FVK09nV3VxeEhsMTZEWFhLRFhZTld6OFdCUi9VQkhL?=
 =?utf-8?B?VTVKc0kwOFFmbE5NWHdxRUt3TUk3a2ZlNmFMTkFLTktPOGRFVFNVb2w2VlU5?=
 =?utf-8?B?emhiNlpialA2bUt4dS81UUZZTHBWaTFRUW5nN3R5Slh0Ujd4bXVOdWkwdVU2?=
 =?utf-8?B?N2t3ek5OeldqYjdONEQra1ZwL1hSejNJanM1UDBrRVM4eXM1NkM5dmxUdUJH?=
 =?utf-8?B?ZlhSQTkvNlVoa1dwdzU0cXRXT01Rb0ZSVS9tZGlLTllwT2JhK21YTk93MG9G?=
 =?utf-8?B?akdscXlQSUs2ejBuOHphcGhSUmRuRDJoa3VMK3g0MDBGcUd1czBhUmZSYTJZ?=
 =?utf-8?B?NmRTSWZ3UTVkYVllZ2pRalFCeC9SelFaN2tqam1NMWk3VktxQ0RDRDF6em9R?=
 =?utf-8?B?UTVlcXZwUjFRRDlBRjl5OW9KUUFxQkdRMGdNOGt4OWV1UkNzNkp0V1Y1QUVV?=
 =?utf-8?B?anllRUFDcS9LZWJUb29KS1FkY29DNDlxTGdQNFN5K3JmQ3NZRzMvNmRLQXQ5?=
 =?utf-8?B?NW1JaDFDRkFXcXhvalNZWERkZzhhTnJkWTJtRzZKb3k1VEJBSmRmV0VQR1By?=
 =?utf-8?B?cUJFWHhteDQ3d2tIenUwNzNBZnUzUkhmMlVDcVJDYWp3Y1hHT1FTbGU5TC9I?=
 =?utf-8?B?S0tzcFN0V2NydGNtd3FKZFFPSHc2ZkNuMS9QaUtBM25Ec3JuRnUzL2hwWVly?=
 =?utf-8?B?ZlZJZ0FEVTRza0lJVVhLSmRtbVJ5S2tBMTg5OVd3cFNLSkFxUHJTd2Zrd25L?=
 =?utf-8?B?Z2RKQlN2WjVPMTlOUTRENTR0ZTBkNC9zR21wYm1EbGdwZnV2dVYwV0pya1Uz?=
 =?utf-8?B?OFZYanRUc2pxY3ZJeGVmejlDRDdDRWZYbHJ6YXhhWFZUalJwMkU2b1gzalV0?=
 =?utf-8?B?N00rZkNhYXRWWmM1RlYybWIzQXMzWjFyUVlROTB4VGljcmJ4MWZ2T3ExdUpK?=
 =?utf-8?B?SlJ3R2trdGsybS95TWw3OGpqM3kxazdiQ1NjNllPVEdHR254WUdsTmlKZ0NW?=
 =?utf-8?B?OWQ4NlBJVURHbG51ZHZOZktwajVGOGRKU3lhS2RyNzNZVFl5NjRIQzBnOVZN?=
 =?utf-8?B?Z2lBbDFrMjBySloxZlVEWmNvVWxERTdlMXpwWmNwY0VUQ1BuODc3N1lubVZ1?=
 =?utf-8?B?U2diWnB2dHAzUS9DMVVpUlYzT3BJMERtUlo1VGo2Nk9BTmZhMHVXelpob01D?=
 =?utf-8?B?ODA4RUtZaGRlQjJVYWZUQ0lOT1N4dmtMa0dPdjVaMlZmTmtPbklTM3FOOUll?=
 =?utf-8?B?aVdFUk93NDVCWGZYeVlQcWV2bnEvT1YyNTFhVlFUVnNmbU5ldmJHR0hlMlBV?=
 =?utf-8?B?b0MvY3dVVnNlZmpqRDNjdFViRW1oTnlZV0Z3cFh6V0lCTFh0M1dvWVhMNFJL?=
 =?utf-8?Q?H7gmEvO859sinULtTUN8lrDHunyaFy23?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1VDUWs3aEtpNEd0cjNBNU94YzVKVEJiWkZ1TGhmc2h2TlhRRXhRVWhaOWhs?=
 =?utf-8?B?bUhiWnJTMW9DdEcxNVpWQWhtbSsxVjV3Z3dpVGJIanR6SUs3cEtMcmFuWXJl?=
 =?utf-8?B?THhaOUxXclJFTFl5NGdvSzZOaUkyYWtmYm9XUE9HUnh0eUNpZnNyOGwvUTNs?=
 =?utf-8?B?bnFBQnZycnRIalpFMzVzOFgvMkM1M0NKU3VVOWV5VHpJaFhqc0xjak1Kbkxw?=
 =?utf-8?B?cVQ3Vm5vQ3lNV0lLV2wvMDRnczVjSDV5Lzh5RzMrc2ZMSHV1WEJwZU9LcW9h?=
 =?utf-8?B?MnZjNnM0WFdLQzlzZ1h0d1NFRm04RkFRcE1FNkcxQ0hjaDY4UDBpTWdyYUl0?=
 =?utf-8?B?ODdZNU1EUHFJRTNCRitmc3l6dEIwdWtKa0cxNHZ5Unh2dHRXK1c5bVpESlNo?=
 =?utf-8?B?UFhGazlJS0RPRWQyTHdiK1NLa2ZRZGNIbTdrK3A1SVd3WEt2Kzl0U1d6L3Vi?=
 =?utf-8?B?Q1FraGlMeE93Z1Jocm9RUzIrL2pxc0lxbGE5eWx5TkFSdHYvMy9KdWRMaWJz?=
 =?utf-8?B?bUtqZWxJbUU0S2dwR1JwbnhxdzdDU2dBYk9ENU9VZkhaSWNBYm9VUTUwcWwz?=
 =?utf-8?B?QzNqSUJSa3p4UGtVRk1uMWgyMmh5UFVSelRkaVJmTlhTcnhxL1pXejZVci84?=
 =?utf-8?B?Q0lUcjZ6dU95NGM2WHFEZDNYMGtLaWRNTXZlZ0VXUVZWdW5vTmE1NWFGZFNN?=
 =?utf-8?B?QmhLa0FEdU83dlFQWHlBQlJ2dVg2cTUyT3B2WUk0MU9Sd1pKWWNic0xJYnRl?=
 =?utf-8?B?T2pSWEh1Umxrd0Zhd2FCaFUxZ1AxdnBzc1V1cmVjdWZwR3dxTkhsSncxOEMv?=
 =?utf-8?B?QXp0L2lQQ3FoUk9YZzZ1SyswWFZSOHlHeHlIaVMxVVlxbWFPTmpyTHoyZjNG?=
 =?utf-8?B?V09WUmc5RzZTYkFIcG9DbWp0VStZSTY1N0pQMnJoeW82RkkwU2pKYW04L0VW?=
 =?utf-8?B?b3l3N1VMWitsNm5iMDZCZzhHUkw4VGZMSnRTUHBqaFNhYVhEaG1MUWdPdEI0?=
 =?utf-8?B?aDBWaXRTZWJ2NjRQdjdPRnUyNmlzY0w3bW5QYVZ4UWRXbmlxQ2RTdFJhd21I?=
 =?utf-8?B?WmtYT1ZmRVRyeUxaVnR1TTFxZHpPSDdpVnBNclUwdHYzODZoY2grRUQ1bG9o?=
 =?utf-8?B?MjBNOEdZV3RGUUxiRnpRQTREb3JOT2xGSFNSeHh3MHZQZjJZTkZCS1dDOWVG?=
 =?utf-8?B?WGVVWll5NE1QWW5aRzFLS0Zud0pTTW1HKzhMTFliRU1CYVdGT1ovZXlhSjlH?=
 =?utf-8?B?MWNZelVsNHE0emdSaFk0RU5KMUJmb2NxanA2S1ZBOUM5MmdQbHVIMktZM1Ra?=
 =?utf-8?B?cytUQmxpQUszdlAwTS91NDdpeFZ6Z0RZVmhwQ2w0a282WVhOanFydEFIekJq?=
 =?utf-8?B?ZzMzZzEwTEwzZENMbENoVHJNYlZvZi9PUnJwZ1RFV2FPOVlXSEkwc3JDdkdh?=
 =?utf-8?B?cnErN1FGSDBqTHpHRm14ZGNpZ01tb1hOT3ZENEU0aVgvc1FhbU5IZXVKL04x?=
 =?utf-8?B?LzRPbzE1ekF2K0VyZGRndWg5alBNUzdQNWZUYjZqdkFHNng3NnNQVFNMZ0Jm?=
 =?utf-8?B?MW9hdk1rd3hITWlyWlpUcTZacXUyaE40SXBiY29EamlqMmFOK0VST2h2Ymoz?=
 =?utf-8?B?c25MVHg1Yzg1SXhWM2JMR0kwWkJuaGxkZlBrelpJdi84bGtjUXdmTER5WU1q?=
 =?utf-8?B?Y2J2bGE4UGh1bjU5dFRrdU9OeWswWlpVQlFWM1lOdGNTZDJVKzhhQWdJbm4x?=
 =?utf-8?B?NWZwZHNoUlh0TmV3TTd5NkxDRXpNSGlKZlg2Rm1sSUJQMkZ0NmYxZGVNUERs?=
 =?utf-8?B?dHFpbytJVVBaNERpejdtbmVDNWZKQWNaMEFVaVNNWlFSaE53L0k2eGY2ZTZN?=
 =?utf-8?B?ZTJSWGFrNjI5SzJjZnhKN2o1amVjOGN2d1J4SHJ6TDdkNmpmV2dWRFMvTy91?=
 =?utf-8?B?Unpjak9LaXNic1RqdHZSQlBvL1dmQmF2bkNjYzlpTmRuUlplS0tUZmFibVVF?=
 =?utf-8?B?Ym1GdUdmY0Nyb01VdmpiVE01N1A2OUpQYTJpZjNENUlnczdiQUxDMXlVdkxP?=
 =?utf-8?B?SW1rRmM5L0ozZEdZZ3pBUk0xWk1Ca3lreGJ0VXY3dFRJM1pVUlRZTmRCZG9n?=
 =?utf-8?B?N3YwSnFldHNVRktUUnlSRzRaZlZST0FzcWlEMXJEWEtwVUxZNmVlVVBKQjRH?=
 =?utf-8?B?Wjh2bmJkVmhoSU1PL0ZKVTQyQmk2Z1FIaEFEbHRZTjA2K3lZMnRZRkdTVEVk?=
 =?utf-8?B?OXdERFNXNHNvTmFFSWRteU9rK1IyOVJuQWhhcGhHTFZRRkxZRG44YXhGTjN6?=
 =?utf-8?B?K3orbGlybSs4d2piRkFBVFdGeWJqUkd5eS9zak05LzFyQUVza1F6dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e740afe-1bce-4766-b232-08de53083b1a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 00:59:55.1566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7kHSljBCPCZbTWOu0fY0fEQjp3FlDVVB9UX4Cfi1sZtEGPsE2MXQB/bjF1BqSvfr6on/UL02lczB6JTSP6+0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9454

On 1/13/2026 7:56 PM, Timur Tabi wrote:
> On Mon, 2026-01-12 at 19:00 -0500, Joel Fernandes wrote:
>> Since this subtraction's values comes from fw, it would be good to use
>> checked_sub(). Otherwise, this could:
>>
>> 1. blow up if overflow checking is enabled.
>> 2. len can underflow and be entirely plausible but incorrect, causing
>> unpredictable failures.
>>
>> I am fixing other similar existing issues in nova-core as well but since this
>> patch is in flight, it'd be great to fix it in the next posting (it sounds like
>> there will be a next posting).
> 
> I'll make this fix for v6, but stuff like this is why I think the constructors for these objects
> should verify the bits of the images in fw, and return a Result<> if they are corrupted. 

Yeah, makes sense. AFAIK, what is agreed on is if we are 100% sure of the values
(have checked them before), then we don't need to use checked arithmetic again
at these sites as it is redundant.

Thanks.

