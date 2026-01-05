Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4021D5178
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 23:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767656681; cv=fail; b=IKJbvx2RBHynxgwoleDjUZ9/97ch8Bky4Ph+5NOw5zZyXO0RB6ULDaI3OTAsvoTavWFCXx9onS/7qFtd0EPiwGe3Cl3j8fC7Y9kvEWjtm4ihCaKiTIllPCidS8MRuZfyVw/yun+vdMuF6DpqgW7ylQF1mq6akxs2kG5DMN9zRSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767656681; c=relaxed/simple;
	bh=CgswgXG0gaSgBZeicBTc+Z0KL4sz2Eazd18Oe+0uCZs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BwcxM/H8RVrTApuzLgtW70fOYC7MbYJcU/Io2HAHgFWVO0Q1fSeP2khB6LfbPVu8Hzqk+bI+yLgTUTPIadg5xNf/cF7txpORezkQ3Wua2pEb2yhGa4YiW32O2bLjSckNm4Y/dr5kyaiiS4yywCk32OE/pfN5XuK9v4SPplVngdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ogAbwZZC; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ogAbwZZC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/a3XMn+UuAa1TRDGY4782V9ijjYbMNnymxPKzZg+Qtidd+8ehQDWlm+Euxhd1fg7rMnQ2dr5vuiiGmdWO7u4RGoaaddWbujzqbYlrOApxRqkEmei700V11ZDxxxXOEuSOk1GSYnibFmQX2wf3LQmUnL4XNg7cAt9Qp/pFU/0j5ePqVV7TyQ3hW0RII5YLpObyjLBY/xALBog8+xZMPv9ua7JVCsmPogUkhT36Sex9YhKeeoU88Ntb8RKlebBnGsgBDUC4pSZ39ATnsVmMG6/GjHVQg0QiQ7M1iUd3nbjMuIMMVw3fXWpocED28GtdQk+kXosmU3E2QlKnZp7YAs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgswgXG0gaSgBZeicBTc+Z0KL4sz2Eazd18Oe+0uCZs=;
 b=NSn0c1J2L23XagBvm6ifbEjugMCUXGCUtx3aIWrQtSOYhkannfUwJ5FDCWKeA9fZsFhiScVboG3cmBM4ld4x+ECJ01Q88e3HJOzfRPCMh6pD7vh4PZPx5xkYOFoMjD5zgyQbJvpCoCQF+t/F6H27ADCeQXGSDj0GZPPkY/7Ab7H0oPsgC9tni6fb8PeqVcMPhyEjGKUAq1bAUbVEewlgqjVKt0+hsc/125NbDdky1qK7SwyHdopZkt46XRRV58lZCNVQ4P/izNC25dH9iYQFtq0tX1MSOGy+AzBXcoV5n8U1refLeN7KdnOP6BhpelmM3Qk7HfLecf3xJUE+CGBskw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgswgXG0gaSgBZeicBTc+Z0KL4sz2Eazd18Oe+0uCZs=;
 b=ogAbwZZCC0buiOkgScpD7t+0FrbzPstutN14HI5zDNX15ZI6GCU3Picqny6hosNgWdAEJpMfJDo3OXgfRNK2C4r1ahcC3tZwZerUPnMAZmZHeFSOT2B0Q8FIAjUePy/SAFt6losGqQ+raw4hk9At6WLgnesYaiS1gbCLr7VkhqfVtnvfnJiO0jOZ9hgoNExN6xRHmIq4Wj+pbG493fKLw+ts+H0BtKMc4tn9uUQ2j/0imm1b11E6Lx03EZ2CWLpX2o/xXvLl2a5Mv4MAq9VBSUnFzo83noh56MF8AAloOkIQhk3pQYpUhVIr/M1R2tfWvKOrCZlZFn+MKIBtq28UIA==
Received: from SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9)
 by CH1PPFDAD84AB72.namprd12.prod.outlook.com (2603:10b6:61f:fc00::627) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 23:44:35 +0000
Received: from SA3PR12MB7923.namprd12.prod.outlook.com
 ([fe80::6453:c4e6:6f5d:5b69]) by SA3PR12MB7923.namprd12.prod.outlook.com
 ([fe80::6453:c4e6:6f5d:5b69%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 23:44:33 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 00/11] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v5 00/11] gpu: nova-core: add Turing support
