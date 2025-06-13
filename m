Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE36241667
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 19:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843151; cv=fail; b=uIeIsTXwkGLWxu9SdmjZLQKLstnzitxpkw2bNgrt17IX3HJpnLpf3HGT0v0w+1/x3RtrhufTUXJAoH7YzKa8jESpWeP5zOBSIpfHLn3bzhn8C0gGbBUTnS1BZA8z3GlA1Kjo4prR9Dk4Nq7qPzmPcKah/7gSWqnTIr4PQxwnBMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843151; c=relaxed/simple;
	bh=qRE1ur/QHG8G58mMBTwtywIki0XzyQvr2TMfeRpS9nk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WWC5uBP7I3W16uGDrJNO7ayRtDadRlxRFpXbzYxaSQ9W71msQw7ywVl+W2BocU7YCHZC8jWrdwS5OngKLIbkwRunJeuDEsy6YostcJsDy3o4DZwZZ1TyX/mEZ9M4gYWOMbqQLRB4ioNhgpK3De6UMZX1+oQvfwcrEFJhq3NgMfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EfFNw8d9; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EfFNw8d9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7x9pcBR+2o2EDD6vAt+P4AfjR3osQQ7LVhYzq0nBHifSEmnHVlNfvffBtK6+pLA4E1PIVpO83y+Rf98aXet/WNEuEF2aQYvgqLfDdxNVbQkK0QIOf4gHIp1/q5nR8lTyzP8QEDuABuGrn2IDIqHJ7yyFnGV3b6OuzLJQnqfs8FolTaQ2AIHrhrVDF8A9dnSST9CRNC/WfcD7j11lPjI7z7U2aiSGWItFD8QtehfO5dV63VmsoNnr8ZJ2egmKQqeaPMww32stu3bumVprfN9VfDchDofxInhdpJ9e6epurNq719NfmEoDmGIq17xpWEYU5MmcorEVdssL5I2/fSEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRE1ur/QHG8G58mMBTwtywIki0XzyQvr2TMfeRpS9nk=;
 b=WAGsHOhYWg8/LePcvnH3HwRchNohpgJT6KAoV9kelzD+ekXChIQTHHWDnWo2xXy56cb5ebvL1VWUN/EJz5/0vALS7OIxrXcDWOBApdmycR2le44VzT8t7HgDwEN0r+KiVh7k6OBt559UN0OOku94QP7hXn238s+twtsAU90eC9BqXbhEjqSuVu7jLpa1ExRGTBp6eHGMqex0afPYbGc+sy414+6ZzdFJ7q84g2vHFP35L4lKVo/g+Y/vNxykfdpByIhWhunF1O9Wca7E66aAnacjqI/82gWpOXrkQ8i0bFkOMA0QGclf789t++cHN7D8wvYiTal3rYItJ3rMVVTdpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRE1ur/QHG8G58mMBTwtywIki0XzyQvr2TMfeRpS9nk=;
 b=EfFNw8d9qofYkq9LjCIZgVOfun+vZVPTOH9iTwfQU+zlr038MZKWSJhB6t4W5NZDpcfB6ikzQWRDcp6RWOV9sV/q3JM/tBFms9Mkq5WCBm7zzoFqIWamkNsH4BJBmYX8U5T5ONt667S6RC6C+g1ebeW6LudUA5mdmpm20NefOqX7zjR+qq5OmiP3gcMOFZvqCWB6KjV/hQ3LMVwE3KV1lsxl/KVzXPnwQn9zSM0uE7QKObz2jLsAvSB/QHp187woMJvdQ9gh17uWRwfapRc6/EgSc4GEpiY3C65uZZqelUhMxA82u7R/zxZy661WvOsFz4ZB0/n8EQtN4UCgGLgkqQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 19:32:26 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 19:32:26 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb2Y76GidriUYRM02FngySpVCBwLP8FOaAgAVrw4A=
Date: Fri, 13 Jun 2025 19:32:26 +0000
Message-ID: <123f682b56e1ecc24bb2dcc351f536641920fcf0.camel@nvidia.com>
References: <20250609223606.2897030-1-ttabi@nvidia.com>
	 <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
