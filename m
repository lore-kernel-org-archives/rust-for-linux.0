Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E0D29D19
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 19:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583100; cv=fail; b=grcHeBDcCMCG4nv+AA2PPU4L8sfnrTYJ2BD5ubu/oB4jpLVaWoBvBwvR2I2k5M6115vxfzJ4MjhVFB47Td9bhguuG8QmU6sFYFr6NWFYJtDL6thNjDicPe6F4KW/W69oNeI0RRpZTXE0s5+NqUuOUHURsXrRNqxaBvam/ZZuQTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583100; c=relaxed/simple;
	bh=grysMRSkt2eVoyFFYk+ee0pt/RbQ43DMYdHYff+YZbk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=psP8Mz0K53QFjp4AWtVgp4XQTaASLi3V2IfaOt18KFbOVkXDPNnRluTG3kUb2hj+/6lYJKaC3WhOjLzEEPP/h+3R55sGEnoYTBpeyqaUJpMSxwjuYXxP/i0ybDbUSUiqtQGhK/DIsWZojeYkft1RE2w3uqGgxoDm0G4CSwYGx5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RwaVx1J8; arc=fail smtp.client-ip=40.107.237.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RwaVx1J8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRDjOAalXAa2F/K9n8j9GHbbLn8yvXzTQgI4kSyNk0BiI/KEuLDIZqupHmO5xYlmY4sTZOyXSnkquCcXdkDdp1UvWlDplYJ3YdcMV0n3uvG5uZx+6ppswlI6JtAam85bPVUNNnUtmgkRj74fgfFNEAXhPu4WriOegthdH8WQyCQ0V0vBFa7vAKZASOwjNNs+t+J/kW9yL7UoXIqy3XOjin7Qzovr4l7Ac/GBFN/UuUfY5PbDxS7KxHmW/4j8aClegBA1UBMNsNBN7IZKRFUYw7yhPwdQAwjocuGbCXDXJNPAJ3+XmjUP+zCmTEMzPUKRY4yjy6SXxwQYL652M+fmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grysMRSkt2eVoyFFYk+ee0pt/RbQ43DMYdHYff+YZbk=;
 b=IuRPxj7WraqaxvHVdjUH4BNuZSy5JPVVATdIL2Yhb4U+TkhSLBsIloUx4LmSZiRLx8E2r8OXGr6UI6c5P0Nj+D9evEJ2qEqY5yVHs9LDouPmuxLq/K5Tbz0HnR43trnhtS8L1NxdNFPt4sG+mK6QlYOCvssriTSkE53PfSst2WH4865MD0R3pfnR6zosSykcfdQMPmQuqSZyAys166/UlMK5AfpnwNrqguw7Y32tkeQZFkH7RsrHBnzCcKQOntli0kuYXRglfdEPHRGXjqlTH9NElF12Yp8N7UUjSUnTbkUKKl+gqjHek5IfiMidy6BstURnvF9bnOTTiC9BWKnyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grysMRSkt2eVoyFFYk+ee0pt/RbQ43DMYdHYff+YZbk=;
 b=RwaVx1J8TsFtFufWslJevxxRK0KSQJOC1uskz3g9C8ofpHNSpspcq3JRntqMRbiM+S5CznEH01KVkiRF5qXpQZLfxgf2xoha3q70yEineyUT1wz/OZdqoKp7gbndTAq14bmmvV7KUfVu8v/FSQ3UwysibDDwZz2DR3KAsxqabsdcWmcAE65iSPFa2DpL+/yh8k3eRwTeiUYsPsAGV4YYlPTGMTbqdDbq7wuRYEnSo3HgMYxT0wXgEjwhotVUQ1pvta0Bl2xbaUwsLweiA9vnem4ihYU+d2FN18m6RRJ+VhR4faodoV9+zgGHFnAdJw5SjByuyFFxIjnPdCn1NCJ0iA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS0PR12MB6606.namprd12.prod.outlook.com (2603:10b6:8:d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 19:18:15 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 19:18:15 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb2Y76GidriUYRM02FngySpVCBwLP8FYaAgACwLgA=
Date: Tue, 10 Jun 2025 19:18:15 +0000
Message-ID: <57295c32a7f21488da7e5e15e77d71df2188c80a.camel@nvidia.com>
References: <20250609223606.2897030-1-ttabi@nvidia.com>
	 <CANiq72kKamUJTJX7PxmSdZWCWwFHsOoXakjRzmmX4+eQ679ajw@mail.gmail.com>
In-Reply-To:
 <CANiq72kKamUJTJX7PxmSdZWCWwFHsOoXakjRzmmX4+eQ679ajw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS0PR12MB6606:EE_
x-ms-office365-filtering-correlation-id: 0b48a316-b40b-4878-83ed-08dda8538c9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UXFhU3NjOWZnR2hpWnZKSlVzV3Jac256SjJFZ2dNS0E4TjhzQlVWWElaNHRk?=
 =?utf-8?B?SjUzVjFEMmdYSndCYkIzMWdVN2J6NVZGNDROUVR3bGd0RStnNFZDTTlCc3FM?=
 =?utf-8?B?bVdwNG5ibGt3Tmp2WDBKbGxyZTlEeVc0MEpiTytZd2NPeDFLYXBIRXkxenhV?=
 =?utf-8?B?V1J4ZnQyby9NL2ozczBQMC91M3RXaloyVHdFMldMV0lydUVyL2kxRFh5Sks3?=
 =?utf-8?B?bndHZXpNUzAyR1ZIWG14S2FYY05STm1WRmhLVytHbEZKQ3JiM0JiT2hQQnlI?=
 =?utf-8?B?Mm04SVd4YVFVRTV1UlF3dkxhQlhWS1lZY0d3UE0zVDZLZDNHRzQ3aGdWVHFJ?=
 =?utf-8?B?UTIwMjRKKzV1ci9XTXhNMnVkMWUvZW9QMFlwd2lIUkFxL29hUExZMFVGOUpq?=
 =?utf-8?B?QWpWd0IzekUvWHN2QVBVb0VjbzR1Qm9kWkcveURvbnJ2ZEpMSVN4WjdIUmRW?=
 =?utf-8?B?aENiOTFoMTRyVDY3YXlXU3k2emZPKzRyemtFTHJBeWNodmRiZTNVczRYdjN5?=
 =?utf-8?B?cGE1d0RiTVJnSUZQMmt6NEpiT01WK2UvbG9xUFZzQVR6bTJ3SGJiUVNqWEZ0?=
 =?utf-8?B?QTFxVHJiZjlUL3ZDWDExajVjbG1wOC9Sd0E2N2FyRVR3cmpCb05wL1FpYW1y?=
 =?utf-8?B?MUdJa2oxaVdkNXFlN25SckM1YmxhS2IyZ3cyQ3JaOHdDMFhkdzV5TjFxb3dG?=
 =?utf-8?B?akF5Q1JZb3JYTHZINWJKUWsrL2t4c0NpcTNpOEtablcvZ1JKQXRyd05UbXFi?=
 =?utf-8?B?bjBOWldmbXBteG5GY292TkQxbXBZMWJXZDhmMklRMUYzMmR5QlVIQmZIK3li?=
 =?utf-8?B?SU04ejlobkJBemlocTR5dm1hcDlvQklIcGJyQUQ4WkFiRlFUTGZrNjFsUytO?=
 =?utf-8?B?TXpGaGVVUlB0MUE5SVVlNTRCRkl4enpzckV3UEwycUhDOVJGNUJzOHdwRjlr?=
 =?utf-8?B?eENoMWYzNlU2SEZ6TDBVck1yOU5kcEFDUHdrU1lLK2RPSVpxb2hvVDlkMk13?=
 =?utf-8?B?T1RnajVRMHM1Y3NvaXFhcDVCQVViOWxETU1tVmJiS09NaDRjalVMTkd0enIv?=
 =?utf-8?B?a1JyQjZrTVpNc0h0dFNraHJIVnJZL1dldWMzRkFqU21CVFVxbHNrMGtpU08z?=
 =?utf-8?B?N3c0clY3MU55TldRQkg5RUVLeE9UMElrSFZPWXhJN1U4VHFRcVNKWGhtb3FX?=
 =?utf-8?B?U3hYVmpTQ0dqWHc2NXY5czcvb1lrcjNlWkw4T0I4VGIvVytvWTBzNFRrcFVl?=
 =?utf-8?B?bjdvdE5vaUtoMWlNaE96K2tYY0hBRVM3KzJUUlhFR0hKR1hXeFBIVW51MjFD?=
 =?utf-8?B?TVAxT3VtRUlybUFmcHdpZWJucHovdUtNL3Uxb05zTzllVXVlbERUZUw0ajF5?=
 =?utf-8?B?Z2NZZXhkUWFnanlTbmxDZllPQ3Z0Q2tZM2RPVWJJVEZWTEU3OEZEbG5jbUZw?=
 =?utf-8?B?eUlIWjRXWVBET29zbHZKbXpkbVh2NnVmckoxNTFBakVML3dXK0w5OVQxNW82?=
 =?utf-8?B?WkY1OWtnbjI4UlM4ZXVVQ250Mk9raUVnQ0c2Z1NPQXZDdWFHWi9hb1kvVmpp?=
 =?utf-8?B?bWJwclhZTGs3UmRZMlJUQkxFTjRTeHVpc3JsdENZSUQwNlh0eGxsUzVjWDQr?=
 =?utf-8?B?N1J0NGNVRGxmNjYyc2lLL3VPSGQxN1VVOHhEQVRaU2Z0Q1lGVnIwQWxFYUcz?=
 =?utf-8?B?V3hHRExDbzFDUkhac3NQWFFpUTc5NHBGbm9PbEJabklTOUJLcVZHLy9EcTd2?=
 =?utf-8?B?U05UK01Xc1kxWVRjdkpZRThRazZLT3ZGNXlSVVMwY1BVRUZiRnB6d054VzBo?=
 =?utf-8?B?b0RPY2RaWms1ZlNjU003WUE0Y212TU0rTFhTTy83bit3d2FaSmJ5NGNnaHdQ?=
 =?utf-8?B?UW44QVg1cThRZ1g2c1poZENYZ1NBNzNkWWVjemJGbHQ3ZVkzODJlWmlqVUFX?=
 =?utf-8?B?ZFlFWktBYmdYRXdVSVE1WmhlWUhYY2RCNWF0M1E5TEJtU0Y3c29pOVExWCtR?=
 =?utf-8?B?eG9NNG9XWDNnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVVHVkZKeEdVRXlmbXRiREx6V3BIOVdOVzdBL2N3cmI2Q0pkWG95ZzJZdmMv?=
 =?utf-8?B?Q3Uvc3puNllRM3NDWG1ad1JQcEhNbGtVUjJQc2tjdUFja2R4b3V5VnR2c3RC?=
 =?utf-8?B?M1N4b3pBT2RyNmczRVhrVHVsUTBMcXhKeDd3WUhZeWtwZFNpTm5GWWF2b2dY?=
 =?utf-8?B?bG5wNXF3VDQ4ZkJFVFlpbkFxMDIwb0pJeUFoQTdGSXMzNFYrNndGOStOY1pi?=
 =?utf-8?B?dkxrM0FVVUpLVnZSUGxaOGJ4MkZHQTJsM2Q3RmdtOFZzQ3VJQm90bEtYMFZX?=
 =?utf-8?B?amRsMTZMSFJCdEJNWFR3aXBGTG4wUFkvYVNocU5COStkQldTeXJXSlUyQVZI?=
 =?utf-8?B?a1o0ZE9hRWxoRmt4YTkzdm5oVm1PYWZlbFJMdTFVbUFnRnRMenJjdThjNHhh?=
 =?utf-8?B?YVFweU9BM09XQ21rVzBwcUJaK29QNWZXNENNS1RKclNCTDFxTVdxY2VJR1ZB?=
 =?utf-8?B?Y1pML05iWjBoUytzSkZtek9USUlpUHdNZkJCOXExYXV1SHFqeGFJWDhRUUpC?=
 =?utf-8?B?MW5iaUtIS0NqOW03cnRxcHorRjFnZTlsM2swZktnL0VyQUxnRXQ2WVNqb0dG?=
 =?utf-8?B?QU13YmI0S3F4MUx6eStyNTdnbmtUeDRNTTVXdlIzdGVSQTJxbzBJbjRQVC9V?=
 =?utf-8?B?c1VqSzA1MUtpSkd0ZDFCZ1lkZkpZVzE5NXZQOXZDbVJSUytrblNUVlluRkZO?=
 =?utf-8?B?Y1dsU1dHT2Q2aDJSSUpqVmxqNjdva2tRK2djSjdlaC9oaGgvMnVmd3JWQnJw?=
 =?utf-8?B?RHYrZGovckxLVlo3ckdxSGtDa1AxSWZ5MWxBUUc2a20vaGJLSThwSkE5WHlh?=
 =?utf-8?B?ejNSTFV6c2pRQ1NuaEc2N2hYUW14RGlaMWRwNmE4Qi9OVU9HNXd4ekF0TjBh?=
 =?utf-8?B?bGxTS2ZPTExRUmFrMmVVRGZYSE9oYTdRbWxNYlRIWTh4dmlPR3dsbm1CTCtq?=
 =?utf-8?B?YVJGRTdSUzgyQ0NIdXoyYisycmJsWWVWL3NOUlNpME4rV0VINGJ1c3VXTVgr?=
 =?utf-8?B?UWMzdncxUEdVdWFoa1czTTJsb0Jubm10R1RBMTluNHNkdytqUndENVBCb3A1?=
 =?utf-8?B?clAwRGJNYXg5ZS9OQ0hHTmNaby9mWFloZE5DRDdLR3hQV0MwTk1aUTQ0ZFM0?=
 =?utf-8?B?YkNCVHNNd3ViR0poejNKTWlkZEUwN2ZkdTJlUGFDVHdQU2FLdGJQSDF6U3lQ?=
 =?utf-8?B?UnpnWk9uUlBjTTEvR1FSWUgrclp5dGlxeCt6MldWVElLcGdDRXgvNW9tQXhX?=
 =?utf-8?B?MkhCOFptWTI3N1NQbG43UENqVHlCeTYvWkZzT0w4TUU2bERiMlR4MXV2SXd2?=
 =?utf-8?B?UlhGLzFJcXNnenp4Tk9mK2ZNUmRqUndZNmcrZUxYbUM2Zk5CczVWOW1Wd3Vw?=
 =?utf-8?B?dHY5dDlBbEk3RVJrVnJCQkd1SlF3d1FrdFNsVWU5R2pZOWNSbGhMOUw5NjNJ?=
 =?utf-8?B?cGJneVNJNkd5d1Y1dDdXK0pidkhvcnc5ZU5nZFFWOUpmVVVOUGk1UzdLQ3pz?=
 =?utf-8?B?NjZDVmpBZ3U4ZUdMVW9wZEJaTVllSnlXQlhSNE5Rb1ZXa29QVHA4NHFGL29W?=
 =?utf-8?B?TUJkbUN4Mml6alluMGtCaGVEQ3pCWmxtWnRVVUVjaVJ0RERlbFIvUXBZbUlw?=
 =?utf-8?B?RDlzWlcrclNLOXFiUG5ldE9JOXIvQjZpV2lBM2lQN2FMck8zV1BNdDFkQmVr?=
 =?utf-8?B?WndmcGlmU3phYzlVNmxkK2h0OWFQK3ptUlQwemVmcU9tN0VxdjZuVndCU1pz?=
 =?utf-8?B?c2xBVHVMbml6a25FL0lOc0RDSC83SmZGeU1MVnFCYW5IOTMxK2hueXg1RDg0?=
 =?utf-8?B?Mm5RNi9hK3RnNmEydEt2MWJZaG44UTludUNNY0dCRHZya2R3YXhkcDhwbHUy?=
 =?utf-8?B?QkUwRjJoR0pGMmJaYk9pZENEL3ZzM2RNNWV4NUdTSkxsMTAwZXRVYm5Qdjc2?=
 =?utf-8?B?N084WHBsUFkzaTlKdGY1NEVqMW44RmpYbFNna3FXRVMwYnJRcU12NlhQVDlu?=
 =?utf-8?B?djZwMWJ1Z2RaMWo1K0EzNWdjWXdjckF0VzJraC9ibU9ibk5iSnZnekgvOTgy?=
 =?utf-8?B?ZVAvcDNpR2U4ZFlUdm1Ib2tQS1dMblZKNDMvbWE2NmRWTHBLYUIrOWppcU9L?=
 =?utf-8?Q?8+C4X9Z6Z1TDMhbzx5oZ0U/tW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D5E2B5A9701CD4E81559A943867CA92@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b48a316-b40b-4878-83ed-08dda8538c9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 19:18:15.1183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CV+aTs57mx7GxTe9JhuHipkTStI2wUzokg9t3DAiMWTy0VVwgvCFWnDaF00JDERzU6xha8AeU/xk75a81ePGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6606

T24gVHVlLCAyMDI1LTA2LTEwIGF0IDEwOjQ3ICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IE9uIFR1ZSwgSnVuIDEwLCAyMDI1IGF0IDEyOjM24oCvQU0gVGltdXIgVGFiaSA8dHRhYmlAbnZp
ZGlhLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gKy8vLyBSZXR1cm5zIHRoZSBpbmRleCBvZiB0aGUg
bGFzdCBvY2N1cnJlbmNlIG9mIGBuZWVkbGVgIGluIGBoYXlzdGFja2AsIG9yIHplcm8uDQo+IA0K
PiBQbGVhc2UgcHJvdmlkZSBleGFtcGxlcyAod2hpY2ggZG91YmxlIGFzIHRlc3RzKSBmb3IgbmV3
IGZ1bmN0aW9ucywgYW5kDQo+IHBvc3NpYmx5IHRlc3RzLCBlc3BlY2lhbGx5IGZvciB0aGlzIGtp
bmQgdGhhdCBjYW4gZWFzaWx5IGJlIHRlc3RlZC4NCj4gDQo+ID4gKy8vLyBUaGF0IGlzLCB0aGUg
Y29tcGlsZXIgY2FuIGlubGluZSBpdCB3aGVuIGNhbGxlZCB3aXRoIGEgc3RyaW5nIGxpdGVyYWwu
DQo+IA0KPiBUaGF0IGlzIG5vdCByZWFsbHkgd2hhdCBgY29uc3RgIG1lYW5zLiBJIHdvdWxkIHN1
Z2dlc3QganVzdCByZW1vdmluZw0KPiB0aGlzIHNlbnRlbmNlLCBzaW5jZSB3ZSBzaG91bGRuJ3Qg
ZXhwbGFpbiBgY29uc3RgIGluIGV2ZXJ5IGBjb25zdCBmbmAuDQo+IA0KPiA+ICsvLy8gYGBgDQo+
ID4gKy8vLyB1c2Uga2VybmVsOjpzZmlsZQ0KPiA+ICsvLy8gcHJfZXJyISgie306e31cbiIsIHNm
aWxlISgpLCBsaW5lISgpKTsNCj4gPiArLy8vIGBgYA0KPiANCj4gVGhpcyBkb2Vzbid0IGJ1aWxk
LCBzaW5jZSBpdCBpcyBtaXNzaW5nIGEgc2VtaWNvbG9uLg0KDQpTb3JyeSwgYmFkIGNvcHkgYW5k
IHBhc3RlLiAgSSB3aWxsIGZpeCBhbGwgdGhlIGFib3ZlIGlzc3VlcyBpbiB2NC4NCg0KPiBBcyBJ
IG1lbnRpb25lZCBpbiB2MiwgZXhhbXBsZXMgYXJlIGJ1aWx0IGFuZCByYW4gLS0gcGxlYXNlIGRv
IHNvDQo+IGJlZm9yZSBzdWJtaXR0aW5nIGEgcGF0Y2g6DQo+IA0KPiDCoMKgwqAgaHR0cHM6Ly9k
b2NzLmtlcm5lbC5vcmcvcnVzdC90ZXN0aW5nLmh0bWwNCj4gDQo+ID4gcHJlcmVxdWlzaXRlLXBh
dGNoLWlkOiA0YmZkYTE2YTMzM2I5ZjAwYTEzOTA1MGI3YzY4NzU5MjI5NjFhMTVkDQo+IA0KPiBX
aGljaCBwcmVyZXF1aXNpdGU/DQoNClVnaCwgc29ycnkuICBJIGhhdmUgYW5vdGhlciBwcmV2aW91
cyBjb21taXQgaW4gbXkgdHJlZSB0aGF0IEkgdXNlIHRvIGFzc2lzdCBpbiBidWlsZGluZyB0aGUg
a2VybmVsLg0KSSBkb24ndCBzZWUgYW55IHdheSB3aXRoIC0tYmFzZSB0byBpZ25vcmUgdGhhdCBj
b21taXQgYW5kIHNraXAgZ2VuZXJhdGluZyB0aGF0IGxpbmUuDQoNCkknbSBhbHNvIGEgbGl0dGxl
IGNvbmZ1c2VkIGJ5IHRoaXMgbGluZSBiZWNhdXNlIDRiZmRhMTZhMzMzYjlmMDBhMTM5MDUwYjdj
Njg3NTkyMjk2MWExNWQgZG9lc24ndA0KZXhpc3QgaW4gbXkgcmVwby4NCg0KSSBkb24ndCBrbm93
IGFueSB3YXkgYXJvdW5kIHRoYXQgb3RoZXIgdGhhbiB0byBtYW51YWxseSBkZWxldGUgdGhhdCBs
aW5lIGluIHRoZSBwYXRjaCBmaWxlIGJlZm9yZQ0KZW1haWxpbmcgaXQuICBDcmVhdGluZyBhIHRl
bXBvcmFyeSBicmFuY2ggd2l0aG91dCB0aGF0IGNvbW1pdCBqdXN0IHRvIGdlbmVyYXRlIHRoaXMg
cGF0Y2ggZmlsZSBpcw0Kb3ZlcmtpbGwuDQoNCg0K
