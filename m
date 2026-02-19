Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3DF332EC4;
	Thu, 19 Feb 2026 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771486347; cv=fail; b=AhGHSNWB5Dp8Mq6hnnwP+8zeBU2stoalZV+YJrY5ci0EzyG8ewltoQu7UVFZYTNg5xICCwum1L+rbU930uq8SQbe2ed20lWYuP2dJb6H67wQHJ6MOzjQAljfDvM0Xm13fvzm9yeXg4HTqrFgK8bBF7OFhHiIEoblpUn3PeafoCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771486347; c=relaxed/simple;
	bh=3pfYJAxKuDSZmeHZXcd0n2vr4dhb/oJtSCO8l2ewW58=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QGR3Jz7w7hXPRh/SPeWewmetUe3p8mKbd8VXmc56orlneu1FUS6NiVlVaHzYJKzoavjsmAxgzvKvLqQQ+ouD7KSfZOyv0brxqMsvjDFsYz5FwQEbpHxpIu+E+HA2lqAAkxJJTXHHdJHPb9Yq2YQo2MjxhjfM0Oz3QniVFoTlbqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eFak/77O; arc=fail smtp.client-ip=52.101.46.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eFak/77O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQcY1ouTE9q/WvLVdJa0+AWFKLyY1T+qjUnxoPH/WJNFlftIG72633zv8M4ToRXze5wuIFIseFamqxoFrzA53vkHscUj/+PPbXuCwBnhC4xQWfAc9PTKrN7db0r5NZbUNJcGjgFf4VveBKNW54mcr7QdMf8S3E7D5DGgIbKDOc1UchUyFhtAsGvPpmCnFA9jv8hEhHR6iZ6kM2v2/9xd4BUtr7kjc4H4OxG40PHqTqwH1sLkf3kDkDpM6LE1YxzGQ9+xF5dGOkI9GnHyWX8G37p5dNFhlE16JHt9JqcAEVZ+/RKOllRPR0mEfS73221ks6EwtlzSrEHwB58j+wnHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vf04y6awk7MAQDaO9h+XVkpI5nnRfyEDFYL5LW0ltc=;
 b=cXJ3jF7Jz7epJ4woLQyLv9xmuHMTkb8Q87aZlGzn9aglcx9PN4ftAjoo0/kVAXcKgDtjRWueUfs42xvAd0ybUKtUWvuKoh3Dqb3kxmM6JqF6fBSPOftXK6EAzoIxf+kssCJ4+GMeca8khcd+F3U2QzmYui9S9R2f7kVmPtRPUqh+A2+OV9I7qXbexOxjKzboU7znb3Zs2hfB/cr7ttyX5LuEs0xZq4MllsvSvbgK7iB2bRxe4tYCiWwP7bR8OXziZdk51suO3rxdN/D6Tve23ve6py9okiiyEdR0n0H4bA2IN8NvIgKiwfPxNrAZZyAKqCCtHSIJwHk50xPd+N/NEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vf04y6awk7MAQDaO9h+XVkpI5nnRfyEDFYL5LW0ltc=;
 b=eFak/77OeDMcay8er4XauyOQzAXsptdekgNX1sYLuYl/+x1U9BHAl243ucmLwJhQgSU5P6R43veGND8lTfya+CVVLtcmMWlYSOzf6xUrfJTfEwkE6QoiM/lx3V2qlpsb2GEPHYtnXeOedz0IvsfV7gWcxT/R8EksNidWjxD39lgeOh6AXRo4pW9G0CtJbkz28+0QRWOP23QWJSC216SjKyJwg+hYFhfeYcNxKnWdtfC06RFgD25oA6+5n7bOtktN2SF0QdCz6y6Upr7ASyuhMD3eOJBj900WP4nqcSlIafBLKPIi+/1WBO25Cc86kD9jC9f+plAEMMMlr3fR8OPMhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:24 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:24 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:52 +0900
