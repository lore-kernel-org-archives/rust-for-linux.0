Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACB82F1FF9
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955411; cv=fail; b=Wllj5ty4kif7+1vPkedPakcxTtaeh2heJvlXQd3u9NoZYn+f66H0BnVqDnAde5W9PYT7Kh4n/kCNQDGtAKUs1050h/Ls5kciV5rT9B4PqjlUTDw7pkM0BSdqPpjF+QUZZvXU8odd6ch0781NGQOwxCTT0RDpRgk9/Di6oX/0bQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955411; c=relaxed/simple;
	bh=hLLvg72iccMwjWXxXVAO+1MbuBmkQ9FCfYpEgvpOmqs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mg13f+PCUL3IzwzOZaYTQMOPToWmOp3ejiS64qrKg45U6olHf7+Pt1MKDQeyuL1GK6Utq/v9KmX+oxq2jGdUiU/tIHyZE5s4ZraHva+6tFcf6nFVuc4WX3rerxzXEc7Kfihq37s+ztph3U2N9g1wWaoeLJTKTEvgoeho8V/txhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TiinxUbp; arc=fail smtp.client-ip=40.107.237.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TiinxUbp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jy/yeRf5fioBpEZPcRR7QZLPc0noi0AQw6Rjqrq5YVLC2zYJSdxwbsz6doF1WaTjoMUbhtyY981ndVoPkNb6Voc9Szay8U7kQyjTnmusx5fe6ST4wOgCLShXS8aZrLSnCqcPHLu7fT8vyBHKqhao27aMx+QLWh3M5GIevBiJ93oKm4kL+TlqpwkU9Y03JZQ9X+G9h0tfsyCEaJQsCLLA93megawioGXO3hKE/ly6uLhqCjmK3QSW8JPIvTZsPhwYmZhr58aYE7WoH7r34yWnGrfXrML3sDdMEKTnV+MribMd0A/Jz71qxQNgEqPYBE1989izm0BoGkpnKj5zZKdz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLLvg72iccMwjWXxXVAO+1MbuBmkQ9FCfYpEgvpOmqs=;
 b=nVsl/nAG2L1ohDbVgTkF/AGvG4KTWfx8ACA8MQSiHL6tn3QGkwLTHHCEUNidEg1ioSW48ncKJDz2Y2LW+WmyIWOB2psBhAklr+Jx9TQ/KC41MyT/OorY2dQxLcZgRhh6N5nm066r456VD6m//Vk6oVYzIBdR5h7hS4d8RPuIykHI5K2qxtABvDOxmVLbThVjpfia44irW/5VCPhuxHrvr2yzTxGHMxPxn8maem92uGASmxZc8pltlUtqGxepN8D4rgG41x3+tBasLWwgM28dNnhNDPiPP3iEVQbMEnaEAeClJV/WnRUnGqiH/SVAuBZoRzwWSExi2u6ApXSaluhByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLLvg72iccMwjWXxXVAO+1MbuBmkQ9FCfYpEgvpOmqs=;
 b=TiinxUbp7NP6Oe3Cdr3LA7OAWmMdO2cqhOYwP8f4LqWMUm/r31oWTALwCGOXx2xg/RD/Bi0PwSDI0YfOvz2R7AdEAsPUzuWObyW4NzcwhPyZNPYy71m8ZvvOfdSLwen6zmsOvOj09EYip1Wi2JdMc6kLpyU5cynXx6QFMI3o3kiGVyIrzNIwQzbeHnIc3DieYo3LYkOfwFmU82EkicpYuZyxz66GHz6QqjY4zfMTsYs2VM1bL/AKQfKadEJ+MKDd9dS/nDjAv5NrMVNw+0XmR+Ywi5RQSXRfyq2/xSRqPHKP/UhJVtYj0qQTJdyByFn9RIfKDIamx27gNQgCMDW+5w==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 26 Jun
 2025 16:30:05 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8857.020; Thu, 26 Jun 2025
 16:30:05 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v4] rust: introduce sfile macro for succinct code tracing
