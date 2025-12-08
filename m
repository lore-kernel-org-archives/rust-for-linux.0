Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012033.outbound.protection.outlook.com [52.101.48.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A292C225403;
	Mon,  8 Dec 2025 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765210695; cv=fail; b=Ja/Cq6VWd4MgV04/eylVViHiQYMe4qld5VJuLOx0jB6zU6g+QPJlRLpIalb4/JtctvmEJ32lQ4wHTvjAEvcje80y+nBntN6kLnS7Z/73jjSbYYKAJ2RgGoAhGPNn8iJfBXIA2OgDxjqD6LU0T9uEYdLCqcOFoGO5Ji4kNBwVhQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765210695; c=relaxed/simple;
	bh=pIgauREdgegar7y0DzDdauL3dxtZJ3gOHKVfgn9aqCI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qzfv7ub1Vdd3guH+kxkgQmXXJkH9+WSptuUTi3VYaQaZmUYNUj5lCA/W2MSGYKIpd+BgQsYI5AW6fdbLb/jXmDAs3oPdDQmzE8oPl6MMSCHmMFOpm+4xUV2rce9HvfQmn9tOnRhyV0/r68+tVK2+8hNrLExK0SykWqqSNvqN6bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CH81+//P; arc=fail smtp.client-ip=52.101.48.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CH81+//P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rovAiaO+RftcBnZYeDiOG+y07v+URy8TvE9ChGOkLhKvmjKrO3xk/I+lwJ9x3sTryxl7hguzQOIyaVV+s6mz52gpUz0vMPfMlnFstirv7FCQADciQ9tERIhhbI+xIepZRfvMp7LoYvkRvBidqyeRvguVO8XEoiuWaSTAWDwxBvSrAbe6WfEfFv6/nY455/G1TkhCLCtHLQaveIrFHMqi9zGM/PnP0kQA2s/pJTPSY8SP+vQ+0wZ+fZDFlNl6qUSPkJqXO1N/wckMlaSgvInvn0SzL/qaRltRPB/VTt9lG4eXPzCfh+5jRu4WBUzIv4tHzneHS/PkLegIXIo3MwKbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIgauREdgegar7y0DzDdauL3dxtZJ3gOHKVfgn9aqCI=;
 b=eYsOiZTVjuvFMb7x4tkRWoSBpq7fJ9xhkQg/kO2g6y0xz8E+GESlBKYD8xTSqOa3mJJy02GRAXnvff3LyAMPLAwYl+hrifBj/DDPEcRbjio8BUJ450QwugtqXHIQGp/fa0uDXw+nYx73KP98VyNQbjlYzlTdQG+pJKaVUE9fahQ1IWTMKUkK81uDdh2LOJhT2nQOBbMe7mitMEEFONAvyKgKkeUMaoARLYDOArr30WPNp/kZVKlFGh6u90IRIa1/Bd6XaSgDhBzJ88idVUZkqBbl0oI6TJdgwDny7kVcUThEUVEmRCmqYzxGvWbk7eI7NxLgKT1oKWuxuQeC82YtOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIgauREdgegar7y0DzDdauL3dxtZJ3gOHKVfgn9aqCI=;
 b=CH81+//P5KT+/Q2Zddv+B0enV+QERQ+aXEHxFcRUVAOpWwcwNadexMaG5hvgy2J6AIG5NFKpb9FKZdtSR6IJ1gsCMy+rzgfYUD1kCejpAVz11mHxg1UU0w3mNIJBMMsi/ZNE4VcWzv5EfsYiqxE2GzQSy8wIgiur5gs349gLkT2cQf/33dBc6v9HKGmbvSux/etuyLP8iTrOFa4B5jlof8p2HXgeSJcpUgxNqFP2loL5igZEsPOQj2PlzI79HZgzpjZPChYGUkq7v30T5rkIk2UwXTb0xNsyZDhaQptCTKC8sDmXYuOS6tfFYcqEfzVMSq496MEdSvB1KBW79vat8Q==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 16:18:07 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 16:18:07 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require bound
 device when unneeded
Thread-Topic: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require
 bound device when unneeded
Thread-Index: AQHcaCTjMdk6RduOCU+8MVUXcvlSA7UX7C4A
Date: Mon, 8 Dec 2025 16:18:07 +0000
Message-ID: <6da7ff0ff31c1f4250b8d6cd1b535bd69322d0c9.camel@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
	 <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|PH7PR12MB6636:EE_
x-ms-office365-filtering-correlation-id: 492189bd-5848-49b8-cfca-08de36755f80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TWJVN2xVdjhPWnQ4S3BWRzZiQmhTL2xFWjNJd1hkYWpFR3VQRFEvekNSbWky?=
 =?utf-8?B?MmorL3RKNXlxbzgzamZRTUFWTEpidGtUQW5Sb3YwTlpiWXFoelcxMXFwUTdm?=
 =?utf-8?B?N05GRjVPY1hXUEgxTU1xTW9UZkhzay8vZ293aUNtV0NpQTdEMkVRNkFlRTVJ?=
 =?utf-8?B?R0pFc2IxM2tyZVU1NXJseURRWUwvZlNuVkVudWFkeDNydmdrRUlsT3ZiREgy?=
 =?utf-8?B?bXFLdGlHR2UxaHAxQjVTQS9Wdmx6OFVLQzRFWXBQN0hsT3RlVGV1aklXaG1N?=
 =?utf-8?B?QUYwM2t4dnpqSHVQeEd3aGRvSXprcndWTFU2OTZNK2FxUE5mSGFjM2lObGp2?=
 =?utf-8?B?dmVseFpucEIxYTVrQ0hiVi9rYjZ6VFRJVkMyOG90a1ZvdDZUN0Evc2Q3YUVz?=
 =?utf-8?B?cTJlWk1jbllaK0lkT0xxZEsyb1hCa3o5SFRkVFVjOFJHc09jRnk3V3FCQTYw?=
 =?utf-8?B?WCtKdzhsU3NhblIvUXU3TkkxWTdlL1R3QWliVWRCT3o0WHlnQ21iTm9tUEhH?=
 =?utf-8?B?cW1CMnFBbXl2bkdzTm8wOExpdXo0eFZ6OFRiM0lvSTZsczdaSGYxR1FRbG9y?=
 =?utf-8?B?NjVtOXp0M1lKdHJJYTZ3WUY3TVBxN1dBVnFlR2JpRi9TRTl4cUdHV0JWY25N?=
 =?utf-8?B?eDB3ODBJNS81TXgvcVJ6dVpEdzM5MWhuYlRGUEFYVVFtYlhXU2d3cGhBVXZB?=
 =?utf-8?B?L2V4YnRQa25peW9QWXhLYW9ITDA0VXBhZm9Sdy80aHlPK3BBeWFjbk0xcDFs?=
 =?utf-8?B?ZDJLY3dHQU9VeStoK3dLSmN5Ti9MUjAxTTRpV2xpMGd3UzNkUmUwQlB4N3dh?=
 =?utf-8?B?bmpjTGFYVFBVbFRDQktCVkdjdGVWck9nTjVEMGFSZ3NHOUJYS09LeVpNUFdo?=
 =?utf-8?B?SjNYUTFvVWtHVjJRcENsci9ZSVIrYnBWVEdlRkVGdGNWVDROMHhOZ2pUalBj?=
 =?utf-8?B?OGZzc1pweFEreWltc0FWaFdvU2xvY1Y0aFJORW04M1hRYlRMTXppdENtblg2?=
 =?utf-8?B?UVd5amtEY2k0RlJsUXVXTDFyVlZ3MEtTb0Y4d0szaDdsNkd3dEcxbDVhZHdO?=
 =?utf-8?B?UTdacDFiREw1dnBTcG9CQk1IOGNKNkdUWndUZjVIOTZTTUJhOWhLSzNtS05R?=
 =?utf-8?B?SWd5Ni9XUlpMYW05bUdJemtrc1BTL3hpMzlFaTRVb2dDWSt2VXZqLytES2U0?=
 =?utf-8?B?Sm5qb3hmYTdiaWcwU25PMzhrSjdCdTM2Y09VR0haUWNhQXpIdVF3ZmVnQUZF?=
 =?utf-8?B?T05qeU9Dc3RLT1h1RzR6SjFTYndrY3BYWGVNWERQRXJpNmp6TXc0aGcwUnVM?=
 =?utf-8?B?di9KdHNnQS8vRFBXSThGb0dRYWc2L1RCdGRUOWU1RHB6V3B5UDQ1N0xBRG5l?=
 =?utf-8?B?Q2pwbUhMK29QK0txcmJmZlAreWVIekoyTzllYTBhbTdHbWo0Sis2K3JYcWo0?=
 =?utf-8?B?STVWSzc0NmNjaVFBR0NmeUNlejV0aXlnc1NzUk02RW40d2VkVUJGbVc0bWQv?=
 =?utf-8?B?S09HekR3Q0syT1VzOXJRWldlTVZLSjhXczVpTVBmbnYyd0xyK3FHSHVmeWEr?=
 =?utf-8?B?enNvV0tJTnExTzU5ZGtacEN1WkxrQTc2Z3pXNE1nVEpFWWZDUnVaVHRXM0w0?=
 =?utf-8?B?UEN2a0N2LzhQcXEzVlpSY0dVeU02TDhLM2hLZ0RnTjJIb1liS2FJeW1XdkxC?=
 =?utf-8?B?WWdYR3dHYmdKSE54WkpZcnVSTVlVb05neHFYdE1sN09KSDNib1RKMDdidEFX?=
 =?utf-8?B?Z0hPVnp4dWlTWGRJOVlIbU9EVmc1UXhjQXZvdm5nK0VHY040ems0VFdnd3F3?=
 =?utf-8?B?ZGQ3WC9Ralk0YjltbkR1aXJXTTl4NnBnRzZyRVUra2E5a2pOeCtzSFU3K3BZ?=
 =?utf-8?B?Y2pTZm1abllZMnltZG5SZmVRN3d3Q2pUSFAzSFJ5d0RtbDl6dXU2WjFaZkNt?=
 =?utf-8?B?bEc0TUJIa1hxdTZqSWR4ZVF4eEtzTjFIU2d1SVoxNFVoK2RQOU1sSmk0Tytq?=
 =?utf-8?B?SnhCNFJuOC9xbnRJZzhreWdNNDc1bEZqRXd5dmNmdStDeTFmV1JwMnhpV05S?=
 =?utf-8?Q?Xia5U9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZnBVQnk1OWVTajhIOUh3RVFvMXRvYVVwRVZIdzRzYjVOREhMT1hHTS8xM0dp?=
 =?utf-8?B?c3hQM0Y0NElHd0xRbi9zOG9lczlzRGtoaE9SRFFVZG0rSmVZVXNwZ1FSeE5K?=
 =?utf-8?B?SUhTN2M2cW1qQ2hjSWhuNzVsbSsxd3g2UDlxY2Z1elJrT1h3KzFLMm1VTFQv?=
 =?utf-8?B?U3lTbU5JRDRVODRsRW9rZDAvWFNtU2VyM2pqb0Z5cDMyb2RYVHgyY3VEVEYy?=
 =?utf-8?B?WkFPTmdCWmNIWk96eHMxejA5WkNGSjhVVVlrTjJCcS9jR0Z0d256WjJRaERM?=
 =?utf-8?B?MllPOEhQZjlma0UzdkFKSHJ0d21iaXk2OFVCOEtnR1YzQnZUS2lMUGV5NFpV?=
 =?utf-8?B?UDFGSXVIdHhaang2d1lEMTVFNUMybitNdWUxL0g1RGNxUmZ5MnI4VnVCaWFi?=
 =?utf-8?B?TmtsakFXc09Feis4TEdWdis0ZzNUNmVhT3ErRG9wQjgxeXgwVEVmU2lLNlU2?=
 =?utf-8?B?NWhRKzJTRjVZa0dwR2Fvck9hZjF0T3gzOXJvN2N4WW9JK1lTclZ0VGFTN3Aw?=
 =?utf-8?B?RTBKbTR1VDRheUl3NCtwUUVibnVOMENUaGVxMTBGd1ZpVXhQVnhoYVFoRzBU?=
 =?utf-8?B?TEFNYjVEM2F4cDV1VGphcGdjYzh5ZWFzcG1yWndwckFxc29YanRkeDdENFZK?=
 =?utf-8?B?OXZrNnZzSjE4ZVpWVEJKKzFtamxaZVJJRDNqVzR2S2JLeVhkeFIrMkVrcTMr?=
 =?utf-8?B?ZU5FNHVkdFlaWGNweWFsMEUzb3FVa1lkUVRkaTNYRkptSmR0Rmh2RlY2K2Vm?=
 =?utf-8?B?bFZnT3o4UmtaK2hTbEVTMCtjZFBncEY1dmphTEluNWlWcHRwcWkxaHA0Tk9H?=
 =?utf-8?B?OFltaUg2NzFKcGtqZWxpRGJsQkJ5OEFXTmxTNittaXBSZzZTdDVwV3ZiYXRk?=
 =?utf-8?B?dUc3T2NTNHFkaDFMaU9PdzN2K2NxMGY4V2FZNytMNzdzd1dIekdJQ0RSdjVm?=
 =?utf-8?B?WW53WHlmdzhFSGFEYkxlOTV0eFdCL3FBb1loNDVEWGVucDIxRzRjSkc4V0Fr?=
 =?utf-8?B?WnA3bFYzT3ZHOVk4VzRTU1BvMEF3ZHF0d05aOHY5ejNtK2oyNVVtbVZ3aHB1?=
 =?utf-8?B?NHI3UVYzbm1USWFub1kxSTZ3WjQ3bExhZWFrbXpLdVBaMER1QlBnT3RWWVg2?=
 =?utf-8?B?cTV4TFA2Q0F6dnc1U0x2ZzRhZFVDaHY2b25JTU8vbmh4R3NhUUt5b09aWnJZ?=
 =?utf-8?B?b2VOWVJydFVLTnh1SWRhVEJsNzdDdFF5N2NzanZuakpiQkh4RmNNRFhnYmpj?=
 =?utf-8?B?b1k4QXkvSHNUYXlqZmsrM2JRSkk4KzhZYjBEZ3d3RzBzN2tOYzVmUzFqNHkr?=
 =?utf-8?B?b2JodGdZclRwcUVPUUpDdDhkMkV0YWlWWEtCd25DVlVqUzhDRWNKOUVvWkwy?=
 =?utf-8?B?UjVzd3VFN1c2dGQ4bkRSWUpiMXJYVkZhZ3JveUs1SGE3RVZaU3ZXOFh4OGM1?=
 =?utf-8?B?RTlzRGRzYy9ZTFNrQXJwT3N1NVU5YzNIeCt3VkZvejUxemJ1UlFzOTVTcENT?=
 =?utf-8?B?a3F2OGNJSGVwSGNweWI2Rm9FcUpRYnptOE5KTVppenhSRjRnWGFsQWZ4UnhZ?=
 =?utf-8?B?Tnd2bWFTdnJFMGFad3Q3bnViRUNPeTc5UWRkM1BaNUxwdksxb1lmSm0wQ1A2?=
 =?utf-8?B?cEo2Z2VvVnZhSTdmbzlJbitXYzdIUVhTM0x3WVlHWklhRWJ2eWpVR2w0eHBw?=
 =?utf-8?B?V01UcFdmKzhsR2JOb2hLT2ZPTVBhWTBQZzZMTmJWNWt0aVh5RkVHWUR4eXVu?=
 =?utf-8?B?Z3h4YUEzMlFTSVJ5ajVVdldFWThEYkU1WVVCa3FQNW9lQmgwcTVESTRKdHBZ?=
 =?utf-8?B?N2VEcGdNekU2VXk0b3pUVEUzd0V6WlRXSDlsL2x1ZnFDeGs1NVFFZHA4MTVQ?=
 =?utf-8?B?dWlSVTNmcERKWThYZHZicyt1NHZSNnJuaVhRdUREaWczSm9pbko1ckhINTE0?=
 =?utf-8?B?WVAyQm41ejlkNWpGTjFLRG1RdE1IS25OY3JLNnlxMmM0cW5NeDFxbVhyUDAv?=
 =?utf-8?B?NlJpY3hEY1l2ZXFNeHE1NndNQVN5MllYWDR5SS9KYzlQdW14NDZNWHMxL256?=
 =?utf-8?B?bnc3MTdXRnA4L3MrZUZqbU1lOU44Y0lIMG40NUNvZzRza2cxZlp2aW80ZmZY?=
 =?utf-8?Q?GVL1mghwvR20NCmT4megcEJsu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7380658243A4048BF6F77B87EBC1BD3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492189bd-5848-49b8-cfca-08de36755f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 16:18:07.4088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jC9ZqtSdlIzBy+fCO8/63tvsUW1L3hR9m/sHrNq0XQAl6ryCdWBDj7UAI0jERArI6qmCk4tbRyL+ZU70KZgw2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636

T24gTW9uLCAyMDI1LTEyLTA4IGF0IDE4OjI2ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gwqDCoMKgwqAgLy8vIExvYWRzIHRoZSBGV1NFQyBmaXJtd2FyZSBpbnRvIGBmYWxjb25g
IGFuZCBleGVjdXRlIGl0Lg0KPiAtwqDCoMKgIHB1YihjcmF0ZSkgZm4gcnVuKA0KPiAtwqDCoMKg
wqDCoMKgwqAgJnNlbGYsDQo+IC3CoMKgwqDCoMKgwqDCoCBkZXY6ICZEZXZpY2U8ZGV2aWNlOjpC
b3VuZD4sDQo+IC3CoMKgwqDCoMKgwqDCoCBmYWxjb246ICZGYWxjb248R3NwPiwNCj4gLcKgwqDC
oMKgwqDCoMKgIGJhcjogJkJhcjAsDQo+IC3CoMKgwqAgKSAtPiBSZXN1bHQ8KCk+IHsNCj4gK8Kg
wqDCoCBwdWIoY3JhdGUpIGZuIHJ1bigmc2VsZiwgZGV2OiAmRGV2aWNlLCBmYWxjb246ICZGYWxj
b248R3NwPiwgYmFyOiAmQmFyMCkgLT4gUmVzdWx0PCgpPiB7DQoNCkkgZnJlcXVlbnRseSBzZWUg
cGF0Y2hlcyB0aGF0LCB3aGVuIHRoZXkgY2hhbmdlIHRoZSBmdW5jdGlvbiBzaWduYXR1cmUsIHJl
YXJyYW5nZSB0aGUgcGFyYW1ldGVycw0KZnJvbSBvbmUgbGluZSB0byBtdWx0aXBsZSBsaW5lcy4g
IEhlcmUsIHlvdSBhcmUgZG9pbmcgdGhlIG9wcG9zaXRlLiAgTm90IG9ubHkgdGhhdCwgYnV0IGl0
IHNlZW1zDQp1bm5lY2Vzc2FyeSBiZWNhdXNlIHlvdSdyZSBhY3R1YWxseSBqdXN0IGNoYW5naW5n
IG9uZSBwYXJhbWV0ZXIsIHNvIHlvdSBzaG91bGQgb25seSBiZSByZXBsYWNpbmcNCm9uZSBsaW5l
Lg0KDQpJdCBzZWVtcyB0byBtZSB0aGF0IHNvbWUgcGVvcGxlIGhhdmUgdGhlaXIgZWRpdG9ycyBj
b25maWd1cmVkIHRvIHByZWZlciBvbmUgbGluZSwgYW5kIG90aGVycw0KaGF2ZSB0aGVpciBlZGl0
b3IgY29uZmlndXJlZCB0byBwcmVmZXIgbXVsdGlwbGUgbGluZXMsIHNvIHdoZW5ldmVyIHRoZXJl
J3MgYSBzaWduYXR1cmUgY2hhbmdlLA0Kd2UgZ2V0IGRpZmZzIGxpa2UgdGhpcy4NCg0K
