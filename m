Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673FF283FF2
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974534; cv=fail; b=Z118n1DB3EyH+GTIKwUlrEDxFgU8XBtMRATs2cjT+j7xoYReJGNSuSc9Aq3pUr6q4oV6L63xlexUbK63u1ARum3fQdeKWeBxVTTW7sXXpu3FsMoueZlbSqJ1ft2pk+mjuzZN1fKUuU8m3vfFsomCdraEcrJJINdQxjE5r9LIPuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974534; c=relaxed/simple;
	bh=aviKPLZHHP9bQXgpGmUmKSXqpeiCAhMy/+UJ4UWoAZY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UWuNwtLMcLP7bPOCaRop8bUCFrdDHYza4CZ6Nq/XpONWbtzgTqOYebE+SerTuOSodtHJCJtbs+KDv6efGRkqhwD4VXiRWC/qqZVMmMvS41nOjBTtwRKqTDJB8fLVDSuHwr2BZ3TGnD7QctjbVzo0O8oOZuRwK2WWKMA9oMTt9eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N+FzRbuU; arc=fail smtp.client-ip=40.107.94.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N+FzRbuU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jk8P367NWpqx7OLGHbEWGeDPqBhNBjkU33BLWUetQGFGZDPMAOaoj7dTjsRzjLWUeLbb9QA2N3DEx8aG62kSHrRXBnSh+fsCFNQrq9GDXj7vGkv2uJiL+uIkc19m6cCCu7M8+/SlYrE7+GZyhEs4RqJND4PcTmpPJ3iEUI08cnuIP2aKdkvtMKrRF7ywqsGAPXh9XO9JqSN6gsImu+yQzRsOCZXjfHd3SrbhTHj8aSeUGHJPYN+LcAc/f8BIILv9NiKTVge6sxG+bj45Feo9vrPzugz+ri39LzQJbBWpUpfiKbyYvv8qrLIHxKVFwFxy6JENbWbOQL+tjKAeVHVJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aviKPLZHHP9bQXgpGmUmKSXqpeiCAhMy/+UJ4UWoAZY=;
 b=lP+9G7cs4JIt/Od2+3vxAmyDb3A4VMJMV4/PfKODWSxppJftwGDxfK+A04Ro7FFQz0BqpPMgUK50PRStC6K2uccEiHr6MyZq/0NN64MHoPVrK8CR9F8H9cbXgj3lfWdydaHD6t+awZfZn99Il3mG6dqAi/t5yQWNX+OkGuTqO18E+cXMgej6ZHfqQNqzSx8XOOk+R07WamB1Gwv5TqDkqaRDlzFdDrNvlM445CVGBrTtBFZVJZEcBPP+VfHYj19yYaA/W8q7whNT9BBqz+EgevHM5qlufAJGgcRLXZ2b3OnHEjJNsEe+gd22ss69HalfCY3B5EyTyadPB8VZ+LUTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aviKPLZHHP9bQXgpGmUmKSXqpeiCAhMy/+UJ4UWoAZY=;
 b=N+FzRbuUFQweG8MFJLCQNjgBYQz39vq/vaE/ynHIAj6xrBwNR5zNNe/5k5WBiKiAcNmqiuq3u2S2UnvBukQHE9s1Uoyr60mIOpJ7Llm0LMv2V7Q5abmu152kTXr9RKwSqJumIhM6YYycVA4T3Wvsw5jZpNAjqSBWlp/0y4OfBNwPTxp5PJVNmDDPS1nl9NLgvsSoWjiktXNOFCz6xttCrFA8gtdMCLr7037GySs8w7lsa4dJkpVGrPJsI9sf9oQoFJZy3l4MY+HAlTvl6ssvDJAq1uRDYMpmGW3GGstav4sSDUtaoDxAu4wmQ4NfLLbixPVbpHD7cJlm+FSUKjptCg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 18:15:30 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 18:15:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Topic: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Index: AQHb0Mn7MGE1brglZEyKYzrCM8w6zLPqDQoAgAe4WoA=
Date: Tue, 3 Jun 2025 18:15:29 +0000
Message-ID: <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
	 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
In-Reply-To:
 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ1PR12MB6052:EE_
