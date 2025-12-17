Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65362E92C3
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 06:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765952846; cv=fail; b=jaNPZSFTYJYjNMPIBpE4cXsxGywNV7E6xn7rQZ1UjJ6s7gPeHc6cehYlHq8SphfcxBJXVbBeMiF5YtcQNPc0XMO+lFTMHZddv8Ji0vLAPjpyYFK2UvcdMY3/1p0HCHwMC4wVs5LSZX1Gnl6yPct5L7TKom2HQtxt8BhoFzYO5FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765952846; c=relaxed/simple;
	bh=YtDYS9/tUbkGhr1vt0R+l9kmGi3qL8R7YGgB067fDgQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VCwu+p9JbIFlhd0AlY1yCQNZhA132QAirSE8bs3B9fcHszi6ST6mC8T11A9aN4AXN4jFkzwH4clFHrSrDT4hmu/pPDNoa87xvxLwUd8swCzJ17liitz6PMpGmdzpLlUXwU59J738yPsvG0XrELuuig+KynZUxnnPWqQGfO4ZokU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LvhP2fOw; arc=fail smtp.client-ip=40.93.196.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LvhP2fOw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uwx0TwjARZmUX5e5hplP71Vmb15x06Tba2PaauJ86mjJYqYSwnlXqr/jaKdrLKVL3n1WX1y2CJEy5QMvGfpQwl+FLiGpGGgKmgj5hQno3g6GKRP6PEeDYMR72RF+dLbXbzp1KZ1LaTKhBqxY8zuqCdkZD+OENiVc+UYyOcTMxm1WMdmP0xyVWNgJpwS+aNdHM+HiH8ncnyTMZzf0bnvYH88m/GBhwReb3zriPOxPNFK17qiG70NA+MWhqoHJTHTt2cDxKVyUk8pz+J+VyfX/uOWVd5nkJKjakmw1pxnEUCq4s2nU1QMfLUzIJCrvJHJUSIZ8N3KmesgPpXUt56rgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6COcyJsMtDqNAy+uPIADsgyP3MiXKrI1bl8Ttpl+8o=;
 b=Nr/Prgao6LNzdHR63skdtBsyhp+qmHJ6Tph41jhmE0J2d42JYhz5deYo86WLtBLx2S8y76qdGAReG6kmlBYS58ATrGs6Wid6t/Ys/QdsBN2MbTlwGhYb1xonhbheP81HlWib5C+wGyV8yWqFB/8wWKzNfyhcZz/OQubjPZsLPQg48SZDGMUTYC0cGn0iBliwghS9CR6vIx6wbF3m3HVcdGvIZvAtM+B3LN93f+2hWSPc5UAweSIbEV+7TI0BAJf4K9/nDN3Gf27ma5T7C2tTXlWc6GUuGdammOqMleq4sU2qmMUnda4oPbFODrxiehgjHF1BaGcZP+tsm6EFzbXUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6COcyJsMtDqNAy+uPIADsgyP3MiXKrI1bl8Ttpl+8o=;
 b=LvhP2fOwM7jF+rZktEID6WPse4aBd+Ls2+Oy2fIHRawSmEG1hl9W88t9QliaqrbswHtgFGeFE5gttFMXApZhQBNLStYHliNVk0iZmwRrkD2YgvCeJAJjerZTYS22f9B1jCiMJNYRgWufVZPiXeyFvsEyCDAM0u2ZzX5pSpuPcmMYByr2FaWoxf1Du+iF47QIhdPGIC6D8aN5UI0rmzLd58aHGZRvyd6n7ET5tpsDj8aTGLj2wZHkOI+UvIxCdYHxrvgCW1HftjYLD4Cx63z6yB7qhWWNz8rrmpkjfD5q3wu+jCcoAZVAjOaj+ZSxFo8Q2pf3iEGrJi6d91ftutA0Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 06:27:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:27:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:27:10 +0900
Message-Id: <DF0A16OM1I4A.3HGXMFWBP34IF@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 04/12] gpu: nova-core: add support for Turing/GA100
 fwsignature
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251208231801.1786803-1-ttabi@nvidia.com>
 <20251208231801.1786803-5-ttabi@nvidia.com>