Thread-Index:
 AQHb3vXap/xDjuhkbUS6ehJ2bgZmCrQGRkgAgACu0gCAAAb2gIACXrGAgASDAICAB9N3AA==
Date: Thu, 26 Jun 2025 16:30:05 +0000
Message-ID: <e92c3e23c09579e4dc13d999503cf9a2b1451c2b.camel@nvidia.com>
References: <20250616193433.2643407-1-ttabi@nvidia.com>
		 <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>
		 <DAOMQXNTLSGR.U0QOV8BU1I5V@kernel.org>
		 <CANiq72moqFBWeS9RL6y8wzpxURvhdz4D0J8WfjaOBp0XSgufdg@mail.gmail.com>
		 <579273832b4accc4cd989d5182f3179c9950966f.camel@nvidia.com>
		 <CANiq72m1W6Do4z0qjKmzxSbYT3az_x1DKZ5C3eLABsPRv55EwQ@mail.gmail.com>
In-Reply-To:
 <CANiq72m1W6Do4z0qjKmzxSbYT3az_x1DKZ5C3eLABsPRv55EwQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ2PR12MB8884:EE_
x-ms-office365-filtering-correlation-id: f14a8259-6708-4dc2-2d07-08ddb4ceb551
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a1NUdGhZWU1qK3gybEpNWTVXRGFyOGJKVG9BVXVMWStySi9zV3luZjRVNmZp?=
 =?utf-8?B?ejBVYjJyWHNGbUdEcjVhMXJaSHBib3p4TzVOTzFraVNldGhsT01ScGxkQ0pJ?=
 =?utf-8?B?LytqK2N6Nm1kVXZycHEyc2VCZFBUb3JLTFh0Zy9oS2VXYmthRGtrTnE0Rzh6?=
 =?utf-8?B?c05SK2V1SlpPazBleEhiSGVzNVN5aDBCbnUyUDd6Uk12Rjh1MUthVUR0Rno2?=
 =?utf-8?B?NWgwdW8vSVBaTnhrdSsvTVVqb1Vra01MdnJXb3YrZnJZZTlxa2hHcTFLSkxM?=
 =?utf-8?B?QjhwT0VBbzRzeG9JSjVKdlh4OVZ0NGkxSS8zNnNPVUFWWk9mN3ZJT2xFQ0py?=
 =?utf-8?B?MG5tU0FCOXhiVUdLRDgyWmp1cnBocTZPSXZHMi9NK25HKzNMbEFOQWpYeXBQ?=
 =?utf-8?B?bnB3ZkYxK0FQS3FDNDNNeW00SkxabDlyZHJ6U21LTDg4bmd5Rzd4aWRMVnBi?=
 =?utf-8?B?V2kxS0VRUlZqdkRybW0vT3dmbnFrb1pPdnlXQmVwU1E3Mm5ZSndneTZLYzBL?=
 =?utf-8?B?WXQ1ZmRUSDZIalpTWlZjUHVOR3ZzcWhNMlpTN0t5RllHWDYxeW5jYnFaclRy?=
 =?utf-8?B?TFFXb0tNZldiQmtwNWVtMkFweHJXWTFmTmtEREJSeFEvMS8zM3ZXZ3FMODZ5?=
 =?utf-8?B?ZXBtZ2pKbnQ3TGNKcWJVODh0UkhWZ01oVXpLZCtFMWVUU2VkYkFsNEtyTFNy?=
 =?utf-8?B?emhyeDRMVkorNWRYRTVtc0l6R1hBdXkwVENGOFdSczBjUzRhem5PVTFOa0dq?=
 =?utf-8?B?MUs2WDRZZ2d3MHltdkltNmNZMHplU0RvMzV3YTFyRU9neWlJS2FVSEZ4c0JN?=
 =?utf-8?B?d2R6Y0ovS21DblhiTjdkYnFHdHBockFrdlVoTmxrOTlwM2VQNEdadmdYb1VU?=
 =?utf-8?B?ODNOSUUyMDl3Yk5MUWhETStqOXAyd0FMQnd0cXRXekt2U2RubzlqbTUxQ3Yv?=
 =?utf-8?B?eS9ZNGVjN0g1blhSY09UWVVFbzdaYjF3RE9MczVQeXkvTVdaMk0vS3pJYVhw?=
 =?utf-8?B?S2x6N0owNEY1dDlTRVVJK1N2QUpIdlFWK0JHTE01cE5ZSVB6TUxCa1NIYnly?=
 =?utf-8?B?Z0x6UlJrTDFWMzNaVzZDcU9VdGpmQW82K2VvcVRCNytyTWI5SDYyVFhOYmRP?=
 =?utf-8?B?YmZId0cyYllTeHEycFJDanpKalYwVml4Ukg3VnhUR2Q1Yncza1FFS0FreVRt?=
 =?utf-8?B?cXdBUVRWd3BEcFhCTUUxMVg0dHlpRDREdjNubytPeDNqY1psNzZrRlBubWow?=
 =?utf-8?B?ajRMaHNEWGdOVXdUc3djY0N0b1k2TWdXR2JZODlySW54NGtzZXpIU2cxZU5p?=
 =?utf-8?B?SGpDQ2tVYXpCR3hmby9rOU42d1BGVnlEcU56dHBOeThON2M4SzdWd29IYnNw?=
 =?utf-8?B?aTczeXdqZjlvV0hjR0V0VXJKdkpqWEhZMUpYdEFrNDBsaG1yMm9qRVlHN2Vz?=
 =?utf-8?B?QlR6allaL3pabzVPclVKd0d4TGJDSmV0czdNbVhjelh5a0ZxalVxSVBFaERh?=
 =?utf-8?B?SWFCRFlmR0hodlNnaVl2MURDUmxtZXFDQldyL3RtZWtYMkRLS3ArR2RSMW5n?=
 =?utf-8?B?RUZXWVVvU3pBSXBZMURIRzlHdkZmb3VrRUMxVUlLdlQrRmhBUUE0Ly82ZlJn?=
 =?utf-8?B?UWNSQ2dacGlaSjN2UE51eVBKbG13UzNBZy9LWmdUVUlkNVkrRXFsRXJaYTAv?=
 =?utf-8?B?K1UvVTg3SUEvZ2hTdlZjT2NDamwrRzN2eCt1SEFqZXpNMmY0YmphUU9RNytD?=
 =?utf-8?B?VGFOUnpiSW44aVFoY3BIb2FtVEREVkpuaEYwZFloQ1dDaVd4MEo5ZjNYcUR3?=
 =?utf-8?B?OG1WWEFpeGlrSUpXWVJxMzdQdGdJcDNRaWNnSXVnVmVEbDF4elFpM21rcjJN?=
 =?utf-8?B?aHU2RmV3NmdhQnIyOEg5Z3NXUTBXckw3bjBLdjZpUGdnbjlEZkV0bXYzTFZL?=
 =?utf-8?B?VmZ1UU12djVGTlUweVVEb2haZjRRQWUzR1ZpcUM1UXpLbHByN2FVR1R3RHll?=
 =?utf-8?B?TzN3U0RkS3F3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cE9TWmRTWG9xd21iNjhDeXEwSTd4OFd3M0o1Skd6UmRLaC80Y1kzbzlkMTJV?=
 =?utf-8?B?NktpUThHYnl3ZWxQNFdTVWx6MXNRbDY4WHZsWHFJaTErVDlCMEUxQjRXeVRV?=
 =?utf-8?B?WVBRUnBGeHVxQmpieEFuYmdyeThOdWlRWmVtS3FjUi9EbG9sSjRGSVE3OUhM?=
 =?utf-8?B?TWkzNUc5emVYazg3YlRNbWRUZXNpLzQ1V3dvUzAreXloRVpFS2Fqd0JvZG5h?=
 =?utf-8?B?b2V6U0JVYlY4WndrTVRnM1UwQW5TNDBSZmVLMHRRdjUyZ1pscTIrRFlVZlYw?=
 =?utf-8?B?cWZqM0t6Tm9qRlF1anhQUkpPOGxyZEFRNUZVZlNSQWpFKytXbmRBR2EwYlNy?=
 =?utf-8?B?ZFZMQmNISVo4NmtpYWVhUWlzbFBWSndmYlNVRzU5V2h0bUlkU043K2NIR1Uw?=
 =?utf-8?B?NWxoeGlWV0NPdkhxSnBWTGtHUUp5NlZtOVlPRWNPUkkzVGZGTG9kOTQ2OUJx?=
 =?utf-8?B?eW5UUXcvN25Ta1ZoTHJJajE5WWNEOFRpblJiQW9lY0tJTCtvbkJPYmh5TjYx?=
 =?utf-8?B?MEN1TDMwMVJlSGJrRWlqKzlZZUdCakx1R1gxc1VJYzQwWG1WMjB3U2Fmd3Ny?=
 =?utf-8?B?T2NMYzNadi9xRFJNWUZrZ0hoRXVuSmJyY1M2UURPMzR2MmFvMzNJZk9pdTlF?=
 =?utf-8?B?aUk4WDJTWlBVVUVXSWRoaUY4aVgzenhUN3RhcmNoUFlrTUo3VW0wZExTOGth?=
 =?utf-8?B?Q0hjcUI4MkpDT01zZ3J0SHBYdGVEOG9lbGVnLzRjQXB2eXJvNnNRdHIrNW03?=
 =?utf-8?B?QlNOWnJHbkZjQ1FxODdtUnBtaHRsSmJjRUhreHBnSmsxT1ptNWF2OC9xRjl6?=
 =?utf-8?B?RWYyQWIyaVBCZzRFMVJVRm1LZ1ZUajZWYnV5LzlvNlV1b1pRYjFxNTJ2ZW5l?=
 =?utf-8?B?KzQ4ak12YVlFZFhaUG9nVUVTYXNlMXVkNElObGxYMWttSG9mclFFR3ZMTGZG?=
 =?utf-8?B?WWRGeHhwZExLUERXZTErYkZ0QVBrL3IyaXFzODVSYldtODI0d0hJaG9sd0dr?=
 =?utf-8?B?WGRON0ZtRCs0U0lwU3hXSDQ5TFFBdENwVkRPbW9VbEdncFRtdTFpYTZpU1BY?=
 =?utf-8?B?eUNlTnp1eUtBY1JJWmo4N2lha2hyeHAzMDZIcEFvWGF6enJoOVM0TGpxVTZ2?=
 =?utf-8?B?Z3JYZzZJbEZ2U0FKSnpwNndnMDN2Ui90dXNpNDJHRXRKZmFkSFZUM0NKQnA5?=
 =?utf-8?B?YTBCUVREdTVSczNEbWxsQWdKTyt1b3c2dm1JNWk3K0RGMFUxSEM0RnBIM2lB?=
 =?utf-8?B?RDBydXdpczU5dkNhelowWC9EaTlFdnRVWHlCOWZTOFB4VXhqdHJ0SUh2OGpO?=
 =?utf-8?B?U1FEN01TZ3BDZDdQWm8xdVkvbGJPMTk1VUt3WWtlLzE2b0FOc3JJNGdHU3p5?=
 =?utf-8?B?d0dWVzdWak1NUGNsTHFnbW1mcXlTRHA2bmliSE9IWVh4SGVTMGk5ZXVDWjkr?=
 =?utf-8?B?VTFkRXJZOS9ycjA4K250YS9nSVl3aE54UHlIc1NKUFh4WmdSd0JscVNRTURT?=
 =?utf-8?B?Y3VlZ1cyTXdabTJpTmx2VThEL2dieWtMV3dHc1FmV1hVNlBwU003QU43TmI0?=
 =?utf-8?B?NGdGeElTRE1TakpIMlVDNlJBYVk5ak56QXZSSGZQZWF0YkMxYlE3dGR0aUJ3?=
 =?utf-8?B?cW4zSlYxZXpvYXJTbjQrNHk3MVJ3bE5HQy9GaEJGRWlSMUhQalFTalRDVE1F?=
 =?utf-8?B?QTllN2ZSQmFmNjlINStoUU4yaGRxQVBDWUhVSjc5R051SUVUL3J6WlRKbG8x?=
 =?utf-8?B?RXZ0cnV3MTdXOXY5SVdWRUNXRGY4bE51S3ZSZmNGQmo4Tmw4RCtrNCtCRnJP?=
 =?utf-8?B?b0Q2YUF2c2FMYjVYZ3ExMTFjT0IzcjBoVjgyN1dnemdqZGo1Y3hDN3FZMXhh?=
 =?utf-8?B?Q3JRZFJ4L0d6Ny9MaDBvUlJPZUZJWXkwZ0xIOHVWTUl5d0hQME9ERHplRk4x?=
 =?utf-8?B?S2dVKzcrQTYrd0UrSW81czZqQjdrY1ZmK1NQQWJGYnFMSUlmQnhwYkhkT1VJ?=
 =?utf-8?B?Q0lad0VZamtWaEpwenJvTnpVOGtDeERaMHJZN1p2Uy8wL1dlZHVNMGtzZUd3?=
 =?utf-8?B?bWx3dkF3M1V2THh3dU5nV2VUVTJmV1doL0xWc1ROWC93WlphVEs3U2JLS0ZG?=
 =?utf-8?Q?Fw7IjxlnJdW2/04HCjtU0SzgL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3EE177ABF291147B541A57EA5E1E76A@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f14a8259-6708-4dc2-2d07-08ddb4ceb551
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 16:30:05.4170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RS8yR7R9x2YZ63EfwsRLoYxg8OcbJ6PQQS4TVwdWQjPGLDu+5Mf9S5q7VHlSbdaQH4effMHecOkhvCecJhnpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884