x-ms-office365-filtering-correlation-id: d75bf761-79ad-4f16-ab73-08dda2ca9f7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SUp2c0JIb0RrazdUOXQwQndTRnJYOTdheW9VMW9sY2xqdStsaC9CeHMvZGEw?=
 =?utf-8?B?dXNYdHF2eGZZTUE5OHlPN3Uyd0RWOXZwWlAzYVB3ZU9iMDREQ2FOMUR6Y0hQ?=
 =?utf-8?B?alJXYkZlRm1yNG1ES3N4empyU0JlUDNhMHljZzd6WTFzVTlMdWxhOWt0aWVX?=
 =?utf-8?B?eUhsdTQreXlYcTIwa0NHdE1Ea3NpVkRDYkhpcnNKSTBDYTlhblVKQTYwMlIr?=
 =?utf-8?B?VEFMbm1GOHhtMTZLUGc4RklXTHR5S29GdXB1RStTMXJGWDNDZGxFcTk3RTJo?=
 =?utf-8?B?OVRvUTk3eVE1NEtEdVgwWklTOEpORXAxVkVVL0wvbnN5cnQ0NU9YaVpCc1Za?=
 =?utf-8?B?NHZWK2JJSXNYZTZIbzhLRmhERms0MldjaFZNV2VmMU5MdjJMd0h0RE9Kd29o?=
 =?utf-8?B?ZzFFaHZ4Q0Nianc5NGQ5cENERUtIZEM5RVhyN3VkeEQwbkxzZ3JTS0lubkFN?=
 =?utf-8?B?VTM1NWFjV1RNMkFxY0tIMG91cW81TFA4eW1XQ2taQlU0SUw0V3hvWVhlU1R3?=
 =?utf-8?B?dEx0TTRjVzhYdUNaRkxMZHJvSTF1OG9SVnlOZVRodTRhVUZWOVAwMTFwOWlO?=
 =?utf-8?B?Y25ldy8zMW9lbTRCdm9Bei9oMDBSaGNQMlp3cU9WU2xwdnV6K2NqM1BQMWVI?=
 =?utf-8?B?VGZ1V0lhN3ZNRmQ5WTlmQTB4OTcyWTMyZTgrMHFDWjRSV1BKZThtYWlsYWY1?=
 =?utf-8?B?TWZ3SWoySXU5a1ljNFBITGIxaHFuTk91TzlJNHZwc3lUbDJYRWozNkxSYmpn?=
 =?utf-8?B?K1pmRkw4L3VZaWk3TmlReDFJZytCWnNXVFVnUVhLcFloaUdEcERQejdBbk1M?=
 =?utf-8?B?R1Z4SDA4WHNRaXV3V3gyNy9kU0k5ZUdZYjFzZGZnZ3h4c01ORFFSVG1iNmZu?=
 =?utf-8?B?RDJnK0NISHJJNDRYUDIxYk5aL3BqUzhQMHJiR2pJWWVMN0x2L1FtTExNSW1L?=
 =?utf-8?B?bXRjekZkc1F6M3Z4bWdLWEhxK3FrMkNsb00rYUpqMjg2UjAwamwzVkFXMWc5?=
 =?utf-8?B?VHlrMFlZMTBHVTN5cnR2NFlnVjF4QnVKVWZ1dENZWWVVWUdEN1QvU2xybjI1?=
 =?utf-8?B?RlovUE9EaDd3L2tZNmZ3UEdWTWcyc05HdG8zbUF2VzVSZjQySGl0dzhwZTg3?=
 =?utf-8?B?WWxvb2Uwd1M3dkpRN0sremVzaERiemF4bmF3YkFpVk9scmlRVFdWM2lNaTRM?=
 =?utf-8?B?V0h0WFB5SDlrNTVKTThhcEtqcTJDcmhQdnZVOURXZmUyNEdCUnc4cEhTelg5?=
 =?utf-8?B?NjdLTUNDaFJFSktqcGVheDhUUXRMQTFBd2xVL1d0WjdsUmpUTnVkWUJtNTk5?=
 =?utf-8?B?eW1jNHZORWtTZmZEN0NmYVVrcXVEOWFGYXVmRkMySHBBeDhaQjRhWTE5Y3dI?=
 =?utf-8?B?UEE2TFZ4bStFamZXWXlSYzBCai9Famlyak5HWU5LS21WZkZOQTZQWStiNHh3?=
 =?utf-8?B?c0kvVFVwdGZjaTRPTmxrNStrRUE2WDc4NEp5SVNKTDM5cnRuS3lUbzRzWUdj?=
 =?utf-8?B?RkdRRVpvN1BwZlU3QkI1TUp4ZnlSRTJkV3FadmJiOGJFQjZrRDR1K1dkN3dT?=
 =?utf-8?B?Q2RLTXFFMXR0VW54dm5VVFhPbTB0T29jWmpEOUpCSG00UEtSaUN6VC9BN1lx?=
 =?utf-8?B?TW1IbTIrQ3Zzb09VSTF5UVZyK2xoUERkeGl0U3MzTGxyd1czZXhCUVVPVzgx?=
 =?utf-8?B?VUk4eTFGRlMwcXNseVdNZlkzdlZEYllTdEF4SFc3M2h3emlrMmI5OFM5WXRS?=
 =?utf-8?B?NUtzczZrTzNCS0tVWllEOFR0Vlh4R010U2phN0NCK1A0ZTc3aUJCUmRjNHJW?=
 =?utf-8?B?NHdQOXBienQ5azBFTVlCN0NtRXRuS1dFQmF4cjZnQ0hYSjVWYU1PeFY3eDRh?=
 =?utf-8?B?YWFLZTVkNEVnQ01qd2ZvM2hMTEdWTjNmQ2x3Z2dINDVvQjE3VlVHSEkxWkNL?=
 =?utf-8?B?UVcwZ0lSUHZRU0lUVmlkV1BKeHBYdE9JU0pESHNXU1dENG12MkRvQUY2ZzRO?=
 =?utf-8?Q?f+zG8RIEJaou8jJl74t0KQ8HeLHvAU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dk5tOHBxWmducHZMWEJnT1M2bWlLZ2FISitBRzRGR1JYVlFocVhwOWRNb0lN?=
 =?utf-8?B?Wk5BclRpbXdJVm5SbUpVZG05WGZpZlNhOTBua2VNRXlkVEljWHlhNUt6WWV3?=
 =?utf-8?B?QUJSV3pPdGQvdStaaGxmWFY2RlFpRVRld1pLTWUzNTBrSFl3TUJ4dzNscnox?=
 =?utf-8?B?dnhBRUM2TGNSK1pVVWZQWUZHZWZmT2ZZcWV0c2tPSXQwRisrcjFRTWh1Nnov?=
 =?utf-8?B?Ly9mWDV2NFhLdFlwYzc5MDVsRUlrc2w4OVhYRU82RjRDMzhKY3IraWZGZ0dh?=
 =?utf-8?B?Qm80c3FtV1R3bFpiVTdTMGdjS3VNK3N1SXdIbmdKcHdBYWdhaE5vY1ZpcDlk?=
 =?utf-8?B?QnB2S2NwSkZXOXE2WkVVNW5kSjZFTENIQVNJSFVJcHM0ZksxeXhKM2ZJYmtr?=
 =?utf-8?B?MVk4b0Y4bWJmSFJmUFBNdTlVYXdST2Q0cThZbU5yTllhUjJMNEwwUEpVdklk?=
 =?utf-8?B?UHl0YnpDYzhtVFhmYXllaVdHVXBVMTZIWWZ0RjU0cGFjaW5xV2IremlaRTVR?=
 =?utf-8?B?TjUzQkwzZjJvQVRIMVRaRW5HUzYvQTcyd3pYY2tQaVMzU2JzZHdSWXg2NW5H?=
 =?utf-8?B?TC9zOGplTEx4a1NQUlprbElQOGwrdmtwN3BTdXl3cDF1dlpHRWhvaldDY2Yz?=
 =?utf-8?B?akt6bDhWdk5sdXgrbmdMWVVTZW5uK0Mwam9iZEJWa3NWWURBNlN5WnlEWkU2?=
 =?utf-8?B?MHJLRWh2Qi80c2d2dGNMNXpBNkJ1N3V4blQ1dSszTzBJRFVwNnpYZ1FOeWNB?=
 =?utf-8?B?Rkk1UU9Bbm5mY1dLcEZQQ3M0T3V3QnNnWlF1dUIvRExoaWxOTEZraUNsZWxL?=
 =?utf-8?B?dmZyTE5zUHVjeFB1dHZ1V1BjaXNlOVhCQjNmTEp2V1VrbDB1NDlJQmR4V3RV?=
 =?utf-8?B?M0pyRGtITDBIaVI4emZIMHpHOWhja1g4NG90aWxKcHVaSDZzR2o5VlhxS0gx?=
 =?utf-8?B?dEJwRGQ4Y2MxbHRncWZJOE8ycnRWRThtalJ4R2Q2RWZoSEFweEdXZ0d4NGls?=
 =?utf-8?B?dFZrbC9ZYk1xZE5VRjRIVFFsZHIvMDAvUEpKTXJYUEt5b1gxL2h5THdJZytO?=
 =?utf-8?B?aHRZV3Bqd0xMeFdPT1lYR2lUYlJIbXBCd2ZYTmNWUkpOVEdyWE9BT2RiMlFB?=
 =?utf-8?B?ZkN2QmplVUw1bUptOFVUMXgxMlZxQklZc1FDVW9BRkNBZ2R3THFYS01lT0t6?=
 =?utf-8?B?Ti9IUnNTdnFxZ0lIWTNqNG8zaFdWc2xLNmFhRk5ZZXNRTXhGK2R3MTI5U3RG?=
 =?utf-8?B?WU5pZnl5V3hnZlRHN1E3eDJYbWdadytQa0RYYlhTS2JqTTBMeUc2ODZnZ3lu?=
 =?utf-8?B?dFdKTWNqMnA3MW5WSkp2d2tmT2ZyL20rTW5HNU1nRXhTanVxRE9vWkVUcSsw?=
 =?utf-8?B?NFFSeWZqVURtK3JETXVCZ0JieWg5MHdRcFNnMGpkTUU1OVg0NDE3NjczT2ND?=
 =?utf-8?B?aVZjYmRTbEd5dFIycHZnL2JaWlA0N21VQ2N0Smh6UTRxdG5qY1NCNEJ5MEhF?=
 =?utf-8?B?bzFSejMzam41VXR2ek1CNHNhRE82cG1lM1JRTjJCTisxeDB6b1VNRWdFRjU2?=
 =?utf-8?B?a09XQzJLME9iN1M4RkowMG9nakhURldkZVpPU01VNmM1L0N3b21lR2RLekwy?=
 =?utf-8?B?MXExRWJ0QXNHL3M1eHNFOWNpZ0YvUy9Xc0d0VGtIdm1PempkNHBTU3Z6RUU2?=
 =?utf-8?B?NGVmdlVaY1N0OWZwQkkveXNrV2I0RVZZd1I2WHRrdFlSeEdGaTZsQkJFRzRV?=
 =?utf-8?B?bmFPbHl2VVJmMmVENjB4MnhGWGI4UEd4VitjdUZia21LbW16QzV3cUtPR0hn?=
 =?utf-8?B?VDZacFRMOHBuOWdpdkxVQVlOTkFqeTkxWGYyZHBFbTFSck5lb2hvNmJEcitG?=
 =?utf-8?B?dVNPU0lEaURENDRDUlVyUFJJc09SWWlKbHZSL2QxQTR1dVozd1JNS0xqM0xF?=
 =?utf-8?B?ZnFxVElLZm4xODBXQ0lyV3J1NHM5cnlaU3RIcDUzMFAyUDhNM2t3UDVrRDJZ?=
 =?utf-8?B?SDVycWJ3VnpmVkxvcUhqMUhmY2RJY2dIOWpMdDA3V0VIQ3NLYWRBTklxeG1O?=
 =?utf-8?B?WmlacG9OL0FPM3VaempvU1p0Z25jQjlUZGxmSHpJbnQyUDR1NHNYT2d2MjU2?=
 =?utf-8?Q?ZYpZPQYP3yPiIsn+GmPOJ7ZmH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72F9E4FD46F31A4E94AA0C88C20088C4@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d75bf761-79ad-4f16-ab73-08dda2ca9f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 18:15:29.8858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlMnIB3R/LCU5QSL3CQG+bD0sqJcJ2zU0sGJLzvQ0fMiYofmKRRhJaTrR+eN8hd6J+9ofg1B4e3wuUECfW6SCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052

