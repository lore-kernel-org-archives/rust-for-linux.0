Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909B3248F6F
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 22:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135413; cv=fail; b=oVlQu9kWQhh8J2bUPrBDUPh3Bqm6LmXGrHPiX6iKCc6j4YndEvXTaCVh6UGRD+d+oi8ZiqjxN0CzRYYU1SSFGQjNCxY2lRmGBrNU9KbEW6eRJlhh+GPRI38B/V1b+9+IdREq+sFNOSZK/7ZJWnD5fS8QhsZERK+NXRB5S7yN8h4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135413; c=relaxed/simple;
	bh=gfx304Aiu9lduXuGhPw8txbVbj/4rdSWk4n1iUUE+HI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DnPjtRvdw3/UEiQU+EmbigmSoz/mxlRy0FWBoGs7b+Z1S75d484s15YU8kLrmKbD3PD/AoV7Onl8ezm2dvHPk/YZRmfGVQ9nebu6/Yt6wcggJ4n4C4JE7UAVzOnWcgG137RGQt0E3jxB+QEVi/ScUJnCKOL2MKS6L9xvBENYJVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ayBanRTy; arc=fail smtp.client-ip=52.101.46.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ayBanRTy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPtpOBlDeqMpnNQT1a1gw/4GoDmPTTd4AgcuWaeA+IEcIPTW/+GdmttCI3FPcfKa3s5L0RCz/2sQ4aDWlrkyg1pNhi92737Q22aJOn9886Vj/SThVt9LYvA26amQzxpfujcdCzrkBpz02WEgXAfVVBJdIBZyYEtL0e38SceCu4ehXpmzwa+K2bYG3lGAmg5nycyaG9kdCEs6zd/mckAjvn0+kVuLj4b89y374169Amo7H36fJrytMh9xFUYTAEZ3YyetkGB9Re47YcF7YlH+FZ6ulgMgxhHXDCQVVzxpORhyRuOvb9I/Ul0jYBidINmcFVGeLemBoehm2ooZBcHmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfx304Aiu9lduXuGhPw8txbVbj/4rdSWk4n1iUUE+HI=;
 b=Oh+Kw/GiokmwTdlZvoQWnzuNa4aZkBbpC/4iLJsX3soweqqJZOGcJrjmiINRfK+ky2/kWdhpw4nDDw8bFTOyQVsiKI84aSARP7bGZ8ITiA3+ND7LpswCr7sBAaULbGLzz/dco6ZVJUqsyQCydqGWl4gGWbo18oXm+yOpdWYOR6j2qXDJ391GkTRZQStywPV95YMMIP0cffFcNsqBmECIbBaD1/2ubBAEYNCch3aqk4eCn8jJo3PMJbcD1a+MqbMY3YjEC9rxeAIkG1sUTfw72rsXvqOyH4FufCC66vQnTkuRpS3fwXikbhhcUQHZRndfvgtsyK9VGye5zew+x77i9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfx304Aiu9lduXuGhPw8txbVbj/4rdSWk4n1iUUE+HI=;
 b=ayBanRTyc60qU3NlsssDUM28kXR3TKy7G7KR8Xv/8i/qhrk+oWQhP/JdPLPeg/XVhTNuNIZo3F/hbMuhJZwor6KyUYmF2Oaza6ie5Qd1gUjJnYP2TiC62wYC9HQa3+eKM7QwrtlpPBdEd8LQD8uZKj2sOcalMlru5zvsRTVB1sjpN6KhhAePBiNYRh8VebRpvkDTUV8NclIyH4jMKx4ZlkJZrwdg61DRT2m2NXlNx9uWOffkRzC0SrX2aLCjwqf8vU6AwXycSF/9tzNn6Tnwyqjw7zNlc1cxdmiAWfrcqxAnF+7ShinB+chd2l5dEysT3k778qyIugpruB5ocyPRlQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by CY8PR12MB7755.namprd12.prod.outlook.com (2603:10b6:930:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 22:56:49 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 22:56:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH v4 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHcb86uRR5PbMKlQ0aCb0DHh7/+RLUnXKiAgBOC4gA=
Date: Tue, 30 Dec 2025 22:56:49 +0000
Message-ID: <3b5096f40e724d313d028128818e3e69d3c9fea1.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <20251218032955.979623-12-ttabi@nvidia.com>
	 <DF1D026W0BQ9.1DUWS5LKR09TG@nvidia.com>
In-Reply-To: <DF1D026W0BQ9.1DUWS5LKR09TG@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|CY8PR12MB7755:EE_
x-ms-office365-filtering-correlation-id: f18c5fbc-d7fe-4ed1-28e7-08de47f6b71f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFlrUnRya0I0SmJYOEdVQ3IybkpzMzc1a0c1OGVyTk0vTm1DRnlTNzQrTFQz?=
 =?utf-8?B?WTd5Q1Q0S1Vjam8yd3hERjJXbWxOMVdmbk5KWlZ6YytKOCtzbjNCNGJDazVE?=
 =?utf-8?B?M0graU56ZjE2RFF5ZUlJc3p5RER4VklOajQreHl2QXZFMUJMOWJRV1RaQXdl?=
 =?utf-8?B?RVV3MmZEd2Zob0lXWVU5ZUVDbXNIczZ1clhwOHBscy9QZVFCWU9sT0NxYzBw?=
 =?utf-8?B?VVg3ZnFQeVhJQ2VTL05sNmVONkVVbjFSZkYvcXhwMS9uU2s2SDBJZ3ZhZ1ZB?=
 =?utf-8?B?SnZqMkl6STZRYmRlWFdIWnNCODhQQzVoeWZTMXpFYTVPTTQxek1DdkN3b2pW?=
 =?utf-8?B?bjMzTW5va29LZk1ObStnZzJLellHNWtuZG1GbGNFOUx6cTZ4eGFlM2pJa2dS?=
 =?utf-8?B?Y25mb3RScCtaT2g3QjlsZStYUCsvSXZWcGw2KzJCc3VBdjhKcGg5SlVlZkNo?=
 =?utf-8?B?c2ZJRGpGdFVBQkREbjBibEU0MkFNN0dDZHBYakc4MjVzUlQzWTJMNC9PWnc5?=
 =?utf-8?B?UExWdVQrdjlZNjdHY1g2di9XZUNGQ2tNVTdJQmtPWmhGTis3dTl1YU9MVGN1?=
 =?utf-8?B?amozTTZwNysyL1hZdXZ2N1RTR3JWWGFFa2NOQXdVNlhaM2IvV3dVTE5mK3Ux?=
 =?utf-8?B?cmhMU0JaYTJoWGZ0bVFIUkVRa1lYV1ZabWE3ZkVMdU1yR1RyMndYbTZHeWRX?=
 =?utf-8?B?T2ZmMUt2aEpoclY0dUQ5Q2EwVkd6QU1GQ2ZzYnJreDlOeitsNnRwWjhrTGw1?=
 =?utf-8?B?d1NvSFYwbWUwU1FSbmgxQU1DMFg5aHBSS2hnNVRQVUdwZExPY2ExenRqNyta?=
 =?utf-8?B?U08zZVhrREQ5RDhUUzFBVjBGY1FjaTh1K2hqTVNsTmZDNjNNaklxOTgwcjRl?=
 =?utf-8?B?a3ZQb210cktPVC9IOEY2UHNRSUJKOW81VHNUbWQ3VlhoNHlLYkp5VmltUng1?=
 =?utf-8?B?VlZ0dS9jYi9YM1RiY0NlQlg5ZUNobjNybi9tMjdSZWNyUlJ4SHJUWEFnd2ww?=
 =?utf-8?B?ZU5DVm9saHpQZHM0SE1xenpWcngyVkZiQjJBTEtIUDNQNFVFRGhYb1dOdDd2?=
 =?utf-8?B?KzduaW9rMi9SME5VU3pGYUZNdTY2TmxISUR6UW50Wmw1RWF6Ly9pTVp0UW1k?=
 =?utf-8?B?S3ZaUFVQck5YSnZWVDBxdkx2cENCNkNIVGpEY2Y0Qm5DQk9HZEF0VndPZVpU?=
 =?utf-8?B?Z0tHNEhzR09EcTJZSVg1N2Q2cFBzbHRBSFpHNmhhMzUrK0ZXZzQ5cmttWm9h?=
 =?utf-8?B?NlVMMXU2YzdwSFJ5RlNHNmdiTWZxRXNaSERhdkptOVAvcStrMGdpNHpmbUV4?=
 =?utf-8?B?Unl2YWhvYXhPV2tHV0M4VnRGZDYyNFdjMTZtbjZPRzZVeWJaSnhNM2k2NS9n?=
 =?utf-8?B?d0xvTlQrTHVsOVpoSTRNTmxkSElSMnFiSUpQcDFmbERpaVRtUkhSNFBpMkpQ?=
 =?utf-8?B?L1A4Y3VJeEVsQkhGM0VxYjRFK1dlK1ZialhadzZFSzRqVHVyYUxzQnJEVVZK?=
 =?utf-8?B?Tk5IUHpvN1ZoRU1Uck4yTk90NzU5OFZES3czdWVMK0p4MlVmWEVDeTk3RU5H?=
 =?utf-8?B?NEwrUlpBYjRuTW1OaUJDSUhWOXlKTnVZdzdHR3pRc0VSTnNoekVtWkQwaEFj?=
 =?utf-8?B?VUpRTHcvRUI5amVmUkJRdytNNDJoZjBYTm90a1hlTTIzdmdtMTNWbmxmWDRW?=
 =?utf-8?B?NUJ2ZVA4eEx0STF0TUc1djIyQVRUTVFya2gvdjEwSHBhNjJNb2ZidW5UdnB3?=
 =?utf-8?B?WEZ5RXhLOGJkU1kzUW5pWEhta3lzUHlNSzQrVEN2dXFRK2tWYllvM1hjbjVu?=
 =?utf-8?B?aFZVNHZKSmNXaGtYVVRlWEV4NmtHMkhEU2VDMzVvZzhLY1M3Tk9hdTF1R1ov?=
 =?utf-8?B?STFYNUs4MGoyOXJ0QzZjWHBMS3l0QmZwUGRDM08vMTNlV2pjQkVxVUVTQ0RL?=
 =?utf-8?B?NzFhcjNQRDZ1Q1lGYThpTXJUaTJXVHA0WjJGOS80NDZuM0xONEJ1YXloeWo1?=
 =?utf-8?B?TG9pbEM4QUxWZE1oUlB5UElTYWQ1SGtKeDVOMkV2TzZUdWxlcTYwanArRU9K?=
 =?utf-8?Q?pKQeAC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1N2a2h3amo4RkFPSVU4RVM1WS90dE9pWWs3ZzZDMTJOUmlUblZKY09Idmsz?=
 =?utf-8?B?dE51ZnBMVlVXUkRnYTh1SlJIbFRWQ1JqZ0llYkNBdExLcTBaaW5ZN25CWFhG?=
 =?utf-8?B?cEVXeDIyLy8vQjVmVC91d20xSUdpOVNEMHlkc2pwaUFuNE9FbnZwNWtjNm9k?=
 =?utf-8?B?Mm9aZXdNeVFUdWExTzJ6VHBzWFhiWGpQV211WlVTV2grbFRZRWd5b0xNRTNk?=
 =?utf-8?B?ZkRTN0FYRlV3aWVaTGpoTVBhaGVxR3RLYkt0WllWc1BUVkp4YVA3VHBpOEkz?=
 =?utf-8?B?S2g3T1dESFQ5WEo3YlpTZGVuWnBjdHdUMlJFWXJ1OW44d3U5VlhBWGVsUUFV?=
 =?utf-8?B?Z3FIM1ZXQm5Wd1piamY4bzJuK0c0VTRYSDQ2WU1Qck5zTG5aWmVLNTVDUmV6?=
 =?utf-8?B?YlNZbjE0dDhZZjNDTTg3b3FiWXZrcThrUzJFcjNGbVFEZkJwaFFmRmtlc1Jh?=
 =?utf-8?B?Ty81SVhla1lCUm5YTnNnTXdUTTV3UGpQbEZnN0QwTVhzQy94MDR5SHozdXBm?=
 =?utf-8?B?WDQ2Y2tJem9UMEIrOGM3RWFJYVBtdzZKS2UyeFZwWTdHRXM4Z1VIRDNkcjRr?=
 =?utf-8?B?MTBlYllzQTVRVUY0cWh1NXlkWTBVNEVtdnR0RjBJdmhEdE14MDRDM25VQ21W?=
 =?utf-8?B?T2Y5ZUJ5ajg2bG1za29oaDBEL2NwZlFsTlNVeE5KQzBhenU1VFBsb052dldq?=
 =?utf-8?B?dkk5dlRlWG8vU2RNU2ZBMTl0aU1pblVCV2xhR0dVTWMrYm5IQmhKdHUvY2V1?=
 =?utf-8?B?Zlh6ZHpOdWtjc2NBZHRJTll5VlpHeEY5eFN1dkdwbWlSRGwrMGRIVEFuV05x?=
 =?utf-8?B?NGpmSml3RlMrQ1oxUUVFeWVwcCtSeUpKMy81V05YL2ZOendJV0ZNNkxKZlhl?=
 =?utf-8?B?ODBQR3pSRmN2SC9kZ1MwaVBFTG1Gdll0NEF6aS9EclhtVk8xYTRUSTdFUk4y?=
 =?utf-8?B?bjVYaXQvMWtMY2ZZSmRtSnlsSGp3djgzRmpKZmxuNTZ2SGVpZlBCN29tdDBk?=
 =?utf-8?B?ZFd6OS9PeU5BSnI4YkFGQm9Fb1pvaWtDSkFKZTNCVmxZSnd6bHZzcWFXemh0?=
 =?utf-8?B?VTVTVHh6WGUzVUtNdVpOWlY0TTFxbHFtcXl1WmwyUis2UVB2RWJIbTRCUkUw?=
 =?utf-8?B?azR6N3pGeVpsSWdBaDh5b2d2aWtQZlFpTHo3QmlUV2V1YlBtRkl0dGVXOUVt?=
 =?utf-8?B?QzJTSTBpNlNsNkEzemxSNHY0ZVQyU0pVSENPc0wxTUdZL1ZIdTRuTytEcmc2?=
 =?utf-8?B?TEo2V1BRSjdQZHowVlIvaU9zUEh3WXJMbjg4d3BUQ1h4dENCNTNzM0JCMWps?=
 =?utf-8?B?dXJNeHlZQ0NLai9YSzY5UnF3aHRXaTZ4Ris2Nlc3Z1hxNUFIQ3RjemxIZGZB?=
 =?utf-8?B?MGF6T0VwS1Q1azAxN3NoMUpuZ1dOYU9ZVHRUaDlhUGlheStobE0vVkVIUTdP?=
 =?utf-8?B?eE1wdDRXTW9jRkM0L1dBT09sc2dRaW9jS2xwYlh3NWNudjh1M3RCWmRrZlND?=
 =?utf-8?B?NjlGYnBrRW9sK1g4V3J1bXlHNkwwNFVMcFhibkVRNUdVOTl1YTRIVWNFK2pQ?=
 =?utf-8?B?NHBOYkJDVFVKN0s5NWZXemFpQlAwL3FkWlI3WEw0WG5LU0ZUQ01IdDlXcVJR?=
 =?utf-8?B?bld4L0lsSXQwNml5TnFTTzlidHVqUkczTXBQd1YrQ1FNdEpVUnZuV0RtNjl1?=
 =?utf-8?B?QXJLT3JuQXFPVWhXLytSOE9BakluRWNmdUFCejhvS2txMmZ6WS9DYVRXM2Ux?=
 =?utf-8?B?VzBKY3VoOVpMTjZmWWdYbGI3bHhiR1hxaEtXMGJwb25LVGx5ckZjWXhTTmVm?=
 =?utf-8?B?RDdBd1dwcjdPT0F1VWFDNUYrK1dPRE9jZlJVem10Q2FlNmI0WElqK3Y3Q25w?=
 =?utf-8?B?TDJ6MWhLU3MzY3MvYkc2SkxUUHhqQml0T0RDVEs4bXdRSzd5RHZ0QTU0aHJF?=
 =?utf-8?B?dHczd2lYbWt4VXM0aktjcFZSUWFYaWxvUnpFR3YyNUhQRlRrNDdJKzNrZzNm?=
 =?utf-8?B?eUpCS0hVN3N5OWJxbVJITGFZWTZIU3lnV1NzWHBrekFCZGN2d3I4SGd5S200?=
 =?utf-8?B?QjNhRHE1K0s4cU5mVitlWlFLQkFHSU5UUzd0RGdJY1FQWUtBNmVuaVhVcW40?=
 =?utf-8?B?Y1Rnci94QVE5d3dUZ3NXRS83eUxsTFNJOGxjeUcwa3ZxSDEvN0JRb3I4bklm?=
 =?utf-8?B?cWNYQnpITkxyZ0hQYU9SZ1crSWJJckZNZmt5Wmt1RDBpYkJlMng5K0R4SUtR?=
 =?utf-8?B?Ym1tVnF0dVhRL1dFaDU4Q2Q2TjlTTHFKdDU4YVJKKzgvOUxhWXd3d3NWNnAv?=
 =?utf-8?B?V04xQmY5UTgzM1pILzFmOHRna1dvSWFlbUluWjIwVVhUUnlaMzl4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C4268A1E8BE804CB09E9D33405EB404@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f18c5fbc-d7fe-4ed1-28e7-08de47f6b71f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 22:56:49.2883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgLtRTPlSdqaZCJUGC1TO/jNJL3W11/DfVeuHhtHuYtVll5OkQTzS6fwX7XqulQamTJYJfj0vWmQMfQEQDbkiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7755

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDIxOjU5ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToKPiBTbyB0aGlzIGBpZmAgYnJhbmNoIGlzIHJlYWxseSBzcGVjaWFsLWNhc2luZyB0aGUgZ2Vu
ZXJpYyBib290bG9hZGVyLiBCdXQKPiBhdCB0aGUgZW5kIG9mIHRoZSBkYXkgaXQganVzdCBkb2Vz
IHRoZXNlIHRoaW5nczoKPiAKPiAtIFdyaXRlIGFuIGBJbWVtTm9uU2VjdXJlYCBzZWN0aW9uLAo+
IC0gV3JpdGUgYW4gYERtZW1gIHNlY3Rpb24sCj4gLSBQcm9ncmFtIHRoZSBgVFJBTlNDRkdgIHJl
Z2lzdGVyIHNvIHRoZSBib290bG9hZGVyIGNhbiBpbml0aWF0ZSB0aGUgRE1BCj4gwqAgdHJhbnNm
ZXIuCj4gCj4gVGhlIGZpcnN0IHR3byBzdGVwcyBjYW4gYmUgZXhwcmVzc2VkIGFzIGEgc2V0IG9m
IGBGYWxjb25Mb2FkVGFyZ2V0YHMuCj4gVGhhdCB3YXkgdGhleSBjYW4gYmUgaGFuZGxlZCBieSB0
aGUgbm9uLWdlbmVyaWMtYm9vdGxvYWRlciBwYXRoLCBhbmQgd2UKPiBjYW4gcmVtb3ZlIHRoZSBg
Z2JsYCBhcmd1bWVudC4KCkhtbW0uLi4gdGhhdCB3b3VsZCByZXF1aXJlIHRoYXQgSSBpbXBsZW1l
bnQgRmFsY29uTG9hZFBhcmFtcyBmb3IgR2VuZXJpY0Jvb3Rsb2FkZXIuICBUaGF0J3Mgbm90IGEK
YmFkIGlkZWEuICBJJ20gbm90IHN1cmUgaG93IEkgd291bGQgYnVpbGQgdGhlIERtZW0gRmFsY29u
TG9hZFRhcmdldCwgaG93ZXZlciwgZ2l2ZW4gdGhhdCBpdCBuZWVkcyB0bwpyZWZlcmVuY2UgZGF0
YSBmcm9tIHRoZSBGUlRTIEZhbGNvbkZpcm13YXJlIG9iamVjdC4KCmltcGwgRmFsY29uTG9hZFBh
cmFtcyBmb3IgR2VuZXJpY0Jvb3Rsb2FkZXIgewogICAgZm4gaW1lbV9zZWNfbG9hZF9wYXJhbXMo
JnNlbGYpIC0+IEZhbGNvbkxvYWRUYXJnZXQgewogICAgICAgIEZhbGNvbkxvYWRUYXJnZXQgewog
ICAgICAgIH0KICAgIH0KCiAgICBmbiBpbWVtX25zX2xvYWRfcGFyYW1zKCZzZWxmKSAtPiBPcHRp
b248RmFsY29uTG9hZFRhcmdldD4gewogICAgICAgIEZhbGNvbkxvYWRUYXJnZXQgewogICAgICAg
IH0KICAgIH0KCiAgICBmbiBkbWVtX2xvYWRfcGFyYW1zKCZzZWxmKSAtPiBGYWxjb25Mb2FkVGFy
Z2V0IHsKICAgICAgICBGYWxjb25Mb2FkVGFyZ2V0IHsKCSAgIC8vIEhvdyBkbyBJIGV4dHJhY3Qg
ZGF0YSBmcm9tICB0aGUgRlJUUyBmaXJtd2FyZSBpbWFnZSBoZXJlPwogICAgICAgIH0KICAgIH0K
fQoKPiBTbyBgRndzZWNGaXJtd2FyZWAgY291bGQgaGF2ZSBhbiBvcHRpb25hbCBtZW1iZXIgdGhh
dCBjb250YWlucyBib3RoIHRoZQo+IGdlbmVyaWMgYm9vdGxvYWRlciBhbmQgdGhlIGBCb290bG9h
ZGVyRG1lbURlc2NWMmAgY29ycmVzcG9uZGluZyB0byBpdC4KPiBJZiB0aGF0IG9wdGlvbmFsIG1l
bWJlciBpcyBgU29tZWAsIHRoZW4gaXQgcmV0dXJucyB0aGUgYEZhbGNvbkxvYWRUYXJnZXRgcwo+
IGNvcnJlc3BvbmRpbmcgdG8gdGhlIGdlbmVyaWMgYm9vdGxvYWRlci4gT3RoZXJ3aXNlLCBpdCBi
ZWhhdmVzIGFzCj4gYmVmb3JlLgo+IAo+IEludGVyZXN0aW5nbHkgdGhlcmUgaXMgbm8gYEltZW1T
ZWN1cmVgIHNlY3Rpb24gdG8gd3JpdGUgc28gSSBndWVzcyB3ZQo+IHdpbGwgaGF2ZSB0byBtYWtl
IGBpbWVtX3NlY19sb2FkX3BhcmFtc2AgcmV0dXJuIGFuIGBPcHRpb25gIGFzIHdlbGwuCj4gCj4g
QW5kIGBOVl9QRkFMQ09OX0ZCSUZfVFJBTlNDRkdgIGlzIGFsd2F5cyBwcm9ncmFtbWVkIGFzIHRo
ZSB3b3JzdCB0aGluZwo+IHRoYXQgY2FuIGhhcHBlbiBpcyB0aGF0IHdlIGRvbid0IHVzZSB0aGUg
RE1BIGVuZ2luZSBpZiB0aGVyZSBpcyBubwo+IGdlbmVyaWMgYm9vdGxvYWRlci4KClllYWgsIEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBpcyBiZWluZyBwcm9ncmFtbWVkIGF0IGFsbCBpbiB0
aGUgUElPIGNhc2UsIGJ1dCB0aGF0J3Mgd2hhdApOb3V2ZWF1IGRvZXM6CgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9nc3AvdHUxMDIuYyNuMTMyCgo+
IAo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIFRoZSBHZW5lcmljIEJvb3Rsb2FkZXIgZXhpc3RzIG9u
bHkgb24gVHVyaW5nIGFuZCBHQTEwMC7CoCBUbyBhdm9pZCBhIGJvZ3VzCj4gPiArwqDCoMKgwqDC
oMKgwqAgLy8gY29uc29sZSBlcnJvciBtZXNzYWdlIG9uIG90aGVyIHBsYXRmb3Jtcywgb25seSB0
cnkgdG8gbG9hZCBpdCBpZiBpdCdzCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gc3VwcG9zZWQgdG8g
YmUgdGhlcmUuCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IGdibF9mdyA9IGlmIGNoaXBzZXQgPCBD
aGlwc2V0OjpHQTEwMiB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdXBlcjo6cmVxdWVz
dF9maXJtd2FyZShkZXYsIGNoaXBzZXQsICJnZW5fYm9vdGxvYWRlciIsIEZJUk1XQVJFX1ZFUlNJ
T04pCj4gPiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIEVycihFTk9FTlQpCj4gPiArwqDCoMKgwqDCoMKgwqAgfTsKPiAKPiBVc2luZyBgRXJyYCB0
byBpbmRpY2F0ZSBubyBmaXJtd2FyZSBtZWFucyB0aGF0IHdlIHdpbGwgcHJvY2VlZCBldmVuIGlm
Cj4gYHJlcXVlc3RfZmlybXdhcmVgIHJldHVybnMgYW4gZXJyb3IuIFRoaXMgc2hvdWxkIGJlOgo+
IAo+IMKgwqDCoCBsZXQgZ2JsX2Z3ID0gaWYgY2hpcHNldCA8IENoaXBzZXQ6OkdBMTAyIHsKPiDC
oMKgwqDCoMKgwqDCoCBTb21lKHN1cGVyOjpyZXF1ZXN0X2Zpcm13YXJlKGRldiwgY2hpcHNldCwg
Imdlbl9ib290bG9hZGVyIiwgRklSTVdBUkVfVkVSU0lPTik/KQo+IMKgwqDCoCB9IGVsc2Ugewo+
IMKgwqDCoMKgwqDCoMKgIE5vbmUKPiDCoMKgwqAgfTsKCk9rLgoKCj4gCj4gPiArCj4gPiArwqDC
oMKgwqDCoMKgwqAgbGV0IGdibCA9IG1hdGNoIGdibF9mdyB7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBPayhmdykgPT4gewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBs
ZXQgaGRyID0gZncKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
ZGF0YSgpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmdldCgw
Li5zaXplX29mOjo8QmluSGRyPigpKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5hbmRfdGhlbihCaW5IZHI6OmZyb21fYnl0ZXNfY29weSkKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAub2tfb3IoRUlOVkFMKT87Cj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBkZXNjX29mZnNldCA9IHVzaXpl
Ojpmcm9tX3NhZmVfY2FzdChoZHIuaGVhZGVyX29mZnNldCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGxldCBkZXNjID0gZncKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuZGF0YSgpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLmdldChkZXNjX29mZnNldC4uZGVzY19vZmZzZXQgKyBzaXplX29mOjo8Qm9v
dGxvYWRlckRlc2M+KCkpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLmFuZF90aGVuKEJvb3Rsb2FkZXJEZXNjOjpmcm9tX2J5dGVzX2NvcHkpCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm9rX29yKEVJTlZBTCk/Owo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgdWNvZGVfc3RhcnQgPSB1c2l6
ZTo6ZnJvbV9zYWZlX2Nhc3QoaGRyLmRhdGFfb2Zmc2V0KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbGV0IHVjb2RlX3NpemUgPSB1c2l6ZTo6ZnJvbV9zYWZlX2Nhc3QoaGRy
LmRhdGFfc2l6ZSk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCB1Y29k
ZV9kYXRhID0gZncKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
ZGF0YSgpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmdldCh1
Y29kZV9zdGFydC4udWNvZGVfc3RhcnQgKyB1Y29kZV9zaXplKQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5va19vcihFSU5WQUwpPzsKPiA+ICsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IG11dCB1Y29kZSA9IEtWZWM6Om5ldygpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Y29kZS5leHRlbmRfZnJvbV9zbGlj
ZSh1Y29kZV9kYXRhLCBHRlBfS0VSTkVMKT87Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNvbWUoR2VuZXJpY0Jvb3Rsb2FkZXIgeyBkZXNjLCB1Y29kZSB9KQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRXJy
KF8pID0+IE5vbmUsCj4gPiArwqDCoMKgwqDCoMKgwqAgfTsKPiA+ICsKPiAKPiBBY3R1YWxseSwg
bGV0J3MgcHV0IHRoYXQgY29kZSBpbnRvIGEgbmV3IGBHZW5Cb290bG9hZGVyYCB0eXBlLiBZb3Ug
Y2FuCj4gZm9sbG93IHRoZSBleGFtcGxlIG9mIGBCb290ZXJGaXJtd2FyZWAsIHdoaWNoIGlzIHF1
aXRlIHNpbWlsYXIgKG9ubHkgYQo+IGJpdCBtb3JlIGNvbXBsZXgpLgoKU29ycnksIEknbSBhIGJp
dCBjb25mdXNlZC4gIFdoYXQncyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIEdlbkJvb3Rsb2FkZXIg
YW5kIEdlbmVyaWNCb290bG9hZGVyPyAKQ2FuJ3QgSSBqdXN0IGFkZCBhIG5ldygpIGNvbnN0cnVj
dG9yIHRvIEdlbmVyaWNCb290bG9hZGVyPwoK