Subject: [PATCH v2 3/9] rust: add EMSGSIZE error code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-3-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 137277df-5dc2-4369-b193-08de6f89064d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWtZdFVhSVFjM2QvZ3NTNkVQcmdEL0hyMThTeXFXK0pSdDJwR2JMSDk3VlBu?=
 =?utf-8?B?R1d0M0tGc2xwdDB4eStSbU9XQU8xeGt1RHBLOXlLVkJELzRPOWdVVW4xZ3pW?=
 =?utf-8?B?VmR6ZHJwSElNTUJaeHVUViszanJWZnZwaHZaazBCZEdXeUg3YmhOUWNzOWVj?=
 =?utf-8?B?dWlhTDVVVmdYWVZkRU9oK05zNDRoVG55QThnVHd2VE41TC96WFgwMCtTYXZo?=
 =?utf-8?B?RUdpNGpIUi9RdFdvbG9RRkJJakZubDhpMStMMEFYN2ZyWi9iNVBjZjk1NTVY?=
 =?utf-8?B?QW9nUGZQZE9JNnEyd3V5WHlyNkJJaXVUQjJCYXZ3aVh0UlJYbExORUtBbFF1?=
 =?utf-8?B?U1NMYnJTNlRWM3piMUdCUm1oQzl4Z3hDS1BqQUZLNmhXTE5SbU5Jd3loczR2?=
 =?utf-8?B?aG5helBvVTZLcENqT1ovZnc3c3U4eU1TQjNSYmRYZDZUME1uUzZMQ2NSdmhV?=
 =?utf-8?B?MnFHR3hSdTNySEVUNXBCUW1RR1MyVEFJR2R0QjFUQ0wyQys5NkFKYU5nT2Qr?=
 =?utf-8?B?NytqRGVHYktXM0Z2QzlRYnZTcmVPc0JURVdjT2JSOXNzUEExZ0xMbWlPT1B0?=
 =?utf-8?B?WVpWMDh5ZUxIVm40TmhRaUVQMThJWjhSZE0yTTFMQVZmY05IVWFaTzZMUFpY?=
 =?utf-8?B?bWFvbkx4V0wrNzdPS0pjMGNtS0VOaFBRdkNJSk5pNnlCSUtxeGNyTlJJbjRX?=
 =?utf-8?B?T0lxYWFOR1B4WW5ORi9Jc1VraGd2K0grbi9SVGdTb3VGdHEwdDVXaDNKcjI0?=
 =?utf-8?B?c3hnTUNTeStuK2lrSTF2bStCNlVlUEJmbUNIMzFvNGJaOFlERFRBODRXSkYr?=
 =?utf-8?B?MTJCdi82SDhtTEtkMHVEeDVQTEpuMHpKY25YZGlnamtVYnkrQmFLUVovMmd1?=
 =?utf-8?B?T1VyUHZBWmM5NlJCck13WHpDZHFXRUJLUG9YR3RpUG1RekNpcXZQc2RJemQ4?=
 =?utf-8?B?bFJCbXowTHhqVWwrelVya0hYN24waFZ4Ny9mRVpwOXBpc21IWDg2MW1vaUt0?=
 =?utf-8?B?dGV2R2tTbnQxaWNWKzhzTFU0NEJhaEVZVCt6eXdjQ2FYYkIyNlcxMDdVNXlu?=
 =?utf-8?B?SC9Ra3p3b1EwMEFPWW1HanpKWTd4UUJKcjhzdXAwUFc2RVpNM3c2My9wa0Np?=
 =?utf-8?B?S3lhNVZaVzlJVXpaWmxNSzhIc1VjZ3VSTHhsNDRseXVwSmdiaS9McTdJQmNW?=
 =?utf-8?B?ZkdjMzZhb2xWSDlDVkJmS25JRWUxNWxQblBQN3ZmamMxSkozYmY1cVRpWXhZ?=
 =?utf-8?B?ZnVING1TRGwwaGtEZzJWY0U3ZExCTzlPRUxTc0JSRWpkaHlQd1NFMlh1QjRW?=
 =?utf-8?B?dUhmMnB4VDd3WWtiT094bjJpR2VWWjd1TnVQNGVIa0NEdGVJRFRmbXgrNUd3?=
 =?utf-8?B?T3Bzc1ZKdDFFdDBUV2JiMkdBM1ZZWXNjRXZJU09MS0NtcWhBaHMwemlUNkN3?=
 =?utf-8?B?THY0NWVJU1pmWmNUVEtKZ01GbDF2WDhCYXVueFBqZUd2V3BrRUYwOUxIY21r?=
 =?utf-8?B?SnlKSU5zM3lraXhQejlSTWlLTERHS1UyZDJUOU1VTHlNQ2ZuSWhvR00vMWtV?=
 =?utf-8?B?NkM1YS81YXlQQTBaQ2NTcVFubTRleSs2VTRxYUJTQTlHL1h2UkJPQ0pRV2ZS?=
 =?utf-8?B?RG5rd0lkdHgvOUo0ZjRNNU5CUjlXVkJuZkxMd05ZRnRDY2U1OWExUXlqUkxF?=
 =?utf-8?B?SmVFSWJXeHNwQzVvZlVKOVZ5QU9UbDVJcUU5VTdOQkRnRkNCaFdvWm1ITGpt?=
 =?utf-8?B?aWRFTS9lbE1MMGI5bEQydkZ3NUIzd2s5c1FudXFLR09Tc2MvSk15eGN0LzQ4?=
 =?utf-8?B?MXZ0SGJ3UytQMkZGTmU1c1pSWVNWbmlzaEx3bDVjNFQrSjVGZDJjSDl2Zjha?=
 =?utf-8?B?eUd3dThDZ3pURXI4T1ZPRUFPRDdxeGw2TUVYcHpWTEI1aUE1eUlCb2NNWU5K?=
 =?utf-8?B?WW1Za3NzUHNUTFV4OUtYUFBKZVpYNUVRaE1nQjVFZ1RzcTh1U0g4bVpveThw?=
 =?utf-8?B?bUVxN0NVTXY0ZkxlWVZ6OU1ZOXdRbEZjYkU4RlBYZmxqak9KS3hneG5URlRV?=
 =?utf-8?B?NGpucWxQbGtDaW82K1A2cWxBTjdIS3oxcFBsa0N3MlI0bEdEbk5vOGN1Yy9Z?=
 =?utf-8?B?dGVoZmx0TzZyNERZbjE0QXpSNmUxVGpZam53U3RwM0R2N05tMStOcWdNbTda?=
 =?utf-8?B?NGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlZmWHZjQmtpVXFwY0p4NnV4N1NJQk5Td0ZNSzE3bVBWME8zOXVPTnpxMlFz?=
 =?utf-8?B?aHBpODN0WkxBTzUyOGswSDlXM3hLZXNtOHhtQmNEYXJWSEZUQUROSm52VDI4?=
 =?utf-8?B?dFpBdzhaOXlGUG1sS2tGRVVoWTFNVENoRG9zdEtFekQrSWNXV1FCV0Y2OTlT?=
 =?utf-8?B?K0tiQmdBYm1PdnhxdXcra0luRHRBWmFwMU1QOTBDWTEzcWZ5OTZ3aDR1bGsw?=
 =?utf-8?B?OXVLQnh4QTRYeUhiMjNQM09lZG9uMW9yVE8ySzZ3amVVeHRYcHh2dUNLKzRo?=
 =?utf-8?B?U0QzUjRTbll6MERXWVZZcGV1dnF1NWMrUG1BVkpzNHN3czJMOXE3OG55VHFO?=
 =?utf-8?B?a2Z0eStaUm52ZW83Yng5bzErKys5eStYZENCVDRoNHdCVTRFVTdrV3hnc1VG?=
 =?utf-8?B?eWdJQ1ppYWFmTHBPZFlHZGkrT0drSVMyTVJiRHlzR2F1WGt6dk9iTlNNNkFL?=
 =?utf-8?B?ay9lY3lVN0NSZUpsMDRSYy81elRaMFh4RmVvZms5Y2IrUENDbnlKbkpIZ2ln?=
 =?utf-8?B?QU4xOENCS28wVTRMT05zZVM5N0tJMUFKbGp4UVpYY1NzWStrWUxMcHhNSEpJ?=
 =?utf-8?B?TXE2OWg0V3JzVmtFVCtDZzBFWHFqdUVubnFxQnhqR2dMKzRBNGJTdFdyRld5?=
 =?utf-8?B?V3FwSlRNWXRrMHBYMEdNNlQ5cFhYSFM4VkY4WHp1QTRPTGdaZUE5OU16VnVr?=
 =?utf-8?B?MzJHajRMby9DVU1GUnR6V21NVEhob0NYS204N2RjOWtldDBBOWZlcEVQYWRk?=
 =?utf-8?B?TmFIQmRhRkhqUWcrQkRpdTN3T0Q0ejFQSnRSbmxLeGpJVVFWU3RKa2lzaHRV?=
 =?utf-8?B?Lyt0SFo4bmVVK1ZCRlorUXVOc3BiMnpLVHFtSzZsSHJDZ1hBdnRsbjlONVFm?=
 =?utf-8?B?QzgxOUt4ZlE2U1dvc1lxTEgxdHZnaUJyQU5iVlZXd1FZV0RqL2hPMjlKZzlq?=
 =?utf-8?B?d1UyNlNxKzdPVFJoZ1JGRlBHZlYvbTY3R2FYOUUvd2srSHYyVEtmYmkwN2pq?=
 =?utf-8?B?cVk2Z3FPRmM2UlFxbjl3aC81bkVUeHJPdDJGek5QK3dOY0ZrT1J6SUdxcm90?=
 =?utf-8?B?ZUVRajNvaGl4WWZnWGJtQVZqVzRnZlZuNjFzZ2JRSUVYY3JCSFhwYnNHTmVB?=
 =?utf-8?B?Y0FGcHdmQ2Z5UmlBSHhBeTdmckdVZFFYR1ZVS1FwOW1WSXNEQ3BKZXZUaVFi?=
 =?utf-8?B?OTNiOUJZcXhEZjh3MHpHeWRIeGQ4WXFZT1hCZnBJWFZYaUJ3cVhtQVVVaDZs?=
 =?utf-8?B?ZTBneVZDZ1ZFRysvM3NJcElwQ0FnVlFlYllsb0twU0lSaWxmSzBaV0d6U0ZS?=
 =?utf-8?B?STVxelVEUG05L21ET0wraDIwaW5wUEFJWTBzK1VYa2FHNEg3U0ROYll2UFJ1?=
 =?utf-8?B?OFV6ZTRkR2VzTm5wT251TGtVUzdvMXpQSTdzdk52NkpkNUdVTSt5bkpQS1M5?=
 =?utf-8?B?UDBVcVAxK1pzQ1N6ejQ2Y2huTzdpamhJbFRMUERzQ282Mk1uSExkcnA1TnNV?=
 =?utf-8?B?YS95M1ZISUs1dzdmaTNQdi9FNXBaVEgvNktOa2piQzdSa3hKcGF5MGUwbnFn?=
 =?utf-8?B?SjRmQS8yN0pTR1Q1MExRZ3N0ZGk2aTh0ZGZiNDJpTldIKzVUc3ZGaXcvdkVX?=
 =?utf-8?B?WndZRFB1OG1CRU1CMUFIQXdoQkNseENxR0Rsc3N5SDFscjlUT3lVZ2FOVTcz?=
 =?utf-8?B?cTIxVjEzV09OS2NwZ0Z5R1cxVnh0OVRwbkVqVFlFTmdnUVdEamdKQmJkTE13?=
 =?utf-8?B?dVcxQ1dlcWVVMUErZFdoYUliSkZqTUg5ZmEwOGsxeGNuYzFjZHRLRUtvcWRQ?=
 =?utf-8?B?MWxKS2FxZVBHTGtPeVdBRGZsU0pKY1VndnVCcDZNei9OSktRNHF6NkIvMm1D?=
 =?utf-8?B?M00ycDIvdTFDK2hKQVU1NnpIQ1NwNXNvS1YxbytmYkg5WUE5VDNVZ2hkN0R0?=
 =?utf-8?B?UTRrUUdvdE92U0ZFZTF4MndmVXZDM2U1ZlJRL1R0Z0dNWlpzcEl3dnBCUnVZ?=
 =?utf-8?B?TGRJblNOV2N4MUVmS2h4SFY1ZXN6TXVya0tQZ0VpcHFXSVQzTjdpdEV3Zmlo?=
 =?utf-8?B?UllxRDMxRlp1U0N1YksrdlFJSjFabEFkQmkvcnI4dmJrMk5RRUpHSmlrT09H?=
 =?utf-8?B?cjVrTFB1VDQrOHBhcXo4bUhmSm5jN3pPQy9uTjFhOTVwV3pCQVJ2R092ajhI?=
 =?utf-8?B?dG1qT1BCSHcyK3VPUDNRVlIwUlU3WVp4T1ZBMld0VU5pT01ic29JMit4Qk85?=
 =?utf-8?B?NThXTXFBSENiaWh2R0hrdmY0ZFVZVXZ1T0JwanVEdnEya29QbmJ5TkxpVk4x?=
 =?utf-8?B?Ump3cUsyd01WU1NHdmdtZFVORE1MOTZyTVZKSE8vc1dNaHpmMnBBRlFCQ3ZU?=
 =?utf-8?Q?Q/MJJ3b0PWLDJ6iUdq3lIL2buMAwfD+HCS03R0kXReRdP?=
X-MS-Exchange-AntiSpam-MessageData-1: Eb6n2vDLc7nDgg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137277df-5dc2-4369-b193-08de6f89064d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:24.0940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXGgZnwZbV/1tGBP2B5qR9VHB8jpXKs0ZcoA+1EkjdHuknTx7L2PyYR/Da1qOCc6vWM8o7zWK42dxppYxPe/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990

Add the EMSGSIZE error code, which indicates that a message is too
long.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..10fcf1f0404d 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -67,6 +67,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(EMSGSIZE, "Message too long.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");

-- 
2.53.0