T24gU2F0LCAyMDI1LTA2LTIxIGF0IDE4OjU5ICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IE9uIFdlZCwgSnVuIDE4LCAyMDI1IGF0IDEwOjA14oCvUE0gVGltdXIgVGFiaSA8dHRhYmlAbnZp
ZGlhLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gSSdtIGhhdmluZyB0cm91YmxlIGNvZGluZyB0aGlz
IHVwLsKgIEkgaGF2ZSB0aGlzIHNvIGZhciwgYnV0IGl0IGRvZXNuJ3QgY29tcGlsZToNCj4gDQo+
IChzbmlwKQ0KPiANCj4gPiA0OTIgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNhZmUgeyBj
b3JlOjpzdHI6OmZyb21fdXRmOF91bmNoZWNrZWQocCkgfQ0KPiA+IMKgwqDCoCB8wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXiBleHBlY3RlZCBgT3B0aW9uPCZzdHI+YCwgZm91bmQNCj4gPiBgJnN0cmANCj4g
DQo+IElmIHlvdSBhcmUgYXNraW5nIGFib3V0IHRoYXQgbGFzdCBsaW5lLCB5b3UgbmVlZCB0byBy
ZXR1cm4gYSBgU29tZSguLi4pYC4NCg0KVGhhbmtzLCBJIHNob3VsZCBoYXZlIGZpZ3VyZSB0aGF0
IG9uZSBvdXQgbXlzZWxmLg0KDQo+IElmIHlvdSBhcmUgYXNraW5nIGluIGdlbmVyYWwsIHRoZW4g
c2luY2Ugbm93IHlvdSBjYW4gcmV0dXJuIGBOb25lYCwNCj4geW91IGNhbiBqdXN0IGNhbGwgdGhl
IHNhZmUgYGZyb21fdXRmOGAgYW5kIGNvbnZlcnQgdG8gYW4gYE9wdGlvbmAsDQo+IHdoaWNoIGFs
c28gYWxsb3dzIHlvdSB0byBhdm9pZCB0aGUgYGlzX2FzY2lpYCBjYWxsLCBhbmQgYWxzbyBhbGxv
d3MNCj4geW91IHRvIHJldHVybiBgTm9uZWAgaW4gb3RoZXIgY2FzZXMgYWJvdmUgdG9vIChpbnN0
ZWFkIG9mIHBhbmlja2luZykuDQoNClNvIHlvdSdyZSBzYXlpbmcgdGhhdCBpbnN0ZWFkIG9mIGNh
bGxpbmcgYXNzZXJ0ISgpLCBzaG9ydG5hbWUoKSBzaG91bGQganVzdCByZXR1cm4gTm9uZSBpZiB0
aGVyZQ0KYXJlIGFueSBmYWlsdXJlIGNvbmRpdGlvbnMsIGFuZCB0aGUgbWFjcm8gc2hvdWxkIHRo
ZW4gcGFuaWMgaWYgaXQgZ2V0cyBOb25lPyANCg0KSSdtIHByb2JhYmx5IG1pc3Npbmcgc29tZXRo
aW5nLCBidXQgaXQncyBub3Qgd29ya2luZyBhcyBzbW9vdGhseSBhcyB5b3UgbWFrZSBpdCBzb3Vu
ZC4NCg0KSSBkb24ndCB0aGluayBJIGNhbiBjYWxsIGZyb21fdXRmOCgpIGJlY2F1c2UgaXQgcmV0
dXJucyBSZXN1bHQsIGFuZCBjb252ZXJ0aW5nIHRoYXQgdG8gYW4gT3B0aW9uDQpyZXF1aXJlcyBt
ZSB0byBjYWxsIC5vaygpLCB3aGljaCAoZm9yIHNvbWUgcmVhc29uKSBjYW5ub3QgYmUgY2FsbGVk
IGluIGEgY29uc3QgZnVuY3Rpb24uDQoNCkkgYWxzbyB0cmllZCBkb2luZyB0aGlzOg0KDQogICAg
ICAgICAgICBsZXQgc3RhcnQgPSA6Omtlcm5lbDo6c3RyOjpyZmluZF9jb25zdChGSUxFLCAnLycp
PyArIDE7DQoNCkJ1dCB5b3UgY2FuJ3QgdXNlID8gaW4gYSBjb25zdCBmdW5jdGlvbiBlaXRoZXIu
ICBJIGNhbiB1c2UgLnVud3JhcCgpIHRob3VnaCwgYnV0IGlmIEkgZG8gdGhhdCwNCnRoZW4gSSBu
byBsb25nZXIgcmV0dXJuIE5vbmUgZm9yIGFueSBmYWlsdXJlcywgSSBqdXN0IHBhbmljLg0KDQpJ
IGRvbid0IHNlZSBob3cgdGhpcyBsZXRzIG1lIGF2b2lkIHRoZSBpc19hc2NpaSgpIGNhbGwuICBI
b3dldmVyLCBJIGp1c3QgZGlzY292ZXJlZCB0aGF0IGluIFVURi0NCjgsIHlvdSBjYW5ub3QgaGF2
ZSBhIHNsYXNoICgweDJGKSBvciBkb3QgKDB4MkUpIGFzIG9uZSBvZiB0aGUgVVRGLTggYnl0ZXMs
IHNpbmNlIGFsbCBVVEYtOCBieXRlcw0KaGF2ZSBiaXQgNyBzZXQuICBTbyB5b3Ugd29uJ3QgYWNj
aWRlbnRhbGx5IGZpbmQgYSAvIGluc2lkZSBhIFVURiBjaGFyYWN0ZXIuICBUaGlzIG1lYW5zIHRo
YXQNCnRoaXMgbWFjcm8gc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIFVuaWNvZGUgZmlsZSBuYW1l
cy4gIFNvIEknbGwganVzdCByZW1vdmUgdGhlIGlzX2FzY2lpKCkNCmNoZWNrIGFsdG9nZXRoZXIu
DQoNCkhvd2V2ZXIsIEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGNvZGUgaXMgaW1wcm92aW5nLiAgSSB3
aWxsIHBvc3QgYSB2NSwgYnV0IEkgdGhpbmsgdjQgaXMgYmV0dGVyLg0K
