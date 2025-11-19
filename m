Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6928B2D7814
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763585153; cv=fail; b=Q0ZEZGve2/Npm55HjIEe9ZBdX0EHrAFx12RfQ+zax84plwlRJ13bym+uXBz5ZTlIiIOToD13CI72jbY/FgLAouja6FjOsUihKQtp2hDmv6uIeL+2tnvIV4PRneE7B6ClETQ4rU6fbu05kxyoD25uM7pvoIwrqqXfKTpYoBejcMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763585153; c=relaxed/simple;
	bh=+83BKLXxZk45svIN/1FZyMhkifVy51YnvPxgxy+/5Aw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=upQD1Fjh8MhmZYFs7VhruQ5ajxqktkytqs447PuCtjAHEq1y6vNftE6ifllOEUV518fzLCeJyMcZ6y4XXENk80n95CkiveF1Nw207VyNM5csl5HQLK6qUS6bnr/NOZNeRrG4ePs3M+/vyI/EakRtcq/qtZzRi08ByKQOcX0uuGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p2yv3ZPj; arc=fail smtp.client-ip=40.93.196.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p2yv3ZPj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lA37SVi35eJ6eySAq1j797DCCsMWDsmveGzKSEOOt/EBaQ5x/2XWF3TuTXMztOt0Z3ykKUCasqXMu62iSswvAvpfVx1rgUKh3P7DzDNOowwSPaB3HbQG/u6soVrjLwyO0md8Jefq+othevgSmG8eSIZjVCwucVeN/cSBRDdsgXVpThXrHWw7T39gajbIEdpWrUVzU94gAkkO/4RWSrgpjRAfls2i+Ge3axAcLw9/OcivrVlzN6OvPqN2O7o9e1x6psOQMGpNdbJQGCLn2rLqh7y6K6YE0VkQ/a+Dhgt285tKp1Fc91qQjFPswive+Zed/cB0vY9YA+F1wHjKh1Jjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+83BKLXxZk45svIN/1FZyMhkifVy51YnvPxgxy+/5Aw=;
 b=Ok93PMdAGSjZEFORSk+5RZ25IpdAJsNILttRLMoX3FGO5uVL+zmUYFl7zronrRYyyQ3RyAmtAIyx2JMfP4GzH8z4P7VD3m5VbQjZBwu1/YrpTuOF05pKPln9/TfEX9NK9wIbb4+AewoT87v6KpBGzrkQb1mTRyZKVtjpQN8B4lTaomnC/a9jRgc1wTtZZS28DTnrhCm0NzGkOKKfb4Gw+YSfemjaIi8DI3UJ7ddYvVaFB7TXAVAobA927yTjLOygFZQ8/A4p1JeFtTAGbMOQrJ7ucWisl4owCF21jKuckaKniy1fBTcOp2Cx9pEJGhiyV3mxrGt3ebhOm9uImFrmXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+83BKLXxZk45svIN/1FZyMhkifVy51YnvPxgxy+/5Aw=;
 b=p2yv3ZPjA7FFLOI8Q/wHL7UpaIU7qjTGuizu6h2lHyusPTwYN8GQIX4CvHHPTRPwqsHQFBYcytXGO2L77ZFeIm0REsdNe5Te9nFJHNTT4h4LD7Jsf+z9pULpKDWr+XMIcSJiFaLq4V2IX3Xyd+GO5bcC4T5Prsl2gXOF0SHmpw8UllQ8bO4DRR8fAPsfEV99waf1Y8wGEUJC0+acpSkwAd8US85pNEe+dYzKiTxz92d80hojOQua5jfAVKHI4RhueWrFaEj2HUme+oFOS9yYj+JI8IaYEEg2BB/6UpN+i5gyPbut/BhHBTr3gvVmm9g3EoAnkwUteeI++BTeG3JVYw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SA1PR12MB9246.namprd12.prod.outlook.com (2603:10b6:806:3ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 19 Nov
 2025 20:45:49 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:45:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>
CC: "nouveau-bounces@lists.freedesktop.org"
	<nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
Thread-Topic: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
Thread-Index:
 AQHcVb7HnZgTrM6ka0OpQ9aSKtoZE7T5Q12AgABNAQCAAAcFgIAA2aSAgAALaYCAAAMEgA==
Date: Wed, 19 Nov 2025 20:45:48 +0000
Message-ID: <3ea243f63f0e0efabfc5d306797883b0196399e7.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
	 <20251114233045.2512853-3-ttabi@nvidia.com>
	 <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
	 <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
	 <DECH3BWOVC5D.URCD7WOS3QJ9@nvidia.com>
	 <38438d5538939ecc0841a09869a2e168ec2246c2.camel@nvidia.com>
	 <81dc8ea0-3cd9-438c-a74f-e5805211fa38@nvidia.com>
In-Reply-To: <81dc8ea0-3cd9-438c-a74f-e5805211fa38@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SA1PR12MB9246:EE_
x-ms-office365-filtering-correlation-id: 370d8003-7d6f-4567-ed9d-08de27ac9f11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGpGazNBV1lnVEZOejYwRXo3REJjVHAveWJZc3RkVVVnejFHOWlYTzZHYXVU?=
 =?utf-8?B?QTh2Y3hEcWlRSlhRVnVyUW1vb0dudTIvUzVuUDJHOG4rWnpJemtsaGNpRnVo?=
 =?utf-8?B?VkFHUjBscmJvOFdaZ1JybTVucHJCMVQwM2tpUlpYUVFPK3V4eEhhdWw5V09x?=
 =?utf-8?B?QzNhZzA2NHQwdnk0TnQ1aDRsNGdLODhSM1UvdUJubUptVmVNbWl4RlVrbko0?=
 =?utf-8?B?bG5GNUFGblloRXAwWEpHZFUzanpEODhOdEo5MUYyWTZsVGxJVUN5TXg4YW5y?=
 =?utf-8?B?cXdScUdYSWJsYzJHNWhJeUI4QnhLdGdpMG9DVEVFSGVFU0QydFpERkliZFpn?=
 =?utf-8?B?Zm8ycFViUHJsYlhIVWlIblVReE5UWk01VzRtekJrOW4rODNmaEZ3MDU5SGtG?=
 =?utf-8?B?UStGZTNnZzFkRWg0c1VCNzVlY3FvbHBXMWhnb1R3NGZZeGh6ZVZLbXpMMVc3?=
 =?utf-8?B?UVljQnB0M3VZZ0x4dzZrR1c5L3AvekdGakxZMmVLVVFyaXFLQU1meEpXNGpn?=
 =?utf-8?B?RlBUVWVQN3hCTXpqbFM3dk9KNDY2RXJwTGZrZnM1N09WV2dROHZ6QkJFdVhn?=
 =?utf-8?B?NFFMZFBjOGFPMUFYL1V6VFQ1Tis4VHU4b2s5cXRaNHNQenU2ekZrdU8ya2tV?=
 =?utf-8?B?QUlWeSszRm0ySDZmQ3l1ZVVkNGwxbnFLVVBNR1hlOFdEZURHSnZGWCtpQUg5?=
 =?utf-8?B?MXNHSGJYV3Y0MFlYTTR0TFlrcnpPSlM2RCtCWC8xSUhtV3c0RmM5Z2F2dHhV?=
 =?utf-8?B?VTc1dWd2TFJZajZtWnFpL3ZGZGhVazZXSXZsemxCME1MQ1ZBaWJ5eTNPSG90?=
 =?utf-8?B?STQ0WDhiT1dFL1h3T1R1enorSW9OWENCREVBVWxLWG1aR0Q1bEtHay9aT3d3?=
 =?utf-8?B?bnhsSjhrNFVZbnRJWnduS1gwV3dzSDMwTk1udFNPN1JKLys0SjlPK3d6UTRS?=
 =?utf-8?B?eE1NWUcvTVU5NDQ3RlJMLzB4eHZYVkk0NDkzb0lJS3pvK0dENFdVMWhxZXNQ?=
 =?utf-8?B?VjBrcXRTM0hKSkxtaUZXajZ1U1E5cjMvWWJILyt3SWgzZGxORkRQWjJpQzRt?=
 =?utf-8?B?WExqaVMzek91NDdBZFJINWJZR3FnWExBSXBWTFhsbHRXUktweXd2R3MyTnQr?=
 =?utf-8?B?VFdQWk1QNStPenQvMFVOTk1OT2k5M3I0VFRxU0tsS3p3TzB3QU5xZS9xWVI1?=
 =?utf-8?B?MUVwOFZjTU5JS0dwdFptQkh1dXZWRjNpOVFUSEdEQWw5S2I2TnV4S3R4Q3RE?=
 =?utf-8?B?MDYxelJJOXZPUlhRUFJyN25sa2pLWU96Q3lSY0lycnA3ZC9YVGNldTNQNWE1?=
 =?utf-8?B?NWFENngySXRxRnh3b3QyeDg5SmgwbUdXUEVib1d1OTdXZFhPNFgwK1JTeFgw?=
 =?utf-8?B?Q2czYTNvZ0UzQk9kRm1INUgyYVZVbVlZaUdMMkZ5V1psVVVFek5PY2FBRlpn?=
 =?utf-8?B?WXFrZ3NmOGpkbkhEY2JqMlVSZDhub3VKU2RzeitRZHMzL25rclBZRnIyS01h?=
 =?utf-8?B?OGJpQng5QnZybUpuaEkxdFo3WUJBYkQvd1d5cjVBazZUMWxRc0FCNXplVG0x?=
 =?utf-8?B?VFlGU3Z4SSs1TStSWmpGZkVUaXFUREx0YVNiVGY5U1plcWE4Ryt1Ry9jMHQx?=
 =?utf-8?B?MUNEcjA3TmNUek9CdTZwbEJjaHdDeE1zc0NSTG9GRHB1RjJjQjUyU1dMazFW?=
 =?utf-8?B?MWpaL1VFWU5GTUV5R2srQkFXaTg2dVhWZGhMa0plNWlHQnFWUlh1aVorczBk?=
 =?utf-8?B?M2crUDBuNCsySko4aGI0T29sam5DT3BDWm1xMmVzdTZuZ3FPVkJZQWc2czJI?=
 =?utf-8?B?QXR0N2ZCdVNtMFJZK0NqT1huR21neVVlOHFxMUxieFcyRHV5bkFJR01QWjFl?=
 =?utf-8?B?K3dSZ21JbFJPOVVnZnUwdUtNUHBqZnR3TkZzV0ZrQUp0Yld5N0ViR0hHb0lS?=
 =?utf-8?B?dUYyYkcwSkJDY3ZXVWppa2NhZXpPU0dVYVVpeU1peTVWZkVYSTlXWmtBMmh4?=
 =?utf-8?B?TVRWZWUzZkowQ1JSOHI5TXZKTEU5WjF2bEhOdnU0RWY3VUJFL3ZRM0thSUx2?=
 =?utf-8?Q?I3mIIJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGFmdUtCaHk3LzczV0JaTmJPOThZc3Q1R3EzUnBIODczbnh5b3luUjdaYkt4?=
 =?utf-8?B?OVZqQ1FJeVphMFJrenZmS3dpWTI2alRSTDlnZmhFMXU3M1Y5clJzRHBWZjVN?=
 =?utf-8?B?b2RTb3dQenJ1UURsOHhMa3VwRHRmSHBpMzRQQjdabUNIODJDS1lWYWpYaU5J?=
 =?utf-8?B?MHFXVkNUV296T1EwMkZOVEJIYUJzSXdGWStNTWp4cnRqdGVPYTNaYmRnVUUz?=
 =?utf-8?B?OXVXeFRLWGhzNTZjRy9OeU9kQlZTMnJkcmtLMlI4L3l1TENoRjlwMnJNaGRL?=
 =?utf-8?B?Z3E3Z0RJYXR0c1c5UmhZUGl0akNoUTJxZnhsM0YrWkZETWRLT1FlVjgwcVZT?=
 =?utf-8?B?WjdlVDIwdFVuVUJhUEs5Tk5WMlZUczlETEM3TndqaFlVa2o1R0s5cDdOdlhZ?=
 =?utf-8?B?b3dHbkJTQWs1d3FjYnRFV3FiZkhPdXRYSVovR2JoSnRJaXZXSmZpV3Zsdm9l?=
 =?utf-8?B?a2F6UmJqODVidXdIOHRzdElDKzFzaDljT1I3aTkxNURpZk51bkJDTWJGVHFs?=
 =?utf-8?B?V1VjZ21MdUEvWlM3c3JJVXBneTZncE5GZC9zM1lWVUd4Y2RJSEc0UGxINS9V?=
 =?utf-8?B?Zm1WZTExTTEyL2hmeFQwOHMrbE81RXgwNHlDSXhZeGJlc2pFaFV2TERtYTAy?=
 =?utf-8?B?SDhneFlTUk55UzBxWUtZNFEzN1cwb0JBTG14ZzV6Z2NCOFl6VVVTbXdDNVU5?=
 =?utf-8?B?bWpSd2N6eGtrU2UzdGV3VzRKK0doR3B4aGl4OGROaC9BRm4wV0h0L3NTRjh6?=
 =?utf-8?B?a3J5UXJwbW9CYitqeU9GYWpsam5yZ3c0bTJKa0hWdGhRelBJdm1WYUkzVkRr?=
 =?utf-8?B?RkhXa1oxSjVjR24vNlBaNUgyaHpmdzQyMVVjYkpIbm5HUnp3ZVRrbHdUbGw2?=
 =?utf-8?B?enV4blJJOTZGYWp4bGpIWGw5S01tQ1pIL1hEVzEvMmFoSElvWnFQTnp5L29F?=
 =?utf-8?B?dHladkVSSUFXbXJiQXNuTnorNkdkSy9wbWRXZVhBQWlqRm1IbnNrZFRJZXdR?=
 =?utf-8?B?eHpzWFpaejR2UnowVHpiWmZBVkdES05pcW1OUjRYbG9adkhVUnhNbTA3SmtZ?=
 =?utf-8?B?SjZUWGhqUURTZDNiOS91by9TQ1Z3SWo5cCtrYXNwcXZlQ1FTTGJsL09kc1lj?=
 =?utf-8?B?dFdHYnhvNGZTTTBFWWtPbFRRRFZLQVBCTE1jOU9WbWRkcllFV2dQaFBiZ1Aw?=
 =?utf-8?B?YmpXTGFOLy9rSzB6d210dlZ0dHA1R05rZXFLRDMySitZTDZMZitDc1VYQnhJ?=
 =?utf-8?B?UHVVZ1YyaHA4ZWw5bkNPN2lkU2pKNTZ4N1c0cVFmNjlYVStEanpacjR6VUhI?=
 =?utf-8?B?WktXM1R0QXo5QjM0aHU3TS9TK3NjQkxTVkg3VWptUlFGbzh0MFRFWmxlYTEr?=
 =?utf-8?B?cmQyek1ubE5XbEluSVgweG40WDloZjNLcGNXUVpBV3VDa1QrNG1ZeE5RVkJh?=
 =?utf-8?B?NkcyUWRGckozTjF4c3g2cGphVy90ZnFWNnFJL3VNMGRraURxMC83R0w5TVpa?=
 =?utf-8?B?UHRTQ0RRa0ltWjFNNDgyVWFxMmdOUm1UUUQ1OW5nUWxKdnBaV3ZXeEd2YXZp?=
 =?utf-8?B?RldSSnM1WGdLd3hyMWhlLy94YVAydEMwOExLejZSbFR0SC9JMEQ5dURSak9J?=
 =?utf-8?B?KzhMcCtQQlh4aGVQV0RiSTV1TjlRUTRuOE4zbGcwd2RnQUJoVWlKbVRLVjdP?=
 =?utf-8?B?VEdsSzdTNy9EcnFTbWsyM0l2ODEzYmlwR0JGNDV4a0t4ZFVUMjlWQmtOWWtX?=
 =?utf-8?B?Ymx6alFmeXBPVTZSTVhwamRWZ3YvS1VFYXcwa1FyUnVldGw1RFUzQWVEYlRm?=
 =?utf-8?B?SVhISFhKS1BvWkhLOWZVOHZBb1ZRVmMycDJkM1AzRlJTQ1paZ0F6bktCRi9I?=
 =?utf-8?B?SUU5dnhTRXRyRU1sMDJZR1F1S2hXR1BXdjBWQUxaYlZDWkNOZTdWV0dweXlM?=
 =?utf-8?B?TmFQbDZVNG51UEc5OGtkdkxxaWdCSXV3S1J0SmJDYisza0NvZHd4OTNnWk9q?=
 =?utf-8?B?c0ltZEUwQ3Qyc0g4a1BpUVFRZ2hSTExMOWlERGU2NVBWRTlzYU5sMENGREpL?=
 =?utf-8?B?NVROVzBpSnFuc2IxZ3I4RzlGamRpcnNhVTFod3lGK2tZU21UTHpJTnRkYUhB?=
 =?utf-8?Q?0KlbM5G8pUsbAQewPg+ornA/E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <422AE98805F9AB4BA104FAD290195818@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 370d8003-7d6f-4567-ed9d-08de27ac9f11
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 20:45:48.9358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: usFalZrpWs9XHb6Yd+FJB83SSkC16ks+81ZG9YznmmFD0NR7ZL66FxENB4AyZnD95fggTXtXNjvzJ6M3qvdwcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9246

T24gV2VkLCAyMDI1LTExLTE5IGF0IDE1OjM0IC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gQSBzdHJ1Y3QgY291bGQgYmUgYW5vdGhlciBvcHRpb24/IFlvdSBoYXZlIDIgZW50aXRpZXMg
aGVyZSwgdGhlIGxvY2F0aW9uIG9mIHRoZQ0KPiBtZW1vcnkgKGluc3RydWN0aW9uIG1lbW9yeSBv
ciBkYXRhIG1lbW9yeSkgYW5kIHRoZSBzZWN1cmUgYXNwZWN0Lg0KPiANCj4gc3RydWN0IEZhbGNv
bk1lbSB7DQo+IMKgwqAgdHlwZTogRmFsY29uTWVtVHlwZSzCoCAvLyBlbnVtIHdoaWNoIGNhbiBi
ZSBpbnN0cnVjdGlvbiBvciBkYXRhDQo+IMKgwqAgc2VjdXJpdHk6IEZhbGNvbk1lbVNlY3VyaXR5
LCAvLyBlbnVtIGNhbiBiZSBzZWN1cmUgb3IgaW5zZWN1cmUuDQo+IH0NCj4gDQo+IFRoYXQgZG9j
dW1lbnRzIGV2ZXJ5dGhpbmcuIEJ1dCBpdCBpcyBqdXN0IGFuIG9wdGlvbiBJIGFtIHB1dHRpbmcg
b3V0IHRvIGNvbnNpZGVyDQo+IGlmIGl0IGhlbHBzLg0KDQpTdXJlLCBidXQgdGhlIHNlY3VyaXR5
IG9ubHkgYXBwbGllcyB0byBJbWVtLCBub3QgRG1lbS4gIEkgZGlkbid0IHdhbnQgdG8gY29tZSB1
cCB3aXRoIGEgZGVzaWduIHRoYXQNCmFsbG93ZWQgZm9yICJTZWN1cmUgRG1lbSIsIGxpa2UgeW91
ciBGYWxjb25NZW0gc3RydWN0IGRvZXMuICBUaGF0J3Mgd2h5IEkgdGhpbmsgaXQgbWFrZXMgbW9y
ZSBzZW5zZQ0KdG8gaGF2ZSBqdXN0IHR3byBJbWVtIHR5cGVzLiAgDQoNCg==