Thread-Index: AQHcfG3OyM4q7OKWj0StBQqT4XkLM7VEQZ8A
Date: Mon, 5 Jan 2026 23:44:33 +0000
Message-ID: <35bd435fe3224a04434c4c74b5e7e1210b36d12b.camel@nvidia.com>
References: <20260103045934.64521-1-ttabi@nvidia.com>
In-Reply-To: <20260103045934.64521-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR12MB7923:EE_|CH1PPFDAD84AB72:EE_
x-ms-office365-filtering-correlation-id: 6200fd08-9845-4c90-9c58-08de4cb460f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZHhmU1Fkc0x6enppRVhySW5kNzBhdHJ1VEhFdVpmYkRCeDlBMFpWeFpCaURO?=
 =?utf-8?B?aFFidXlqbEJMclZ1a0Q1M3Zhc1RjSlFxbXAzdGd1UGMrRnBjaG4xZXUxYWZp?=
 =?utf-8?B?eW1MQTk0MWdrZ2lwMStaSGRFODEyV296MUMrVFhOcTJpaWlBOFJYZlZVUUFh?=
 =?utf-8?B?V2dIdHE2OWg1akx3b1BaY0EzaWwzUTZKWHZQWlU1VE4rc0V5NGM0UHM4bDlB?=
 =?utf-8?B?ZjhGZlhjTVhjVWZJYzhNRlg5SnJzL2ora05oYm43SHdRNTYyYWNNR0N1dUF1?=
 =?utf-8?B?ZWYrK3V5amtycGV3U1JWRTdTNzJLZDVYOHIzREpBTjBCNDhJclpQVUdLY1c5?=
 =?utf-8?B?aER6TVZGQnhJMDVoTEZzWVlXNTRZYjZlU1dvcmRSVXpFdXhZd0hUSUJ0Wm1p?=
 =?utf-8?B?SGFSTXhpeEZpTERkQ0RicXBnYmVyRGlXVERWRzdsR0UrSkxpUit3bGRNcWRH?=
 =?utf-8?B?YVBNUXhGa3ZqTHJqSGlINE8xOXFSSjNrSTIwWTNneEVHTkJmWVNnZklnQ25o?=
 =?utf-8?B?QkhDNFFsUzl4TUE1b1lqU1BwY1MzZWR5cExkZGxUd1YxZjZubXhidVJZbERO?=
 =?utf-8?B?L21lMWFud3ZtTU9qRk9ZRFk5L1c3dEZQN2RUWTJYdklsVmFWcnFyTUJNc3Ju?=
 =?utf-8?B?Nm5SK2QzL0VKYS96bFp3WmRvN1RFcFdqWEpQcXArbVI3MmZ4NWczNzB2Y1BV?=
 =?utf-8?B?MjZmRjZLRXh2Z3NDSUs3ODF4R29BSkdCTW51V3greElML1JjZ21nVkxERXFo?=
 =?utf-8?B?TW0vZXRDcGZyRjcza3VwVzlXdStVdXcyMzJpam00Q2cybkw1eHFuOWNZaWFh?=
 =?utf-8?B?R0FQczMvaXdlUXFWQ3FSeDBoMC8ybGhqY1d1blFhODN4OVFURk9wQm95dGow?=
 =?utf-8?B?MGx4RnN6b2ZHWm9SUlVValVvWjRBQ0VuUWR0Z1BobkhBaERLKzQxMEd5aGhx?=
 =?utf-8?B?L1RIZ1pWNlVuTzlnbWNqNUprUTZkOXp6eEFrQlVhbUozUHFqR21EVks5Zmh1?=
 =?utf-8?B?c0k2Rnhub2xSQTNZSHFMbVJDQVpkcDNscnVydHVMekJFOTVISFczTW1EZGNU?=
 =?utf-8?B?RHBLSUc3b0RpU1g4cllNNXFoUm1Cc2RsVENsV0s3YXdlenpnTFM1djdNYnAx?=
 =?utf-8?B?ZGt2VE9XYmdaeitzVmRJU1dWaVZmak1jcUJpckZLSk9aOXlFSU1OalVScTRh?=
 =?utf-8?B?SFBXdDRmNEVsS0MwNG1HdWxIdUR4WHc3S2xrWkx5eEM4TCtKeUtmSkkwbDNT?=
 =?utf-8?B?ZDd1RDU3MU1zVXlRRXFOOWV6Z2RRMW5qeGVmcjRKR2JIbEFsM09udGdzRjUv?=
 =?utf-8?B?NWYyWjB5SmVta2UrZkt1cE5ramFjZEJmT0NkYWk2clNmSGc5Q1FBTWRBNUxQ?=
 =?utf-8?B?Mmo2RmJpQ2RZNEdlN2NidGxHVWw5OG52eEVVSkhVdFZHbldSZVRnNzJXbHQ1?=
 =?utf-8?B?SmMxYk00Tm5Jd2NzSisrWnlPV2lsZWliQXFoUHpzT05tWEV2WXMyWlRBYjlq?=
 =?utf-8?B?NTBtR3FaUnNyckY5ajZWKy9OOE12R1piMFlUd3M5ZWZHUERBUHBGbklpR0J1?=
 =?utf-8?B?WXBJMGV1OVErVmorL2tlWVJwb0h2R09ZWDBOOEJqOFJ4ZCtjekg0SlpYNVo2?=
 =?utf-8?B?c3IzUE4vNW04N1VMSlNGWWtXeTlsZnBKODZiZWVUdlpoNTZHOGtyb3lCRU1z?=
 =?utf-8?B?UHNVb1ZOZnI2dDhKRDVlTjJzbTJRd0M5NTJHSGhsSUxwTjNRSEV0UW85ZzFS?=
 =?utf-8?B?eGZUMi85VytwbGljcjhJelhsVE1IOTJpU01Lcit0TGxpYnU4VG83WFVydFNh?=
 =?utf-8?B?cXlYZ05mWVFDL3lUSk9peGFFeGphVll2cUdtS2syZG5KOG1aNWRwYzdxTkVv?=
 =?utf-8?B?MXBVTUtGOThXa3owRjZLZHo3YU1DVzlibTh4VmF5M2wwNUthZWNieFIrVmU1?=
 =?utf-8?B?anRYRjllY25qVDA4SzlBT2UxTll4Tm11ejBmNHBBdFJaRVpzbkdFd09saTVs?=
 =?utf-8?B?SWZyWjFnWHlFN2JaalB2dWxuc1plV0w5QlV4MkpDdXUybHVRczJ6QmcrQm1N?=
 =?utf-8?Q?GKGbyf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7923.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXk0K2ExbVhDV1FBZWllUjFPNVgzZHVlanoremxPUDdLYi90RmduQWREZzNS?=
 =?utf-8?B?dUlmU0dHRlI1bkVFeE9iUFQwRzh5ZUZEL1ppSmlFQzdNZUZjOFpaRTNhQ2tB?=
 =?utf-8?B?QXlZNGxyM2t3TW5JRUpHc0Z4ejdJb0FKRmx0TmU2K3VBbzhYVmlrNkF5Z3Bq?=
 =?utf-8?B?V214TkRnNHRwMkgzR015UlNQK1F4eWpCWFp3UzJ0Qm1LZ2JrRkY5SW52QTMv?=
 =?utf-8?B?aEFac3pZVW9mQXBsTm9YS3RUK3dhNUVPcWxLWmRGWFFVRWRqVTZYS21mUXdN?=
 =?utf-8?B?dlZESG1PUFdRS3YzR0wzRjBjaTUxY1Fnc2xpK3Y2cFlDT2hiWmM1WVdyNmE5?=
 =?utf-8?B?MlFMUEhOUTFGMzRiSFgzQkNsL0lFYjA0ZXF2cmVxSFdtaERZZHVBQ0kra2cw?=
 =?utf-8?B?TnIyRmVwRkNVY0JpM0tvOEZoRklWNUcxaXdDb0txQlR1MTRUNHlKRldLRHBW?=
 =?utf-8?B?UWx6SElmSTM1ejV0NEtNVmZ3WFVoaXBlOURDL3A5S3pVeGxkZjB3akwwWXlF?=
 =?utf-8?B?RTNReGFuNzA3UXRhdGQ1eGdFYXpUVmgvejk5SzgxdzNEWWNNcTJBWHRrTlBZ?=
 =?utf-8?B?N3ZSMlg1c3RibEhZc0ZsSGpYUzY4S1hTZFJFN0dMZEZHcytzd2J3NnRhNE15?=
 =?utf-8?B?TExXTmJPbnRxUFNPb1l6TzNPNWluYXRlRUo2L2pJc09TUjNQQlRNanVpdDlq?=
 =?utf-8?B?V0hqazRtRG1NSElsZmhYWXpFdHZnb0RZdkJMOStkUWFsMWVFSkdxN2JSYmQ2?=
 =?utf-8?B?dytBcXhhbHM1MmtkbXI0ZmZLbkJCa3V5ZWRlRThFUWMveXhVSkZsdGVZU3Jl?=
 =?utf-8?B?aENKdDNjV2ZOR0dtSURSRFRjMTRvemxHa1hmVlZqcFNPeFdGRlI5Vlk0TzM1?=
 =?utf-8?B?WGJJdGRKUlh2WDFQa0dzemMwVDBadjJKY1kxckNwU2ErbVBBVkUzWnJFcGk3?=
 =?utf-8?B?L2dDTW1VenNDTW5ITWU1UlkrYnh3aTRra0N6OG9WSUxvR2FqZUdhWmxqMnMr?=
 =?utf-8?B?ZHhYRzBSRnlhNGNabFlGK2pnWFdSUkhldDFoV2dpSnVnOFllbklaYTdxTVh1?=
 =?utf-8?B?bFpFQXk4N1VreUs4a2tQR0dLM1EzaWhjd05wUUlBeHByVWFKQ3hBQ1BrWlFw?=
 =?utf-8?B?d21XVDJJWlNoaG1pSTh6Tkl1dkRxK3ZsVHVJY1A0MzRucFBRRDVJQlpLa1Vy?=
 =?utf-8?B?b1BSM3NkNW5mVDFjUVREbm5tZURsRk03RmtiQ3d3aDkwTFhqZUdBNmhGL0lG?=
 =?utf-8?B?Si9VVUwvV3d0V296UDNRNWxyWm4vbThybHRvcDcrM2xobkFWQW5yUm15Qzhv?=
 =?utf-8?B?US80VlhLd3YzdmwxcGhRY0F6Vng2T2VWN05GeEx1TXZudS9Ha1Y3M3U4alhy?=
 =?utf-8?B?c2E1Rk9ycFBTK0QzaDhwTWVwMXFKY1B6WUZFeW1yT0k5VHJLRVdmTkZRYWFO?=
 =?utf-8?B?LzhKOW5pOEhoamZZZjZOR0s2YzNCT2JqcW5qTVdFWDZIQldqekJlRDlvRXFv?=
 =?utf-8?B?bktSQzQrVFBESjh0SnhrbWpzaGZ0WFkzUE9nVnAvenZRQ2F3U3ZqNHQvVHhv?=
 =?utf-8?B?ZHpYVzRoNy9vaDYreFVCWEE2azlwZ3NUbWNBQ0ZONG1IRG1YZks4NFh4bnFZ?=
 =?utf-8?B?ZWkwT0gzdlZ3cWRLRlUwMnVmc1BTRHordnBnV0ZnazB2M2dNRkM4NDBXL1g4?=
 =?utf-8?B?ck1Gd3ovMTV3WlFhbXBHSGlKcWtxRjdUVFV3aURyNEhlZHBKcDFiTFkyY0ha?=
 =?utf-8?B?UG43OVkyLzVIODU4eG0vN2trZThDeTJjODcwNU0yZXNXaytxRXFSajBKckxQ?=
 =?utf-8?B?SEgyZ2FXN1k3eFY0N3YxWmROSUozd3FxZU5DYnU4dHYyZE1EbHBhd2szdlht?=
 =?utf-8?B?bjZpeVRxOVJBRjk2TWNlVG9GMXUxaGFQbk12QmYxT2VDNDVOL1ZEcFY2T1Rq?=
 =?utf-8?B?UUxMclZTR283YStFQlVXd1hYQ2FIbHJwQStRVXdQYnIrSUpIdjhRV0pzQnha?=
 =?utf-8?B?S3lvTHFieTJZUi8zcVFkV3FKREtNeGUvak56SzZXTjVPdXFmcWRxMlZIWTcr?=
 =?utf-8?B?akpuVW1DajJwWjdMM3d4T0d6SzZieno0TlhZQ2xaelFRMVJ0aGpJc3FnUUEy?=
 =?utf-8?B?TW5MbnBYa2pJY0FGdzJiVFc3MzVCeHFBdmhnYUhZekltbDhWVFAwZGNENG8z?=
 =?utf-8?B?cHhPT1IvN3g5YUVwMzdneFcrbGxDSDdjRk5LaHJvZEp4RTJqU0gvSlpWMkVo?=
 =?utf-8?B?UVJYTFpMOHkzS1haUXVFL2I0SDRYWWdmSXVqNWdXdlRHTGxxMm1mM2pwbVNL?=
 =?utf-8?B?VmdpRHFRM1ZMQk50ZWZRZXo0Y3R5WTJKQzQ1d25GZjlMQXRrSDl2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC5D8DD41162504C88BAF87DCD4F0E2A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7923.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6200fd08-9845-4c90-9c58-08de4cb460f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 23:44:33.7319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ccOJEi9pG/a0Ya+pdGYhO6ckoLSAxPgCmsY/bQLdezKkiLj+7h5ZqEsknc1fP30LeWoksHzTJj6YDY8scBVBSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDAD84AB72

T24gRnJpLCAyMDI2LTAxLTAyIGF0IDIyOjU5IC0wNjAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBU
aGlzIHBhdGNoIHNldCBhZGRzIGJhc2ljIHN1cHBvcnQgZm9yIHByZS1ib290aW5nIEdTUC1STQ0K
PiBvbiBUdXJpbmcuDQoNCkkgZm91bmQgYSBmZXcgbWlub3IgaXNzdWVzIChlLmcuIHJ1c3RmbXQp
IHRoYXQgd2lsbCBiZSBmaXhlZCBpbiB2Ni4gIEknbGwgd2FpdCB1bnRpbCBJIGdldCBmZWVkYmFj
aw0Kb24gdjUgYmVmb3JlIHBvc3RpbmcgaXQuDQo=