T24gVGh1LCAyMDI1LTA1LTI5IGF0IDIyOjIxICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IE9uIFRodSwgTWF5IDI5LCAyMDI1IGF0IDg6NDbigK9QTSBUaW11ciBUYWJpIDx0dGFiaUBudmlk
aWEuY29tPiB3cm90ZToNCj4gPiANCj4gPiBJbnRyb2R1Y2UgdGhlIHNmaWxlIChzaG9ydCBmaWxl
KSBtYWNybyB0aGF0IHJldHVybnMgdGhlIHN0ZW0gb2YNCj4gPiB0aGUgY3VycmVudCBzb3VyY2Ug
ZmlsZSBmaWxlbmFtZS4NCj4gDQo+IFdoYXQgaXMgdGhlIHVzZSBjYXNlLCB0ZW1wb3JhcnkgZGVi
dWcgc3RhdGVtZW50cyBvciBzb21ldGhpbmcgbW9yZQ0KPiBwZXJtYW5lbnQ/IElmIHRoZSBmb3Jt
ZXIsIHdoYXQgYWJvdXQgYGRiZyEoKWA/DQoNClRlbXBvcmFyeSwgZGVmaW5pdGVseS4NCg0KU28g
ZGJnISgpIHVzZXMgZmlsZSEoKSwgd2hpY2ggbWVhbnMgdGhhdCBpdCBwcmludHMgdGhlIGZ1bGwg
cGF0aCwgZS5nLjoNCg0KCVtzcmMvbWFpbi5yczozOjhdIG4gPD0gMSA9IGZhbHNlDQoNCklmIHRo
ZSBmdWxsIHBhdGggaXMgbm90IHRvbyBsb25nIGZvciB5b3UsIHRoYXQncyBva2F5LiAgSXQgaXMg
dG9vIGxvbmcgZm9yIG1lLCB3aGljaCBpcyB3aHkgSSB3cm90ZQ0KdGhpcyBtYWNyby4gIFNvIGlm
IGRiZyEoKSB3ZXJlIHRvIHVzZSBzZmlsZSEoKSwgaXQgd291bGQgbG9vayBsaWtlIHRoaXM6DQoN
CglbbWFpbjozOjhdIG4gPD0gMSA9IGZhbHNlDQoNCj4gaS5lLiBjYW4gd2UgZ2l2ZSBhbiBleGFt
cGxlIG9mIGhvdyBpdCB3aWxsIGJlIHVzZWQ/IChJZGVhbGx5IHBsZWFzZQ0KPiBwdXQgaXQgaW4g
dGhlIGRvY3MsIHNvIHRoYXQgaXQgZ2V0cyBidWlsdCBhbmQgdGVzdGVkKQ0KPiANCj4gPiBUaGUg
bWFjcm8gZ29lcyBhdm9pZHMgc3RyOjpyZmluZCgpIGJlY2F1c2UgY3VycmVudGx5LCB0aGF0IGZ1
bmN0aW9uIGlzIG5vdA0KPiANCj4gImdvZXMgYXZvaWRzIg0KDQpGaXhlZCwgdGhhbmtzLg0KDQo+
IA0KPiA+ICsvLy8gUmV0dXJucyBqdXN0IHRoZSBiYXNlIGZpbGVuYW1lIG9mIHRoZSBjdXJyZW50
IGZpbGUuDQo+ID4gKy8vLyBmaWxlISgpIHJldHVybnMgdGhlIGZ1bGwgcGF0aCBvZiB0aGUgY3Vy
cmVudCBmaWxlLCB3aGljaCBpcyBvZnRlbiB0b28gbG9uZy4NCj4gPiArLy8vIFVzZSB0aGlzIG1h
Y3JvIHRvIHRyYWNlIHlvdXIgY29kZToNCj4gPiArLy8vIHByX2VyciEoInt9Ont9XG4iLCBzZmls
ZSEoKSwgbGluZSEoKSk7DQo+IA0KPiBQbGVhc2UgZm9ybWF0IGRvY3MgYXMgd2UgdXN1YWxseSBk
byAocGxlYXNlIGNoZWNrIHRoZSByZW5kZXJlZCBmb3JtIC0tDQo+IHRoaXMgd2lsbCBwcm9iYWJs
eSBiZSBhIHNpbmdsZSBwYXJhZ3JhcGggd2l0aG91dCBjb2RlIHNwYW5zIGV0Yy4pLg0KDQpBaCwg
SSBzZWUgd2hhdCB5b3UgbWVhbi4gIFRoYW5rcywgSSdsbCBmaXggaXQuDQoNCj4gDQo+ID4gKy8v
LyBOb3RlOiBBdm9pZGluZyByZmluZCgpIGFsbG93cyB0aGlzIG1hY3JvIHRvIGJlIGV2YWx1YXRl
ZCBhdCBjb21waWxlIHRpbWUNCj4gPiArLy8vIGluIG1vc3Qgc2l0dWF0aW9ucywgc3VjaCBhcyB0
aGUgYWJvdmUgcHJfZXJyISgpIGV4YW1wbGUuwqAgSG93ZXZlciwNCj4gPiArLy8vIGJlY2F1c2Ug
Li4gaXMgYXBwYXJlbnRseSBhIG5vbi1jb25zdCBvcGVyYXRvciwgdGhlIGZvbGxvd2luZyB3aWxs
IG5vdCB3b3JrOg0KPiANCj4gVGhpcyBzZWVtcyBsaWtlIGFuIGltcGxlbWVudGF0aW9uIGRldGFp
bCwgc28gcHJvYmFibHkgaXQgc2hvdWxkIG5vdCBiZQ0KPiBwYXJ0IG9mIHRoZSBkb2NzIChgLy8v
YCkuDQoNCk9rLg0KDQo+IA0KPiBBbnl3YXksIHBsZWFzZSBzZWUgd2hhdCBCZW5ubyBzYWlkLCBv
ZiBjb3Vyc2UuDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLy8gUmV0dXJuIHRoZSBpbmRleCBv
ZiB0aGUgbGFzdCBvY2N1cnJlbmNlIG9mIEBuZWVkbGUgaW4gQGhheXN0YWNrLA0KPiANCj4gV2Ug
ZG9uJ3QgdXNlIGBAYCBpbiBSdXN0IGRvY3MgKHdlIGRvIGhhdmUgYSBzaW5nbGUgY2FzZSBvZiB0
aGF0IC0tIEkNCj4gd2lsbCBjcmVhdGUgYSAiZ29vZCBmaXJzdCBpc3N1ZSIgZm9yIGl0KS4NCg0K
SSBzZWUgb3RoZXIgY29tbWVudHMgdXNlIGJhY2stdGlja3MuICANCg0KPiA+ICvCoMKgwqDCoMKg
wqDCoCBjb25zdCBmbiBmaW5kX2xhc3Rfb3JfemVybyhoYXlzdGFjazogJnN0ciwgbmVlZGxlOiBj
aGFyKSAtPiB1c2l6ZSB7DQo+IA0KPiBJZiBoZWxwZXJzIHdpdGhpbiBtYWNyb3MgYXJlIG5lZWRl
ZCwgYW5kIGVzcGVjaWFsbHkgaWYgdGhlIHVzZSBjYXNlIGlzDQo+IG5vdCBqdXN0IHRlbXBvcmFy
eSBkZWJ1Z2dpbmcgc3RhdGVtZW50cywgdGhlbiBpdCBtYXkgYmUgYmVzdCB0byBwdXQNCj4gdGhl
bSBhcyBoZWxwZXJzIG91dHNpZGUsIHRvIGF2b2lkIGdlbmVyYXRpbmcgYWxsIHRoaXMgY29kZSBv
biBldmVyeQ0KPiBtYWNybyBpbnZvY2F0aW9uLg0KDQpUaGF0J3MgdGhlIGJlYXV0eSBvZiB0aGlz
IG1hY3JvIC0tIGl0IGRvZXNuJ3QgZ2VuZXJhdGUgYW55IGNvZGUuICBOb3QgcmVhbGx5LCBhdCBs
ZWFzdC4gIFRoZQ0KY29tcGlsZXIgZGV0ZXJtaW5lcyBhdCBjb21waWxlIHRpbWUgdGhlIHNsaWNl
IGluc2lkZSBmaWxlISgpIHRoYXQgdGhpcyBtYWNybyBnZW5lcmF0ZXMsIHNvIGFsbCB0aGF0IA0K
aGFwcGVucyBpcyB0aGUgY29tcGlsZXIgZW1pdHMgaGFyZC1jb2RlZCBvZmZzZXRzIGludG8gdGhl
IHN0cmluZyBsaXRlcmFsLg0KDQpZb3UgY2FuIHNlZSBmb3IgeW91cnNlbGYgaGVyZTogIGh0dHBz
Oi8vcnVzdC5nb2Rib2x0Lm9yZy96L2U5NDd6c3hmUA0KDQpUaGlzIGlzIHRoZSB3aG9sZSByZWFz
b24gSSBnbyB0aHJvdWdoIHN1Y2ggbGVuZ3RocyB0byBhdm9pZCByZmluZCgpIGFuZCB0aGUgLi4g
b3BlcmF0b3IuDQoNCj4gDQo+IFRoYW5rcyENCj4gDQo+IENoZWVycywNCj4gTWlndWVsDQoNCg==
