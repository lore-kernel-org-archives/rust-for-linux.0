Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011052.outbound.protection.outlook.com [40.93.194.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680AE2F5A3D
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 00:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769819111; cv=fail; b=WsigZrE+oHb0iD1qN+7v0n9dcEqVbPMYsfvsLeFWy2Y9g/oGqg+B63HuMQ40augvXdL41zppCmgSKrScWkJbHj3odSw62wHLMwm2SkM704j/HLzb8H3dGZVO+QHiTGP04ALBzHakSeRooQh74av7X2IfcvMepwfW/CKGHho8vDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769819111; c=relaxed/simple;
	bh=N8vQ3io6yjEAjTtIe67SLlaW0miYPj0BwiGe2d6LKv8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m13h7/kOSY1Z7yr7V4dsaHxz0us3ZM9LnB4+UABbLOvkoo9xPb1JpU8bd91fpP5T0NuSfswi8fgxeIwitmc2CCvZOofnnCIpnf4ZFvmVsT3tqQNpDnf9yc2U2NOyEjt9VN0qJGrREX3jgG4ap2hi1G0bHt96dOQQ8df9JvVQDQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=upovOYTo; arc=fail smtp.client-ip=40.93.194.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="upovOYTo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldJidXaKwpYE4rstqMjDaMCRtXL2paep2gSMEBT2YBRPQ85eEniUTZBXt9E/nzBfcOPliGqjs9IU2juSaJr1wyDCoBqy5WcISgoQcCWo0JCRCIn4r54yfuBI03Li/q5OUHk47M+uNAlXxsXfDliE9WsklZztzOBRlUuk2UVKt36ezEJeThuRmNtICzmKHSQMSfFTtewO77//6sozkhX5b1y62SODTuEPVlI7vBu2kCh/MhHSDx+hFVIUfk8C/ebibs4qrtKZ0wXuWi1nsKgJRThi0lfiY5gcz7c8MktguM7Xsut3FTaApWfw0GvTR6NZGiI6162Z0RIsL9vOSfn+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSRG3F6xFIQsvkvA6T9mBCWWehauZTCt7kBHr2hOvtM=;
 b=hkNQh5bNG8kfQrJRW4SjqWxFJBbbv+n6psutHPCWW5LeKubYmcajDZuVhlGMcbO/+de2Le+UPMxPB6IL7kuwUFv1qi3hJA62JrineGWGV6qQJu0/sn54LBCUmVxMkYuFPoOlGk2xnsMaUe9QJ/P8EsHteaFMcKT1BKUWYN48OIoIp1ziO7uZ3aP4SU2EuYQCxwDVtu2TCtn9ToTxSa/cWiE0wwhbskUqXw5604uts3eJ1u3PGQZ5PGDSh194P72pORmPag/lHnwibNtgg4gseDplzFv0AjceF4Dmn/UYm8evPvPTKAP96qNS/8osIejatV1o7r5lZYrPY4uXzRhE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSRG3F6xFIQsvkvA6T9mBCWWehauZTCt7kBHr2hOvtM=;
 b=upovOYToXuOUQXJL/S6kznBV0fMyPeEptnXACdqlFE+IKkmS+yQBg0CEv5Gv0tCuKA/IAm7NmrQ0tcb4Rrb4MgwzES6Dn0PBQnx/GdgErFi0trakiIH0I3/CUz85ET7y09h3aNkt/BodGF8+ncVxmNjjlAm8gKj4IQ/IX7cT3JE3wAd9BQUSbTQ9ZDFy7zym76cnSDhWXD8aMEp3CzbAAj197sInv2BaBULDtPwXccr+oDhdltlHA1QPi5gwGfWmK8odQL6DWqqURIV7nsDUk6yBKnZK3zjCGLR8hXmvs6/ZL8Li0jMnelU1o+Xw/i6DTokROnOfPSMEruTmKt+XJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ1PR12MB6218.namprd12.prod.outlook.com (2603:10b6:a03:457::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Sat, 31 Jan
 2026 00:25:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:25:06 +0000
Message-ID: <067c6016-ce21-449e-b0d6-86252ac483a0@nvidia.com>
Date: Fri, 30 Jan 2026 16:24:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Timur Tabi <ttabi@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
 <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
 <ab90ca9a-a721-41a5-9b28-2af73fda3212@nvidia.com>
 <DG2CFA6SMAMO.GR68NA4YLW76@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DG2CFA6SMAMO.GR68NA4YLW76@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ1PR12MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c061962-0315-49a9-0e23-08de605f2f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUltNmt1dTlBRllmeEhUUXptUzVVclFsVEE5VUxCNlJ3U2RwV3gvbWZuUW5I?=
 =?utf-8?B?MnVKZ2ZPVnE3b28yYlJubGRibWgrWkswWDBMVXlNSlYrMkF5aVVES3NBeE9o?=
 =?utf-8?B?a2V3VmRQUVl1NWJiVDJEMjZDT0Z0SXd1VEFBK1dmTTIxWkIyNWUxMUw5SERW?=
 =?utf-8?B?Tk5VdXByQUF3Skl3V1pxNDc2WnJLZEM4enBPdEZRSzNlbC94ZCtIZFpSdzhD?=
 =?utf-8?B?UFR3c21UeXM0V0FKV3hrc0U1cVBINnVkN3JXbEkyaElhN1pROGF4anBDUkZT?=
 =?utf-8?B?dlIxV0dKUTVQQlQzSXNpeDlMemNaZDJSTWRGc0hpclltL3hCQ2gzOWFTUzFl?=
 =?utf-8?B?dmU4QVNYWm1HSFpYZWJJbS9xa2RicG96ZFNQbzF0WlA5RnRua2Y1NkNnNURE?=
 =?utf-8?B?cGcvR0pEMTl4N1VKWEFORHNISGxqcUlTZnp6Y3BUWDZMS3oyUm1ZeWFwSkc2?=
 =?utf-8?B?VVY5Q2R1TU1sZFVVWEsyY2RRSzd4MjZsQ24yOXlHSEp6TktqaHZkWDIxbUJG?=
 =?utf-8?B?SnlKcXJmeDJrWVgyVjIxS0JjZkwyZmNMcU8vYzJhbTVzUC9WVStOanB6RHdh?=
 =?utf-8?B?amdIZmRDZU44MVVtSFc3QVpNcHNma3FOQWF0eE9wbUU2MHd5NURCNVFJSlJN?=
 =?utf-8?B?VTg5QW11V1NQSGk0OXZMQy9WVklUb0l3RVZ5MFJYcEFVSzJGaFpFbERFNFpZ?=
 =?utf-8?B?UXdxYWF3Y282V3IwbDF3N3dJYUhaSlFQQlJtdUFFZi9zQ2xaNlJLMmluSWcz?=
 =?utf-8?B?SjJrTE03TFcyMmFOMXRMbUlTN2hCemszNWJOdXVZSUV4cGFSdTBQN1lONm9l?=
 =?utf-8?B?UkdSMWRVVGpjUlRnZy9DcGtxa25qemFvcFlMS01YUnBrMXBMK05VOHdTeWZv?=
 =?utf-8?B?NUsrTWVGS3QrajN1ME9wYkNkcEZ1M0hNV0ltL0kxT1NOaGZRLzBVUk1Sb29F?=
 =?utf-8?B?Q1pwU0NLdk1lRm0wWmxEdmd1eEdyWmEwdVpjYWtMWVFaSnE4dVEyN0hpcWlt?=
 =?utf-8?B?ajFacGQzZXZyTkV1RS9UanZUSE9UTjcvc0ZadHJTWDZxbW1KNHJIeGM4b1pX?=
 =?utf-8?B?Qlh3RHBYTCtkU2pLLzFINDBqcDlHbDl6SmpIZUgvcUEyejgvOWJEencvQmdj?=
 =?utf-8?B?M3dCS2FCTzgxRXhOTHh4MC9VZ0JHbXBzdmhNNFRZNHIxeHR5Qlp0YWlwWU94?=
 =?utf-8?B?ZWZKcno5a3RqTlJaL2VZQ0thSjFUTkhFa0EwZWg1L200d3YvN3RHVnpEQzUy?=
 =?utf-8?B?RXQxMWpjR2d5V0dwSWg4SGZJWHdtNTk4NndPNzVqZzI3dGR3YU41QnVjZ1NW?=
 =?utf-8?B?cTNnMmQ0QU5BUXAvdnZQQnovbE1LTHhPbVhUbVdnUGJTd2IwQlBLZ01IWFpW?=
 =?utf-8?B?eFlKUW5sdzF6RzE0RHBBSmczQTdyaWp6VXJoL0lMVWpLSGVScDc3TnhzcUp5?=
 =?utf-8?B?c2dyM29Vb3JUcUpTc3h2dVI2eW1SaWZsWEwwaDZHL0hjMUw3MFU5VGphZlBQ?=
 =?utf-8?B?ZEhlSGw0VS9kM20wRHAwVGZSWE10QlRzOTM5dHI3V09ENjczVGJxWThSbU5y?=
 =?utf-8?B?L1FtVHF3M0hFY1cxSXh6cU1uZHhGZ0JMbkZ6R1ZWSk5BcU8yZGI3U2ZVb0tM?=
 =?utf-8?B?WnRzUUJxWnVOR3pWcmJzcUwxTkVhMDZQM1FuZ2R0NTR5dEtodmFuOHF5Qmho?=
 =?utf-8?B?L1RpQVRLRlU1aVphU1ozblpnVjJwdTVrb1cyT0NZdUp5RjMrQWpGNHFPS0Fr?=
 =?utf-8?B?Q2lCVVl4RFNtek56NE95MC9ucUJCWnpwcnJlbEFobW41angzRDI2MFl1UkJw?=
 =?utf-8?B?RGliMGRIUGs4VWJXNjlGdE5RYW5Ic3BnZU5DVSswd2RkeUVJcjhQV2xGMWVJ?=
 =?utf-8?B?VTNKd2lsRzhEUGl4S2tkZ09qRDJlRVoyWTF3c2VzMVlZT3lkaFY1NVJ1S2Q0?=
 =?utf-8?B?c2hPNitORGVYcHFsNU1Kbm5SWnhYS1lrYXVZNlBxczZQemVISHlpc0hUSWhF?=
 =?utf-8?B?OHJxbkJWdVRrZnA5eGVja2pHRUo0KzZYR1V0TWNKblNuL2pGeFk0Z3ZjcFJy?=
 =?utf-8?B?dnVTSm5JWkliNlk0WFRFeHgzSllsd0JhbEc5azVQSGNQVzBwSkM0NTR0WVR3?=
 =?utf-8?Q?fO9k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW0rNXlnQTJWdHRGUFdIYXNXOGNVeDA0NWFxYitxSS9INEVySWc1cWVnSGJX?=
 =?utf-8?B?MDlEdVBDK0xnTkx4YUpLVTI4cW83QUdTZHFxWU1QZkVKTGxuMUltK3Q5czZV?=
 =?utf-8?B?QXVzd3Q0Rmk1K1RxRjNJRkRxTE1pU3FLNGw1a3crb3pDU2dXZnl4Unhickly?=
 =?utf-8?B?U2tkb25JT291eVR3bjMxeXVyc0pGK29YbGJlUGNYS3VXVGtuQW10SWNwSHVq?=
 =?utf-8?B?WSt3Q3Z2K3ZvTDRkbmNOQnFmejlqTVoyRVAwZlVZQ3Azby9DUlBlL0tOeVYw?=
 =?utf-8?B?eC9zY0svc0d3WEljQTZKMjdNZDBQa2pXdFphanp3VmdZR1lNSDBycjdkcmRl?=
 =?utf-8?B?YUs0Nm81WDlkVmlrR29UTjVqT1JocnNoalY0Y3ptVlZzTUxaWFk0K005R21D?=
 =?utf-8?B?QjZOZDBFT0Rsdm1Ta0hGQzJhR0ZIRnNjaTVJSXJNVUEvdno2Skhacng0Y3RV?=
 =?utf-8?B?VlBNWFpHK1BCQ0U3NEk0ZGpFUWkxU2trK3p1RmRDQ0s5eTFrb0FxYk5IcGU4?=
 =?utf-8?B?RWgwWmJiRDJjQkRyN3F6NmhUUFdyQVRmVFIydVNMRjVnOXBkUktEK1BqeDNj?=
 =?utf-8?B?Z2pKNnhyRDh5eWcwRjRFUDNjT1RXSHFTMmN2aDBqQWhtVGp4VTFsVXFGMHl3?=
 =?utf-8?B?MEpqOUcrckN1OWdNQkdvR3lYMW8vZm9VeVNQWnU3MVc2dDE0WXM5MFhNRm9Y?=
 =?utf-8?B?aUhJbU5QWDVRMHRncE9OQ2RaUGFrWWJob3gwcml6SU5Wdzgyb2c4VTB4YXlr?=
 =?utf-8?B?UGRHcm1vYVhJNDd4RnVKRVVZbCtuUVNyLzRIQ3F4cjh5ZVNON05PMWR0MHcr?=
 =?utf-8?B?MGJZdUtLdHJlUm9keXQ2bXBrZWFROWNrZDNyS1Y1MGxoYytkSkUzZXZRNTNu?=
 =?utf-8?B?UGFKSEg2N3dKNlhCaTRCUStOZW9sTFpTbzVuVFlZZ3JmWnNPL2pMb2lnT3BS?=
 =?utf-8?B?RGRJd2F3SlF6UkZPTTdxZ3ZnZkY1Z1Z0b1hocTVndVF6Qlk1aDVjTjBxcmNS?=
 =?utf-8?B?czBYaFF0RHNBNm9xUjN3V3hlWlU0KzhQaTBEM0R6c2pKek5yTldHN2NzTGI0?=
 =?utf-8?B?bERzbzM5bmRlUVRMaVNRTTFUL1NLS1VlLzZxdVBrSVJBSy9oZUxWVWxHYTNE?=
 =?utf-8?B?cHM0QnQxMlRRTWVpTzNuc0VESTJkL0lET1FOWEhiRzVoaTJwVmxNMmhIM0dt?=
 =?utf-8?B?QTNCU0tEczQ4RGRSWFY5OGNJOEpjYVg0RmtLM2U1UW0xdUN4UkJCR0pSN3V1?=
 =?utf-8?B?SGkzKzNtWCs1WmFBazZLVGhVTzZvTWhpWHFPL1g0OVBCdzJmN3g1MElMcnlo?=
 =?utf-8?B?Q2VpT1NBVzREK0FJY3pGN0pUVFJEcjZBMXF0dUZheG5QUEY2dlExc1hIYTNo?=
 =?utf-8?B?WkdaUHV3bWJKb3EydlVjWTRyK3ZVaThkcmJQd1B4ZnUyN1RVTTdkd1BaMGxn?=
 =?utf-8?B?bC8vUGVaQlZKQ0UrTThKRGRZWS9aNUZnU3VIYmhkb0l6cFhUSHo0clBVR1Vn?=
 =?utf-8?B?VStTNklpem1vbWI3akN3Y1M3ZW9xeE1hVDdTd2NNUWNJOGdSUzFPQVRqT1c3?=
 =?utf-8?B?aHg0cE1rNnhKYTRCOHMyQ0ROMmdKT0MvODQrZnNvZG1qdHZXTlpnbTZIeGxO?=
 =?utf-8?B?SGN4d3JuOC9DM0RFTmJkc1Z4eE91QVZkUEwwWTRENTlXbFp3WUY5LzhNZ1Jn?=
 =?utf-8?B?MXlRNHQrMTFEZXJzdGYzL0s4SXMyS05CZFJlQ2x4cDRWakRnclRheXIyYUlZ?=
 =?utf-8?B?bzQ1dFg4TUhubVJIek1TdWUvdDlkbkVoVGd2SlNSQnplNGFheUQxcEt0b0lF?=
 =?utf-8?B?TnJUU1pSa1dLUzNvdHlLWkpPM2ZBRlQ4b2hPdUNlT1hja09HOC9TQ0JtU2Vy?=
 =?utf-8?B?M2Z6UU5POEd3c2dHRUd1M1hqYk5zY0dTVHZ2MmYwdWlaeW1PMTJFRDdlZmJY?=
 =?utf-8?B?WjJKQWcrYnpyT3A4em1DdHFWYjNubTUwT0NrR2txcWRoMGRqWlBRdWtDWUFn?=
 =?utf-8?B?NUQ5M0tJSGlHL08wcXdCU2dhTWFtKzQ0ZTRPVkJaSEtnVmx6Rmg3cHAwc2tL?=
 =?utf-8?B?S0RoMThVSUdtLzhQM1Q4ZkJtZ2hqc1hwL1VIZ2pydENzYUJDNWxqTDlWYURk?=
 =?utf-8?B?ek85djVvRlVKeXlXcXp3OTI3SFlDY2xySXRKMkJQT2cwbTdLMkx3MG9JcmQx?=
 =?utf-8?B?V0pWMDVyazRoT3g2VWRzK2RqaFZoVFNOWThvbzRlcFU4alBkMyt0RzFvdXRG?=
 =?utf-8?B?a0dlSDJ3Nkk5blRZeHVsVFlIWnc5UXhld05DZDBaTzFiTzM0U1B3ZkV4R1NN?=
 =?utf-8?B?TGVoTkR2VEVUbTQwemJFaXl2YXpTc0NzUEhrNkxJOWpGTGlzOXJBdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c061962-0315-49a9-0e23-08de605f2f4f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:25:06.6760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxQab10Mi2SdjrM8Z15NdKqlMtzXWx4S77qmcVGN0LD5k+8cfobtquZCJ5qY6XwPWEEGVt8a6Qnttzv0Kv2Igw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6218

On 1/30/26 4:20 PM, Danilo Krummrich wrote:
> On Sat Jan 31, 2026 at 1:16 AM CET, John Hubbard wrote:
>> On 1/30/26 4:10 PM, Danilo Krummrich wrote:
>>> On Sat Jan 31, 2026 at 12:58 AM CET, Gary Guo wrote:
>>>> On Fri Jan 30, 2026 at 11:36 PM GMT, Timur Tabi wrote:
>>>>> I think there might be a problem with this code that I don't know how to resolve.
>> ...
>>> There is no need for CONFIG_NOVA_CORE_DEBUGFS in the first place. The only
>>> Kconfig we need is for retaining the GSP log buffers after driver unbind.
>>
>> Interesting. And in fact...I think we can live without that feature,
>> especially if it complicates things here. If someone is debugging,
>> and they need logs, they can usually (always?) find a way to leave
>> the driver bound long enough to get them, or so I believe after
>> some experience doing this. Yes?
> 
> I guess you could put a long enough sleep or just leak the debugfs directory.
> Not sure how much it hurts developer ergonimics going for multiple iterations
> though.

hmmm maybe you are right after all. Because I was thinking that driver
unbind wouldn't happen right away, but actually it would and yes that's
not a happy story. (The hacked up debugfs I have locally doesn't follow
the rules.)

OK never mind, I like your config idea now. :)

thanks,
-- 
John Hubbard