In-Reply-To: <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MN2PR12MB4142:EE_
x-ms-office365-filtering-correlation-id: 14162b8e-1ec9-4e78-770f-08ddaab1076a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlR3MGtQYVlLK3dHcm9QMi9PRllGaUYxd2NSS2tSMktMV2NSV05lT1JTeGtn?=
 =?utf-8?B?R3JnOEJWOWZSTTJ6RFFKMHdhZHlIT0tibjcyYzhrRFo1aENGTnlDK0o0eXRN?=
 =?utf-8?B?ayt2TG1yMHNPTEpmcTF4bStrWW5nRWxCUnBjTFhWYm9ldDFiZmhXVUZsekpM?=
 =?utf-8?B?WEVUbzU4cXE3Y1AyMzJnNzZDdXZSTU83V2VXTC9YcTJwQUlsRTduOXEyY0M5?=
 =?utf-8?B?dVpNczNFdHJSTGFCT1JtcHVDOWRUYjViMmNDSG5TL3RhVmt1bXlDUnp2Qzkx?=
 =?utf-8?B?bVc2aFY0SUpUMjllS3FDTzg3RnBvSGRhTVA1L3JGVWZ4RjRNUkdVTVZFVHhn?=
 =?utf-8?B?ZnVnQjExSS9JdkxKcGJTSTBORXFUZG9IS3dVeWlXTUp1cnVmbVBKS0tpY3Z1?=
 =?utf-8?B?V0hrTFFDUWE0ME92dDFFd0tRRVhNY3pHQVBIRTVucndDdlh5eDNCdjNDa2N6?=
 =?utf-8?B?cGtuUFp0RGx2c09xZVZBaHVVUE5jYzFLcEpZU1F4cGJjeER5NjhtNzF5dENH?=
 =?utf-8?B?Z0EvbGJqQVFhYVJIWGtZS0xRdXl5ZHpjZi9tOEpwd09EMlJlT3N6QzZZRjYy?=
 =?utf-8?B?aFB4Y0d2OTUrVFRad1FzRXhuTEl1M0FaYnczcHZacm8rUmVVSmM1NHQzNkFu?=
 =?utf-8?B?YldheThHd3phS3VCQXVFbTNmeFc3L1ZTVUNOeE90Nkd0M3ozM0NjSEJyN2hn?=
 =?utf-8?B?S2lwdkphdFJXUUdDdFV2U2dpaVVZME1HRjcwSnpJM3dpd2xwTGFQQW9rQXdp?=
 =?utf-8?B?dmtybVVMYVBSdXRRU3JNQ0hGaHZCRHJhQTRtQ0FKTXl1SXFzSW56TW1rK0Jt?=
 =?utf-8?B?TFhWRW9PY05FWnIvKzlUMzdTeEkzdmkwRlgrS0MyMGNDYWxSZlVUVkV0RGJQ?=
 =?utf-8?B?SzFOL3duVUZqcnFqVXZPTlFtc1NwRmFGSWRDNVVRMC90S1dMZzNWckFlZC9j?=
 =?utf-8?B?QWt2K1JKYmozVWpCV1FNR3pkUVo1aS9QYTk5citOSjY4SVB0NVVCQzl4L084?=
 =?utf-8?B?TVRUZXliUTU3WlFhalJiU3pQYm1SYTJWQnAxOVVvQVhuVnh2dFNjWnY4SGtw?=
 =?utf-8?B?bnltSDBYbUpzdEx2cWdOSVNUWlIwUndMZnRjNXVjQTZXditZcVVLSDFaYmNK?=
 =?utf-8?B?NmFTTTd6RzlhT0o5SW9vVmYzS0J5cnhHQVNZdHhDZ3dibStyTnBIRTRDVWda?=
 =?utf-8?B?cisvS3J4NzVGaXZiemlVUW1nK3VVOVR5QzFsdmxaSHNEM05vTExTazVzVGRt?=
 =?utf-8?B?V2JicW1sazFzOTNUaUpOcFZLd2xWdWdYMDlIc2p0NjFOSkVZeWJYUytaRnN6?=
 =?utf-8?B?Slp3OERwbEZjSStxTWc4VVhSVHdJMWQyNnJDc2tGbFZnZXFLeVpGRVM1NzBC?=
 =?utf-8?B?dWM5bXFaTDhSN1k1UTNpNi9GbktSQVlmWC9lcXpMSGttYll2M1laWk1KL2wy?=
 =?utf-8?B?aWxyMkFWaHhvNHRhVmRDMUVTd0NydXp4RERDcjdtWU1uVXVOOWlWcTJNUHV0?=
 =?utf-8?B?L0pVNHN4SXJQc1JxWnhGQXVoSTE4S2oyY05lbUs2cnA1K2Z3MXFkM0lsenpu?=
 =?utf-8?B?ZFRwSzdZWWVGN1JPNlljdVhLVGFJQUg5VDJ3UVNpYUZsa0UvN21Fa3ZJbW1v?=
 =?utf-8?B?eGcrcEZtbERtVGRkZ1B3aFNISXNvZlp5bTJ4ZWtibEwzRklDd1Q1L2syKzBu?=
 =?utf-8?B?c01pUFJsMHVWbDYyUTk0aEZTTnptV0xaMkgwemFZSWplSHVzaE91YjdtS0t1?=
 =?utf-8?B?VXhreDNRVzhmQnNIVGYvVDV4Wno1Umw3Njhmc1hEN0psMTVWWUtHS3pFQ0dv?=
 =?utf-8?B?RlBnelVFcHROYU0wdCtIdW9QRElVZDdEelY5NjVHUEc2cVRUc09jNjR6c2M3?=
 =?utf-8?B?Ry9GOCtmZ00wS0JoUFAyMXdKRjdtMEhUais1NVJxb0FuU2t2Z3Z5WnhjT094?=
 =?utf-8?B?cGM2akhtYlh5eFJXME9SVWt2QlhrRWREOUJLYnBYaTRzYWFrQm9VUTA5ODg2?=
 =?utf-8?Q?oqcriMKJSSVA2bN/2f0/G7AJyYECkE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rm1DNDMreHNIOWp1bmVIRFdvWjQzODFiRUQxNHdCNGQwK3oxWlpKcFVlWUNi?=
 =?utf-8?B?U2VvZHQ0a2hPaEt2RTZBb0FwTFFiMndsRlphMnJIWlI1Q2FzalJwSHVLMG1B?=
 =?utf-8?B?WlZpaEcwN1ZoclgzVk1sZEpmQkZybWMvSVozemIzMk9wSFUwcUNhRmlIK29r?=
 =?utf-8?B?NlFRdGRzYWE3c0RCbkVyT213QlgvbGtJRE5GQWRJM2JNbGU1aU9wUmMraUdC?=
 =?utf-8?B?c1I1VWxBTGoybUthQnFld3dVc1VQWDc0N0VrNlZnTVFKdG0yVDltZE1nN09i?=
 =?utf-8?B?NVY1S2JVUFpHTzFQajRkNS83L0dnWXFzSUxXK2xCZ2RZcDRwRE15S3hwYmFJ?=
 =?utf-8?B?dlhwU2k4YXZucm9PZndDR0xJcUpvSHA5Ums4N2FTVzV1K3p0VVdHam00UXB5?=
 =?utf-8?B?NGxmOWFWRVprcyswYWVGakc0MHlad1dKOXFkZnRRVFZkWXNnejFIckhya2VR?=
 =?utf-8?B?Tk1JdzlYOEhwVmlhRGw4TzhvamJXOGVZSks3UDU5SmtOZ2ZRU0gxU3NMc2pP?=
 =?utf-8?B?WXRVZy9DcVBRak45VU10cW5EdHFXK2hLeG5sMnBiTzdPOHQ0c2wrRUw4bldx?=
 =?utf-8?B?UDZqLzVFdmtNWDgvRXpNOWdTanFuYUlTL3lGODdGelRxOExIL05UT0dnME9F?=
 =?utf-8?B?bG1DbENFUkhQR0V5RHZLa1FyQkZRQ0p0clFGYkRUS1AreUMreGRHWEZGNG5p?=
 =?utf-8?B?VXdKdVppT0g4cWZvaXJaTFZwdnZ6dTNTOHhRNTU0clBjaTYzZlAwOEhwU1ph?=
 =?utf-8?B?M3FFQlhWajYrNnhTdkJwVDgxbjhsRXhzRjExeFp2bk1FV3F2WExBOTV4bk9F?=
 =?utf-8?B?Nm9sMGlwNjU2VnV5dDl6bHNJNGRjVTZ6VkpEQ3BQYjlDWTI4dHhOUkhUK2cr?=
 =?utf-8?B?ck94T0k1eGxMTGYwOTBnVXVia3E1NkVqYmZ0TnhRMzNnTmM3TlF2NldiSlAz?=
 =?utf-8?B?ZWlxV0gzR1JMWWNhSDFqaTk3NGxpak8rV1lyMjVHV01zaUpYNnc2VzBDbUxu?=
 =?utf-8?B?cWtWb0Nwb1BLL21QcnJyeEExYWZNakVoUzdmK0ExUlJZUitoYnJUZUlhNXYy?=
 =?utf-8?B?NXdXQmJnbDlUUTBoMXJ6T0JEV0R3QnRNTC8wR0xqT2tDVE1nT1Z4bXYvZjNW?=
 =?utf-8?B?bldZL0d0VHdNV2tJWlJXK25VWC9hNDN0OWtDOEJ6a2ZJUkxXejNzekpQOEEy?=
 =?utf-8?B?dWhzejJyMWVCeTBUSFFSY2hOanNja0hiVHBDR01qSUJJUmRSNHJ1VFBTNVBK?=
 =?utf-8?B?VHlWNklqeDlOVU04QXV2WENFeFl4MmUrbnpSYUk2WkxhNnhJSmVSVUxlTDR3?=
 =?utf-8?B?SG9RT3Z0SUF4cG93cE9aOEoyWVB4c2tMWmJkRWJ6REZQMGk4WXNOUzNZOFhH?=
 =?utf-8?B?a2sxbUd2VkJqVzdnN2w4YVRwRGJOK05vYkkvUGE1eEhHditoQkFaeG8wY0dP?=
 =?utf-8?B?aUpSMXVBazlZR2x2WUdGZ0NZZU1VSUhOY2hKRmNLdE50V1krTjJNcHZ3eGZE?=
 =?utf-8?B?SkZLQjZnY1B3NDByV1RYa1FVNGVDZVZaVUJZSVdSQWl5NjNqd3pPSGEwdDdB?=
 =?utf-8?B?NlU3Qm1LemJyQzFWZms3blpObEZ2OTFUaC9qMDlVL1NXU1hpZWVhTmxTdGd2?=
 =?utf-8?B?cHRFTTRhWUFRVm1qU1YzbHgzMVVoSktPbGJUUVdJMmxCNVdUc0xVVG5aK1RS?=
 =?utf-8?B?NXk3dGgwWU5mOEpwT2VIQ1JtTjNPellzZndZQVNUUnZ6SzlLVTEzZFhZRk1r?=
 =?utf-8?B?M25WL0VFMXdNeTE3WVdnZUtWWXErM0FFVGtXVnNvUElWb3hYL3FGem9GY2xn?=
 =?utf-8?B?d0Z3YW1remh5VU1pRjc3M1Ztb1BWcVppVzFaNk1WMlhIVnBhUHJyZ3Jxb2Zp?=
 =?utf-8?B?akdLbEFtMWZSRWdGU0J3WjFrTWRmWkFIUzNFQk1OYzhxNzFzTHhFbVZDV09Q?=
 =?utf-8?B?NkxMRnNWL21raC9sN1ZCQ0lWdXlWOUV0NnNvMTdselcrOVY2akFYMkdoaG9p?=
 =?utf-8?B?WVlWUmdiT3AvWEw3SDMvazdJc1JGSkpvLzFXeDdSQ0tzeFlHZjVRc3hCaGNl?=
 =?utf-8?B?QVhBYXlvUkF0ZXFVaHBQZk91Q0tNYjZUWm1yU0JkdkhwWENKWkpzT2F6TXg1?=
 =?utf-8?Q?1YyApkgRQqFVK7f8a9oxv7ORY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0294C93908E7AB4288766E9BC7253FF0@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 14162b8e-1ec9-4e78-770f-08ddaab1076a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 19:32:26.6543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Ej7y1h1zZWsRY3jHWlDYpsTg6qFm4DvK9SF/oMrQRDC6Er/HC7I3CjNBZGfS2PGYCBGQ9kIyCK1EXQ9SOgTSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142