In-Reply-To: <20251208231801.1786803-5-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:405:370::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fe80dd-5106-4c56-cb20-08de3d35512c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NW13WGdWcm9YRVBVUVZnMmtHRjRlZVZiWUxUYkxaL2JzNWFqbVVoVFhweEh6?=
 =?utf-8?B?VWYwUytXZ0xPOUNBN1Q1M2QybmJwZjZVZ1pkRzhyUWRFUzlSWjhJQTF4cjFN?=
 =?utf-8?B?d2l4ckhteWxQeXo5dHZSTGRGZWlsdmtjMm9QRUgrSm5yRzNhQit5b1NucnBD?=
 =?utf-8?B?cnVvcEVuSHBXN0JoRUl4aFYrbHNEOC9IalJUakIxaFlST1ArdEgrWjZyWTdq?=
 =?utf-8?B?NFJhcUJ2STFwY1lXaHdyWkJ0UjBReVNpMHZPUTRRVXlyK3VuNEJ5N2dqTFdE?=
 =?utf-8?B?TXBZKzlCSTdZOXRxMFIxZkgrbFlsa0Y2QmY5QWtiYUVqWGhqQURaNEp5WFk3?=
 =?utf-8?B?MEIvOVR6eVh3amRnTkRGdEI5NndjRmZGVWtlV2dPbVlHYVVQSmxVcVh5NGdw?=
 =?utf-8?B?dmFtYStjQld3cGljNWt5bjZJajRKUzlXRlRwSW02eE1LanFVdFZ2c3N2M25v?=
 =?utf-8?B?TkVUYmFqQTk1Z3VwbXlZeFIrZTVnV2FocDhPaUJ6Q1l4WjhhSTN4MjVZR292?=
 =?utf-8?B?dFhXSlVwSktBcnBqbld2UUpDVVp1U2kvazRocXRNUS9KN1JJUFVTdE1BTWtY?=
 =?utf-8?B?U1N2MWdHbWNZaXNTcE4rYTVsajh4bFhWNEVhc0FaSlNGTzhVZVZ6NWhpMkp5?=
 =?utf-8?B?aHVWbzdkOWdyNjdlVlBYeXI0eVRiUk5Gb1l4Q1FTRmtoOU1vL1FzK0lLR0RQ?=
 =?utf-8?B?NjFQaGs5ZDNzckpsQVhUalltcTYwS2JxTVpCdVZXNGtzWG9YVUJBWEltL2xk?=
 =?utf-8?B?c3hxcHByL0ZpWWYzbDBLUWxpRVVqb3hRR1prTkRzRUFweXFsV1ZIc2N4THMx?=
 =?utf-8?B?SHRlM29NZDQyZTMyTHpXbDZWbWVBMm1sT2IybXVPd3N3SjJPRU5PaUVObmRz?=
 =?utf-8?B?alZPRlo1R1p5VlZERDdraDRKa25SbW1LRXV4cnNFbnppNUhWUG9oWDQ1ZW16?=
 =?utf-8?B?cGhqZnBET0crM1JVQ2JsNUM1VXB2YVBhTDF0d0V1SGZmTEZRck40ZFdWKzhO?=
 =?utf-8?B?cldxdnRKM25pNWdKSEV0aWVpNWZoRm9sWC9WbkNTSklGTHlFWUxrck90bXpr?=
 =?utf-8?B?QVdYYXh4L1h5Z3VJUDQxY25hTnhwOXplWE11bFRRWTZadDQwZWQvNTZ1clVv?=
 =?utf-8?B?NzJNOGhYSkhkeE1kQk02RUVkbmZUYTVydHdkTEFIRis4ZjY2cFh1K05IcUdR?=
 =?utf-8?B?OEdqTExPL2pHbC9xSEtIblgwd1laMy9ZdjkzMEU2RjhQbkR3cEF5aWh5M3lQ?=
 =?utf-8?B?UzhMd2Z6bk5vcC9ZaGZ2ampEZllQSW9MT3dwWUV6SVV0Z1MvL2l5OWNQZmZC?=
 =?utf-8?B?MjRtaWFQbEtmTXczcUNpd01xdjFwK2xiMTgxN1RQMEdLUS9kbWNhOUJKeFkw?=
 =?utf-8?B?bDZxTVNaZWc4QkptbktLMFUzNHExemt1ZjdXK3dpQndrRm14WndnZHNkaEwy?=
 =?utf-8?B?aFMwS3dhWUdmcVU2NXpjZFBkU3duNjh0dGhoZ25tcFNiYXZySXpaTER3QVJI?=
 =?utf-8?B?VVNFRFV1Szk0RkhHNTBTbmxHdWt5TkEwWjRnTTFoNjB5a1RyTTZuWnFyU2Uw?=
 =?utf-8?B?ZFJkR1JXWHVZL0ZjcVNIeGpXTXAwd2NNY2F1cDRJYTJrZ2lnMHFDOTJmdkx4?=
 =?utf-8?B?ZDFxbThHem1ZUlJXRFVTQnpSM0J1dmVlZVNyd2JnV3FuYk94d2hONkdwNUFD?=
 =?utf-8?B?bThmMi8vVFJrYnJqT0ROcGVmaE84cWpwVWdKSjBxMzMzZ0czZlJyb1FweDhN?=
 =?utf-8?B?NVVRc1NsSFV6Yyt4N09iSVhXM0tvZy9pTjFSbzI4ZkczbDZJQW81Wm5MVnV4?=
 =?utf-8?B?MWRXQ2ZLbUlWeG9qMHFwM2orMzZweWs2S1hGSmtUNXJJOWQ5enpLVG5aNzFF?=
 =?utf-8?B?L3htc3hoRGU4NldLdnVpZzdMSEduRkJ5Nk5Lajh2OUJQZ2pIR05wMnIrb2tP?=
 =?utf-8?B?QjRyMWFjUnhFSDlaYmcxVWkybWY3MDBWUlVOUks1M1JzZ2pOWWpCekwzakpi?=
 =?utf-8?B?YXFxQjJDR0VnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkxRbndJQUg3NG9SRG4vM2J0d01lR2xET2NBSGg2blJhaE9mSXVKejIxRWhN?=
 =?utf-8?B?bzBNcGs2MXRyUDh1RG5jVisycE9aTkMyVEs3SDRTOU9YTERoWGZWVlQraUh2?=
 =?utf-8?B?MVB6NGxuQzRJS1VXZ1dONFpTZFc2S1VKMjNKNzJQdGdUQVhhckdDSG8vYWtR?=
 =?utf-8?B?WWpYQkN6RS9lN1BQNmtLTU1OYmpUNWFvdWk5d2JaUzMyT0dXZ21oWXA4Sk1W?=
 =?utf-8?B?V3lSNXJ3VWtlYm95V2dRNmFVMytHSTZSYnNFc2VuQk5LSHdIQnhvaGNCRnJr?=
 =?utf-8?B?ai85SUJHMDRqSFFmR1pmV3l6UUJoZVBTd3h0UXc5ZzN6ckJBcyt1VzhqQzZp?=
 =?utf-8?B?d1cxU1B1bWM1MnJ6M3Qycm5NNkZSdDZwREw3N2VHZy95MitJS1ZkelhJN0lR?=
 =?utf-8?B?QVdlbDViclNoSGRFb2NqaEoyNCtzamNNMWJaOW5QZlJBK0VYSnlRUG5sRVow?=
 =?utf-8?B?VHhJYmZ0RU5iK2hIUUFrbHlCWS9oZGRNTnRCdkx5TnB0NTJCYS9kZ0JoRUNy?=
 =?utf-8?B?Q1lTd1lGRjkvbzViOUI0T1ZXQTZpRmNUR3dxNTVjb3h2RmZra0EyUXpDZnlU?=
 =?utf-8?B?aEtyUWlFejdsaURWdGJMVmJIQ1QrUzNZVUNZU043VGFvOHZKaXZIM2hFWHU1?=
 =?utf-8?B?SURldXhVVEdxNFJwcUhZWVdGa3FLbUFqOHkyTlNBMG5kZVR2OHYza2ZsTVo3?=
 =?utf-8?B?TDdMbDYyK1hwWmlONTYzQmk2aEFGLy9nNHpucUt2bk0xSnVTQTFTODRCUGk1?=
 =?utf-8?B?WDBEK0E4eis1WmNzbnBmY25hVi9ZOTBKSC94UE04Mm5FaW8ycXh5QWhGeFor?=
 =?utf-8?B?aGM3ZE5rVVpkVmNHbVB6SEdQNzZHdGNsWFU5T05rQ2o4ZU56QTd6cTBTYVNR?=
 =?utf-8?B?K1NlL2pkM0JvRmxSbGMvd0FBUlU0UW1WM1A4b0tYWUtYaGNNN0xhSzY1anNw?=
 =?utf-8?B?MjA1d3RBanpxZlYxZVZQc29kTmIyaXBZZVh0T1JaN2lENkp3dnhlVnVLMmlw?=
 =?utf-8?B?ODBZd0d3eWRuOVlvbko5YXlvM2k5RkhldDJUTzRIeTRWNUJMZFJRb21jVlJL?=
 =?utf-8?B?OHp4TFE2bFJ3VmJXdGROdWNaU2p3cUlENGZCdHc0bnl2UVhkRHhRUzFSVzRU?=
 =?utf-8?B?VDRpb2pnQUFoR2Zzc21xWnl0R3hSeW11QllzazhQU0MwQjBOanMxcDVLRGJT?=
 =?utf-8?B?YXJrd2JsbC9TZXJrNVJjOFlENTRkUnRHdGJUcjhKUmVXcGhaMlJIRHlueVRt?=
 =?utf-8?B?OHorM2d3QXFwT2NhWjc5RHdpZ080YmtVV2hUbE5QK3NueTVoSHBVZ29LY0Vu?=
 =?utf-8?B?VnZaOU5UTkl6V3JtNmt2ZzVaWVJUZHdWZks3M0cyb3o1Z0ZjbmN1cUUxQ3lx?=
 =?utf-8?B?ak5iV2V3dlR5alk4elhZZDR5clc0VFc0eHhzcWdwa0Npc2REU1k5bkhsVVpL?=
 =?utf-8?B?N2NXK1Y0ZExYWTBiVWc1ZiszTldGNjdQU1F5aDN5TGlCZ21CV2d1TG1UaXhi?=
 =?utf-8?B?ZmtRUGY1UjhwSHgydE41dTF4SmJaN01XT1ArR0U2TFpHRHc2V0dDRlNFZkhR?=
 =?utf-8?B?cmkzQndSaEJWYjQ3aURRTTdHdXRpWW9yT1lkc0hKbkNGenF3bUVZY2Y4dTU3?=
 =?utf-8?B?TVFHNmJ2SGlBNkZqOGJtQjdxOGpvM01yY0pQQXliNUVreGI5U1lGRGdOWEtB?=
 =?utf-8?B?cThhdjBmUWJrVGROUzlhUnQvSVFhSmViRGtScUErZmR4YzlyVDlmeUE1TldM?=
 =?utf-8?B?ejBWYU9yeS92YnlqU292d1hlYkhINlN6UDNSdGR5OFBRYXFHSzhEK2RvajM0?=
 =?utf-8?B?WjlZZEtYTUVhdFk0SCtKK2s2MUxZblpDRHR0blpHa2xHK0w5b0xyd29QYTZw?=
 =?utf-8?B?aWs3SHo5MnRqaHVmSGZVTVFHLzR3NEx1RE1CUW5lNUtMcVd3bVd0eTNGRzRP?=
 =?utf-8?B?LzA0NFNvYlR2RVFxQ2UwR1M4QjZqLzR5WFVzTGtBclRKMHV4SEVSVkNjTUNa?=
 =?utf-8?B?VWhiSHZucjlBd1ZIS3BtWnhpMllDUjJzc3FjZmRVcGw4MGs3UUwxSFNSZ1Jo?=
 =?utf-8?B?QXIrNHBQT1Y2ekI1b2N4cUlJM3R3UDdrc1BpSnl5MklIMFN4aWhwYnFqMjJJ?=
 =?utf-8?B?RFFldWJhOU1EdzNSZlV3UmVscFRJcDRsMmgraFdDMjUzemdsYTM4dnNWVnls?=
 =?utf-8?Q?vtXGuXTIZT1SHwcW4EtqgPEAyLJAMxsQXqzqvI/zg6bR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fe80dd-5106-4c56-cb20-08de3d35512c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:27:13.9896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYQaA3uTmiSs9et7PkapXcW08P5RaX2Cxpu1iJ55QLFQb0H9JFvCTdc3BTzpR9J3wzpPpLBTzlVeFmo5lrHv/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920

On Tue Dec 9, 2025 at 8:17 AM JST, Timur Tabi wrote:
> Turing and GA100 share the same GSP-RM firmware binary, and the
> signature ELF section is labeled ".fwsignature_tu10x".
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 0549805282ab..aa5a6433c377 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -163,9 +163,14 @@ pub(crate) fn new<'a, 'b>(
>          let fw_section =3D elf::elf64_section(fw.data(), ".fwimage").ok_=
or(EINVAL)?;
> =20
>          let sigs_section =3D match chipset.arch() {
> -            Architecture::Ampere =3D> ".fwsignature_ga10x",
> +            Architecture::Turing | Architecture::Ampere =3D>
> +                if chipset > Chipset::GA100 {
> +                    ".fwsignature_ga10x"
> +                } else {
> +                    // GA100 uses the same firmware as Turing
> +                    ".fwsignature_tu10x"
> +                },

Please use the pattern discussed in [1] here as it better expresses the
exception for GA100.

[1] https://lore.kernel.org/all/0f11194b-edb4-4206-9a6c-b7ada3cba3e8@nvidia=
.com/
