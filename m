Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFB01FFC74
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Jun 2025 20:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749069502; cv=fail; b=HXmEuz3in8pFHeOcxfdyEAWTnt8HF/uFvjyPamqjw8cSUZQSgF0hrKJTP87bWZpJlX6y5RQ9glbJYJARjzmrh6whXQClTIO4Qrhux5gsdUR3pt1s1Nd5z8xNin3YRTQo1PubNECsTFtZwFQulc69aY+2KV+58LwDLqOuvC2Hbf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749069502; c=relaxed/simple;
	bh=YRaLG3rsHk9R6FknvqBsryP0Ks3dm2DmYWJ6IrJh4y8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M4eGyG0TaQdumm7ZzEwB/HFRqoJ83SQXs/Kws9EvBEUN+6a2rpGqAUaAXGiEm55Yzij2CwlQwJqGiZ89B4JcvVn9OPhzw5I8SX2WNV9wsz0CqRLSLsObVkB2gLRsAehNVRe0NQcv0POpC0HWIxBo31nFO17den3adt5ejS3312g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OiogOHaj; arc=fail smtp.client-ip=40.107.96.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OiogOHaj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kY/iUD64BX7ejjEaCL1U39DCBBLiIgx0WEYwDmRldkRNg3M1ypuunKqId5CZ59ptxHY73E0oI5uzuLVEmlSP81Oe9MulP55ezA89nnaNL+/9M7Bzr1yZSU42rzoS1BLWV/d3coGjl3DYOczqXk/Uh8rWTF6ZQp0NE0nq118y+WeophWbeqxLGT5dU7vOk3ySEHcsCzzFBQax4JCi1f+j+G2DPmNH9EAePunPZIf8XV6INcMRtssbz1ggILkTcqYcRcXJIgsf3fPQVtii7TndkOCiiXNsJlZMlh9UBfDNKdqvx6VG4fqmAcORu9+aUeEy+Ir40BjP7+votuzoUKqGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRaLG3rsHk9R6FknvqBsryP0Ks3dm2DmYWJ6IrJh4y8=;
 b=WUWDF+n2g3TaP28UGiDHzaQUFwrce7TH2Fv7CPdMLzA4VfLJ/Fk5mGExhKY08ZHdUyeOo3IItCaTFZw0KwH8jFMoJg2O2v/jVQxWh07JPeR4h0oJeZi3o2T9UYngaoOMHfr9rzRmoQMc8ft3wjuOFj2qVldV2d1fU6xbZsQBB1aB6OstvmuDUHVQdrtBuIII/5Ohmi1evOKEtFII646cvOcm8IRalaLluh9GUR/vQr0/dxSTriGFPDeCbo/Lv37zuJB6G+0Bs89NaAngRjzFTZVATioV3wN89W9dpjhRM3TuZMMUqIiqpbZeqnvL0HsYzKKonE+YkDwcIshv7rfB7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRaLG3rsHk9R6FknvqBsryP0Ks3dm2DmYWJ6IrJh4y8=;
 b=OiogOHajSX8wEc6jX7fCrWnaOBG+xRfOQfICCwo45GlJ20c5/kWrejzbUPc9l/kKLznh9JAkl5/3dfLOJWPd2xzx+FrXeRw/SfIEaf2g9wV42Mz2+2kkZi2QW8MbtB+ZP9eGT0X6hfpqBNvndb4Kk46blr/TmaC9p2i+shEobQX0nNlCO8R9covV4KX64MmvwMa/9V4l9k5hbjgKZcdqH/tjkslV07JSTCHnow74rMmL5B9bgacWmTjOFSeJI4L3IlC5PYx8xU3yM5jnpzSZMNzUjy0BKaHb2iM6YmfMgc2pR2y0ziJoMT+DYZxEogft+e1fu7AMGaLjlx5PQyQYtw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH3PR12MB8235.namprd12.prod.outlook.com (2603:10b6:610:120::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 20:38:13 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 20:38:12 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Topic: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Index:
 AQHb0Mn7MGE1brglZEyKYzrCM8w6zLPqDQoAgAe4WoCAAEL3gIAAFKqAgAC4IQCAAKpzAA==
Date: Wed, 4 Jun 2025 20:38:12 +0000
Message-ID: <874ffd400b0632cff99b618661adffe472abbf8d.camel@nvidia.com>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
	 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
	 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
	 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
	 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
	 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
In-Reply-To:
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH3PR12MB8235:EE_
x-ms-office365-filtering-correlation-id: fe1086bc-b35a-4ef0-b5c4-08dda3a7b9dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWNlSVFPYkJjdFRMamlBaGxPV05EMi9Wcy9RWjdGZXlNUXpYQVZCMzJWNTAy?=
 =?utf-8?B?NnErWnNzNzh4aEpWaGF6QStNekJtNUF0bzZrcFZOa2lOdlc4SFIzWUlHcUlK?=
 =?utf-8?B?SHRjOUNOajVuT0p4aTJBanJ2TWM4OHVyQURHVmtTT1YySWVFYW5JKzdVVlhj?=
 =?utf-8?B?QVQ0ZEc3LzhMOXdFSzNDMi85Q2R1R0NDdUY1UzZ0M0JWLzZwS204Q2ZYYlNJ?=
 =?utf-8?B?RUF3TDJFMFFuM2xyRE4rUHFuclMvVEtJY2tPOXQzZkhnaGVjNFdBRXBkS29J?=
 =?utf-8?B?c0RsUnVaUnJwOHl1TGxlWnIxMHl3OEFkYVVkamFxS0hnYzlva1g0WXdNMFlM?=
 =?utf-8?B?djRWdU05Nkh1QWhwNGtCQ1lpRjFSNjVXRjZnV1dKbnJnajM4WllQekdkU2xj?=
 =?utf-8?B?aWR4aEpzbDQ0bTBVT01wSFJnZ3AxQW1uWWQyM0c5cmVzMklwaG5UZng4cURH?=
 =?utf-8?B?a1RHU1JNa3hVbHNxanVwQWg3YW5zeEwvdnFuM1RKNTNtZ0YvRDFrZXhOTXVa?=
 =?utf-8?B?UitvWU8wQjN3V1JSTlk2enovNnJLdEZiVUZneFZxMVVMR296cjJlamphc0lJ?=
 =?utf-8?B?dmRJdVBpNjFUd3BQZ1F6YitOK2hxeTdPN0VTenNYM200a0Z2bVI5T24xK2VX?=
 =?utf-8?B?dFMvZWxxNDhBTnNxc1B6b0ppTlJKSEFSZU50V09vN3F3cHErdlVRNGhKM3hV?=
 =?utf-8?B?bldrR1kyWW5VeXM3bGh2MkpRRGF2a2xVVnM5TTNqd1hkRUdmQURXSmxxaDhi?=
 =?utf-8?B?Mjh3b3JWN1ZXOTUvY1RQbGhpLzdhU0xwNHBjRmpoZVlPQUsvUG1CRE9VNUx2?=
 =?utf-8?B?RlVyeE1EdDB1OTJUMFdjQmdtMHV0QnJ1NXNPZmVUT3h3ZnlBUzNWWEdXemZL?=
 =?utf-8?B?ejl4bUFNdTUxWGdYMHp6QjgwVUQxQUw0d0FnUmsxT3NGNDJyUzZpbTBHdVdG?=
 =?utf-8?B?ODBXeFNVYzY0ZlRXYjJyRis4RnM1U21OZ2hPVWM1THlDd1N4aUVTZVJQVHlL?=
 =?utf-8?B?UWZwN1dUUGhQSGU0VkZlajBIQnFVTTVYeDB0cmJwQWs1OGpUQkQ4SDNHeXlu?=
 =?utf-8?B?NS9nRmFsWFZSaHRITGV1TDlMMHlDaFBLMWhYb0YwNng0OHRNVXlXZ2tQaTVH?=
 =?utf-8?B?S2Uyd1ZibzZjeEZpN3N4WWZlMkJ4WmRSeDVrRmp4V2RqV0NxYlY1M1Z6aGdR?=
 =?utf-8?B?bUpZOGtpaUlQVG81Nks3a3paOVlCMVdESUpEWld4YVN6Tzd2c0cyYXhYQXox?=
 =?utf-8?B?bmExNmUwRGlQVTdlQkp6Zm1yRC95SCt1QUVIR0hIRG1Nd3g5VVZPcFFEc3I3?=
 =?utf-8?B?UVpHRlZQSWFieVRjRDNTdlV1K0VGN3RkaW1HUmdpSGJ2Wis0ZkN2S0pFY0ZW?=
 =?utf-8?B?L2NkN0hzSWdpNnhXWXpqbkQxSjhZaTBpRFF5UExEakhHQ2ZTeE9uOFgxM3Nt?=
 =?utf-8?B?eEVTanVoQW1EVjBiZHYvK0ltUGRSVXBJcTUxbmtIZnArRFBIM3pTRXZrUjdm?=
 =?utf-8?B?QmVkUHY3YXJ3UTVOSjA0ekV6VXpFKzlUNkpFVFcyTXRYaXZtakR3V1QyT2ZS?=
 =?utf-8?B?dDVtdHZaV2FNNWYxRjZtSjdsVldzTi9OT05ZUi9LVUR3U2dPN0gyYkpUN2ln?=
 =?utf-8?B?SVZvb0lmbFFCZUkvNU5UZ1Z1ZVVGU1ZQK3M4VFBMbGNtNFF1K1drTWdsci9k?=
 =?utf-8?B?OWdQcXh4TUplKzZJMG81RUpBRUpWVFhpM3FwWlpObTErenRBSWpMU0JGTW5a?=
 =?utf-8?B?ajJIYmZ3LzAvRjFVWXhZWXU0SG9IRVd5REtRdW9JQTF0Zmo5eGptYUpYbTJo?=
 =?utf-8?B?bGJTcGx6TnZnSDA0dU1La2dOUVFjZVJXd1QwWmg2MUlweklDZmRUSForTTk0?=
 =?utf-8?B?Y002bGdnWjBseVh2L0U2SEQ5K0RrVGFzSHhER3NFMnNtbjBxZVBqeG5CaTZR?=
 =?utf-8?B?YnlOd2hpZTR5U1JtdzhsalBnZGcxdnJnNWRGK2tEcjlLYURCQS9BbHhla3Fm?=
 =?utf-8?Q?od7h/FpsyiwPDVot903qKEMZnqDANg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UkQ1TG4wK3ArcytwUnNjblBHZEVTWGxNd1ZqNDVoM2ZCQ2dGbUpUeXVLNDZQ?=
 =?utf-8?B?cWlBM1NQWklkeHlNbDBUZFk0bWszY0dlYXI0VFppRVZHaG1YNzZsaGZMOVp5?=
 =?utf-8?B?TlYxUDRsZ3JuUFhPVVFGUFZ6NTNRZlRVQXgyMHRqczQ3aGp0YlA3YisyQU9M?=
 =?utf-8?B?VG9BQVdEYWlTY1pzZzgxbnpENXpQQVVBMk1kMlNuV05oMDUvWi9sRVY4KzIx?=
 =?utf-8?B?QXlNMTFEajFpaDNISHVOMW5IU1BsOGRHRmQ0N2pIc1B1bjJBSHV3MWtYQmlI?=
 =?utf-8?B?N2YzV0tWOE5GU2prVDlRMU56bVhpeXNYdm5sNFIzSVlxcTN4T0Q1cEdwMzlI?=
 =?utf-8?B?ZzMzQXpIbmEzZGNVL0tXZTZVRmQ1SmZQTlg0dkc2Sm9oVHJzQzhhem9hYjhS?=
 =?utf-8?B?UzI0L1V1TzVOOXp1QWpLQXJ3WVlzSWFQQ2d4VTR1NXl2Tk4zNWYzNHJJdnQw?=
 =?utf-8?B?Ymptcm9VRXR3MUpQRmNhNXJOaE9zM2N6OEsyQnZ0ZVZ6NnlkbEZ1d1NxaG15?=
 =?utf-8?B?WHkrbFVHZ0JRVFQ1RjIwL0lsSnhreXd5VnNpWlNFbThVejlSYm1mV0Ixb3R1?=
 =?utf-8?B?UHc3SmFYSmF5SWFITUovdW1oeFZKUkZobHpNbFc2aEZiSkhQeVd0OW80bkR2?=
 =?utf-8?B?OGN1WFdKM004aWR0K21lNUt4OGZKL3pHb2FCUThBNkxDK0RPOXhKMDQrby9V?=
 =?utf-8?B?cDdXVFRtZ2tEVGhpeDhUYjVvTjA1RUtubFdEN0lmV0F5NEVlNDdpaHpwUXVy?=
 =?utf-8?B?M2xRMzhNSGVEK0cxMUlXQTNsWE9MZmhUREUyNTRWNVFiVm52dFo1RTBFeVAy?=
 =?utf-8?B?dS9FOXRTZWI5WC9MaUZEV1lXbVRSUlQvVmNQRkR4OHVZMU1vRlAxTnQ3d0dq?=
 =?utf-8?B?aE1LZU9CaWJxcVJyWWJsK2w5VFBtQVZkQjVxcFhKVm00dEp6RkpMZEJMZk9K?=
 =?utf-8?B?eU50MFVyYm1lZzNFMTNDSHlyN1RJZytvVm9BTjI0QUJJdUxjM050SHZ6Zk14?=
 =?utf-8?B?Z0JseVROUmZhSnhlOGx4M3Vya3JIUmhKYldlMkhrdnhTZklZeFVid0xzQVBt?=
 =?utf-8?B?OURxN1hPSXNEc3BnanVUNnRkeGJ4T3ljMEVkbzdMdWY3a096OFVMaXFlWmVa?=
 =?utf-8?B?U3lxb2M2TW5ldjh4VVl3Mk0rSEZydE5jZFF2U0lNSEZZQTliVmZma1hBaHEy?=
 =?utf-8?B?VEtVTk1WUWJLK1Q1WWVYR3VPUnF2c0ZLRERPeDJDakcrUUQ1TWhkUmhFMWto?=
 =?utf-8?B?bzJuV2dCTG5xd2ZZR0tHSzZyTEhtdC81ZXV5Zy8rNUJxaGw5MDdVUXovU2h0?=
 =?utf-8?B?SmdWS2VkSGNsdDRKelVrWmdmR2NmWmxIMU9lUzIrK0VmQmNPWGZIQklTTHZo?=
 =?utf-8?B?RGhRYngwS09IKytBa0drWTBlUEhtbTJxNDQwL2gyNFh5UWVHZjBwaXE5MlhG?=
 =?utf-8?B?dHk2S0NXQVFVZXVvbCtNbndpSklyV3kyMzFJYjh5NUh3Z3l6aTlwRGVCbmN1?=
 =?utf-8?B?Vkd4SlVlU2NFTkJNRmhKcEdrbnRycFZvNGF4MEtqR2xLWldWUDh6bHQ3QUNa?=
 =?utf-8?B?dWlHQnMwYjhpdXN1M2luQmllZzd0dFpoWFoyM1dHRGJLS0doR083SGlqamNS?=
 =?utf-8?B?NVdzSlhSaFkrcFRSL2R0K0ZQQTdGZkpBcG5YT1g0U0ZtdTNwUERiUzd3RktJ?=
 =?utf-8?B?ZzkvK3ptMzZxakh0cmdJN2p5TXdDYVhZUFJ5V3p5eWMrQXVYd2tMN0MzcUlP?=
 =?utf-8?B?QUViNmtwRlRaazFoT2o2dkhIOGtUSG1jMWR2UFNVSWs5b2FZVTNhdnFnZlR6?=
 =?utf-8?B?RlZqVjRoQWk2VDZvUkRCdUxpa1Y5aVdadWpSR1hJYUVMeHhJWHNGVzM4anIy?=
 =?utf-8?B?WTIyZ21BSFUvQXN5Y1F6MEp4emlxeGJsU2ZuZGM4Vm1aM0tyM3FObFZFL2JX?=
 =?utf-8?B?SEZjajJudDkva0tFM1lsMURqVlhVK0xFblhkUm1iNHJHYmtOeVNjU1R6S245?=
 =?utf-8?B?TGxYSUFKSXUxbGhMN21UeitFU3VYeUYxRnZHQ21ySHVsd0RCZmdwYUtxSVdD?=
 =?utf-8?B?WngvN0dwWlJoMjhwdGcvRklhbGN2V3pyWCtLWXd5MUdhSm9HTXFaRVJPNXlu?=
 =?utf-8?Q?sd2/Cu+gM74bJwnhCqN8/MN5E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A967F6D81DD8042A04CD942D41D6FBE@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1086bc-b35a-4ef0-b5c4-08dda3a7b9dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 20:38:12.9030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrkBIKg1w/RkU0s10jWURtqRAIT/Ok0mIkVthdtbylQX2VZ/9cshkQxjbLjO9ZEWjtub1jFIdsuKPNfIcHhipQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8235

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDEyOjI4ICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IA0KPiA+IEkgY291bGQgYWRkIGEgc2RiZyEoKSBpZiB5b3UgdGhpbmsgaXQgd291bGQgYmUgdXNl
ZnVsLg0KPiANCj4gWWVhaCwgdGhhdCB3YXMgd2hhdCBJIHdhcyB0aGlua2luZywgdGhvdWdoIGl0
IGlzIHNhZGx5IG9uZSBtb3JlIGxldHRlci4NCg0KTWF5YmUgZGJzISgpLCBvciBqdXN0IGQhKCkg
Pw0KDQo+IFdlIGNvdWxkIGFsc28gc2hvcnRlbiBhIGJpdCBtb3JlIGJ5IG5vdCBwcmludGluZyB0
aGUgY29sdW1uIGxpa2UNCj4gYGRiZyFgIGRvZXMsIHdoaWNoIEkgc3VzcGVjdCBtYW55IG1heSBu
b3QgY2FyZSBhYm91dC4NCg0KRnJhbmtseSwgSSB0aGluayB0aGUgY29sdW1uIG51bWJlciBpcyB1
c2VsZXNzIGF0IGJlc3QuDQoNCj4gSSB3b25kZXIgaWYgd2UgY291bGQgbWFrZSB0aGUgYGRiZyFg
IHRoZSBvbmUgd2l0aCB0aGUgbG9uZ2VyIG5hbWUNCj4gaW5zdGVhZCwgaS5lLiB0byBrZWVwIHRo
ZSBmdW5jdGlvbmFsaXR5IGluIGNhc2Ugc29tZW9uZSByZWFsbHkgbmVlZHMNCj4gaXQuIFNhZGx5
LCB0aGF0IG1lYW5zIG1ha2luZyBpdCBub3QgbWF0Y2ggdGhlIHN0ZGxpYiBuYW1lLCBidXQgaXQg
bWF5DQo+IGJlIHdvcnRoIGl0IGlmIHdlIGV4cGVjdCBldmVyeW9uZSB0byBlbmQgdXAgdHlwaW5n
IGBzZGJnIWAgYWxsIHRoZQ0KPiB0aW1lLCBhbmQgb25seSB2ZXJ5IHJhcmVseSBgZGJnIWAuDQoN
CkhvdyBhYm91dCBjYWxsaW5nIGl0IGQhKCkgYW5kIGRyb3BwaW5nIHRoZSBjb2x1bW4gbnVtYmVy
PyBUaGF0IHdvdWxkIG1ha2UgaXQgZXh0cmEgc2hvcnQuDQoNCj4gPiBPaCwgSSBkaWRuJ3QgdGhp
bmsgdGhhdCB3b3VsZCBiZSBhIHByb2JsZW0uwqAgSSB3aWxsIG1vdmUgdGhlIGZ1bmN0aW9ucyBv
dXRzaWRlIHRoZSBtYWNyby4NCj4gDQo+IEl0IGdlbmVyYWxseSBpc24ndCBhIGJpZyBkZWFsLCBl
c3BlY2lhbGx5IGhlcmUgc2luY2UgdGhlIGludGVudGlvbiB3YXMNCj4gdGVtcG9yYXJ5IHVzZSBh
bnl3YXkgYXMgeW91IGNsYXJpZmllZCwgYnV0IGlmIGEgZnVuY3Rpb24gbWF5IGJlIHVzZWZ1bA0K
PiBpbiBpdHMgb3duLCB0aGVuIHdlIHByb2JhYmx5IHdhbnQgdG8gdGFrZSBpdCBvdXQgYW55d2F5
LCB3aGljaCBhbHNvDQo+ICJmb3JjZXMiIHVzIHRvIHByb3ZpZGUgcHJvcGVyIGRvY3MgYW5kIGV4
YW1wbGVzL3Rlc3RzIGZvciBpdCwgZXRjLg0KDQpJIHJhbiBzb21lIHRlc3RzIG9uIGdvZGJvbHQs
IGFuZCBtb3ZpbmcgdGhlIGZ1bmN0aW9ucyBvdXQgZG9lc24ndCBhcHBlYXIgdG8gY2F1c2UgYW55
IHByb2JsZW1zLg0KDQpJIGhhdmUgZG91YnRzIHRoYXQgdGhleSB3b3VsZCBiZSB1c2VmdWwgYW55
d2hlcmUgZWxzZS4gIFJlbWVtYmVyLCB0aGV5IGV4aXN0IG9ubHkgYmVjYXVzZSByZmluZCgpIGlz
DQpub3QgY29uc3QuICBJZiB3ZSBmaXggdGhhdCBpbiB0aGUgY29tcGlsZXIsIHdlIHdvdWxkbid0
IG5lZWQgdGhlc2UgZnVuY3Rpb25zLg0K