T24gVHVlLCAyMDI1LTA2LTEwIGF0IDEwOjQ1ICswMjAwLCBCZW5ubyBMb3NzaW4gd3JvdGU6DQo+
ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBbYC5hc19ieXRlcygpYF0gZG9lcyBub3Qgc3Vw
cG9ydCBub24tQVNDSUkgZmlsZW5hbWVzDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGFzc2VydCEoRklM
RS5pc19hc2NpaSgpKTsNCj4gDQo+IEFsc28gaGVyZS4NCg0KSSBjYW4ndCBnZXQgdGhpcyB0byB3
b3JrLCBlaXRoZXIuICBJJ3ZlIHRyaWVkIGFsbCBzb3J0cyBvZiB0aGluZ3MsIG5vbmUgb2YgdGhl
bSB3b3JrOg0KDQogICAgICAgIGFzc2VydCEoOjpzdHI6OmlzX2FzY2lpKEZJTEUpKTsNCiAgICAg
ICAgYXNzZXJ0ISg6OmNvcmU6OnN0cjo6aXNfYXNjaWkoRklMRSkpOw0KICAgICAgICBhc3NlcnQh
KEZJTEUuc3RyOjppc19hc2NpaSgpKTsNCg0KSSBldmVuIGFza2VkIGFuIEFJIGFuZCBpdCBqdXN0
IGdpdmVzIG1lIHdyb25nIGFuc3dlcnMuICBBbHNvLCBubyBvdGhlciBkcml2ZXJzIGluIHRoZSBr
ZXJuZWwgZG8NCnRoaXM6DQoNCiQgZ3JlcCAtckl3IGlzX2FzY2lpICoNCm1hY3Jvcy9tb2R1bGUu
cnM6ICAgICAgICBhc3NlcnQhKHZhbC5pc19hc2NpaSgpLCAiRXhwZWN0ZWQgQVNDSUkgc3RyaW5n
Iik7DQptYWNyb3MvaGVscGVycy5yczogICAgYXNzZXJ0IShzdHJpbmcuaXNfYXNjaWkoKSwgIkV4
cGVjdGVkIEFTQ0lJIHN0cmluZyIpOw0KDQoNCg==
