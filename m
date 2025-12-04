Received: from mail-edgeMUC218.fraunhofer.de (mail-edgemuc218.fraunhofer.de [192.102.154.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A106426561D
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.102.154.218
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859689; cv=fail; b=SRcflpGbjvx41PPoxP1ak0WAnXXP15wSZpgJOOOBftiD5Ahc5UuJPCNu6wsd0jFrZ3mcS3OQca+4V6KoEAFsGoNbI/9mpocXNgNI3+HRVPsxPZ00BUFs4d34goS759KOyl3AxZQ7me0Yy6XPHVd8W3bno4y5jE5FRjaoln1URJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859689; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G5+DNBJ09rK1D6Ndxt7moYd872I4dNTplSFQYx/XQsBetkYYk7dYOwgcVIxbwWW3ItCyS5Lq3n/rgIxUNlsRFIIUYd9IS+79Pn4/X7h1slLj3wvOUfxlszIsek/J+nR9oG2lo5EtWEU7XgpXOWbfs/slTJiDWbFCQ40rlhvEebc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=MQEZqir7; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=ipSVVWJp; arc=fail smtp.client-ip=192.102.154.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="MQEZqir7";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="ipSVVWJp"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764859687; x=1796395687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=MQEZqir7aSZhuMfUIbIRIdD3e9xnuZfScHU/vgJFNij0wlGXRmrP73W+
   9HkmfGmXDn1scA0ExMjssoHxE9eBb9t6OKFS4PCRQooU5MvQLdtTefAsG
   5kWZBqEs2Up5hr3rj/6UsYjXihNSZ2Vm6etF6ZsYwtNzwZwskwB67jxAf
   0u4uAKYTI4kOQFLUIx6TA4O0ZnfbYlUskYY1fWID/9RnM6/NM/X3frlOL
   H+efIcEa/I7btLwPq+QjmDvPkIQYZW36HEcW9ZwQJXT8VEJo+SBr1edTC
   64V6UbJaGCuhTNE5MZui8S5ji+DlLX55Zs9koOPFwFFpbRXDFtUXSpKQa
   Q==;
X-CSE-ConnectionGUID: ud+P57UcQuyFhSuZ8YVlqw==
X-CSE-MsgGUID: F3DMnMu5QxyBn+9wErEXdg==
Authentication-Results: mail-edgeMUC218.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2H9BABMVK1o/xoBYJlahRxAAYIlsziCUANXDwEBAQEBA?=
 =?us-ascii?q?QEBAQgBUQQBAQMEhQACjCcnOBMBAQEBAwEBAQEBAgUBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEdAjVWBjIBDQEBN?=
 =?us-ascii?q?wEPC0YxJQYOBYMCgiUEEgM1u1aBAYIMAQEG2ykYY4FkCQkBgT+DfIFwgmQBh?=
 =?us-ascii?q?HxwhHc2gVVEgUqCRDE+hFg4hXeDPJpdSAp4HANZLAFVEw0KCwcFgSBDAzUMC?=
 =?us-ascii?q?y4VI0sFLR2BJ3mEFYQfK0+CG3KBdUEZP4NTHgZrDwaBFRlJAgICBQJDPoFxB?=
 =?us-ascii?q?h4GHxICAwECAoEQEAJuQAMLGA1IESw3FBtEbgeTd512Aa9rNAeCOIFngV4GD?=
 =?us-ascii?q?J9nGjODcQGTbpMLmQapFgIEAgQFAhAIgX+BfzMaJIM2UhkPkiG6MXcCOgIHC?=
 =?us-ascii?q?wEBAwmSHoFLAQE?=
IronPort-PHdr: A9a23:S4ZNERynTKitiFbXCzLHzlBlVkEcU1XcAAcZ59Idhq5Udez7ptK+Z
 xeZva4m1QCVAN6TwskHotSVmpioYXYH75eFvSJKW713fDhBpOMo2icNO4q7M3D9N+PgdCcgH
 c5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTezb75+N
 gm6oAveusULg4ZvJaY8xxXUqXZUZupawn9lKl2Ukxvg/Mm74YRt8z5Xu/Iv9s5AVbv1cqElR
 rFGDzooLn446tTzuRfMVQWA6WIQX3sZnBRVGwTK4w30UZn3sivhq+pywzKaMtHsTbA1Qjut8
 aFmQwL1hSgdNj459GbXitFsjK9evRmsqQBzz5LSbYqIMvd1Y6HTcs4ARWdZXshfSTJMDJ6yY
 YUMCOQOP+hYoYbhqFQBtha+GQqhCfnzxjJSmnP6was32PkhHwHc2wwgGsoDvWjSrNroLqcdT
 /q6zLLVxjvGaPNWwyzy45XPfx87p/GDQKhwftTLxkk0DQ/FjVKQqZb+MD6OzOsNsnOb4PR8W
 u61hW4nsRt+oiWpxscsjYnJiJwaykre+Spk3ok4PNu1Q1N0btC4CpVfrT2aN5doTcM4RWFlo
 Do2x70CtJOnYCQG1pspyR7CZ/GbbYWF4xHuWeWfLzp5mH9pZb2xiRaz/EauzuDyWMa63EhOo
 yZYktTAqm4A2gHV58OaSfV95l+s1SuP2g3d8O1JJUE5mbDGJ5I73LI9l4IfvVrCEyPqlkj7i
 bKaelk+9eWp7unoeajqqoOZOoJ7hAzzN6Ejl8y5DO8lKAYBRXKb9v651LD7+E35R6hFgeMun
 6nCtZDaOdwbpqmkAw9Jyooj6wiwDzOh0NkAmHkINlNFeBaeg4jsJ1HBOvX2AOuhj1mtijtry
 erGMaf8ApXLLnjDl7nhcqhn60JG1QU808hT55NSCr4fPPL+QlL9udzWAxMjNwG5wvzrBMhn2
 o8AWG+DGqqZP7nTsV+M6OIvOe6MZIoNtTnnLfgq+uTugmEjll8GZ6Wp3pwXaGqjEfl9OUqZY
 GHsjckdHmsQsAo+VvbliECEUT5TYHayUbwz5ishBI27E4jPXpqtj6CZ3CenAp1WYXhLCkqRE
 Xfza4WIQvkMaCWIIsN4ljwEVL6hS5Iu1By1qg/6xKRoLvDO9i0bq53jzt516PPXlR0o8jx0F
 cud33mXT25ohmMIWyM23KdnrE18zVeD16d4j+ZcFdxS/P5JSQY6NZDdz+xkFd/+QB7OftCMS
 Fq+WNWpHSkxTs4tw98Je0t9Bc6tgQrY0CqpGbAYjKeLBIEv8q3CxXT+O8d8x27c1KY9l1kmX
 tdPNWq+i65k7QfTAo/Jk1mel6aua6QTxijN+3mFzWeVs0FYVwlwUarBXX8BfEfZsdP55kbaQ
 7+0FbsnKhdBydKFKqZSdt3pglFGRfj4NdTaYmKxnXqwBQqSxrOLaorqemoc0D/AB0caiwwT5
 2qJNRAiBie9pGLTFCZuFVX0bEPs6uR+q220TlUyzw6Ua01tzb21+gQahfCEUfMcwqoEuDs9q
 zVzBFu9xNLWC8eaqAphZ6hcYs0y4E1B1W3HswxxJJugL7pthlIGaQR4o1vu1wlrCoVHicUro
 3AnwQtpJKKbzlxBbTWY0o70OrHNLWny5h+vOObq3QSK3NuI/LoL7Lc0pl/+s0ezF1Ql6HRh2
 J9e1H605ZjQCgcWF5XrXRBk2QJ9ouTzZCUn6orPnV5rK6P85jbE18gkDfBjyRG6df9WMbiJH
 0n8CcQHAcipJuEw3VSkOEFXdNtO/bI5apv1P8CN37Smab4IdE+OkzEes8h0h1iX/m9nSueSg
 shWi/rNxAaDXifxgBC7v8T+iY1INlRwVmbqxzLtGYhRYaN/Z8AMD2KvKNew3dJwm9jmXHsLv
 EX2HF4C1cS1fgDIKlLn1BBW1UMZrGbini29zjdulCouoLba1yvLkIGAPBpSFHRMQTtOhEvhc
 7OphdIXV1T6SgUyjxKq6APb6/pwo6JjIm/PBHtZZyWkCkBHf+6Ou6CZYslJuqNtlB4SffS3Y
 VmcRbO4mBYc3y75Nkd1xD0wdGLP2N3zn0lArEeHLWtYpXbCf+Ns6i7uyYf8V8MAwCA2fzdmr
 xKPLUO8AsCo8/eSnJvc57PbNSqrA5xLShfV8qGYtDKy9UQ2Ax6Nlfyz2dS5SjUiwSnF7+tFD
 XvY/BHQIdW15uOQKfl2fVdaCm7V1fFBJpt/oIconIEy11MZoIm+wUIcwD/PL8oD163MSEpVG
 WEmmNfcuALY/Fw8CkKH497TezKz+MtfYYKgPF8ugxtl7J9gUYyG7KVCoAl5qECf8xrrS9olx
 TdD6/chy14Y2OEgtjEv7x6xGrIyJkVpEW/Ctjuw0oXt5LUSZXyod6C3zlY7h926EbWe9xlVQ
 22qEn9DNSp578E6PV7D3VjOwdu9KJ/ed9sOsB2TnRrayeRYe9o9lfsP0DJuInm1/WYkxOgyk
 QF00NmksZKGJWRg8OPxAhNROjDvIcJG0j/3hLtYnsGY0prpGZNkGz4RW4DvQ+7uGzUX3ck=
X-Talos-CUID: 9a23:SJvo9WOHR1zdse5DRSUkzBNLJ8scb2zzzEzNER+JN2JwV+jA
X-Talos-MUID: 9a23:McNOVAWKrrUVnpjq/BG3qBRkEdo12rS/IkZOwIoroeS0OSMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="14662572"
Received: from mail-mtaka26.fraunhofer.de ([153.96.1.26])
  by mail-edgeMUC218.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:47:58 +0100
X-CSE-ConnectionGUID: M022heJ2Ta6jXs/aFsWnLA==
X-CSE-MsgGUID: EAD3A9hKQKa00OMTPQBqCg==
IronPort-SDR: 69319f1d_oJWEweyLlcSp4vPS9dFuDeEVScdfPbopAlEeDNXAOa/PPlT
 UgNILpSoCF8q2VJm2rN7rQhgZwb6cTo8IcZwDRA==
X-IPAS-Result: =?us-ascii?q?A0DuBQAWnjFp/3+zYZlagS6BK4FuUkABgSYuW4ghAQGFL?=
 =?us-ascii?q?KVrglADVw8BAwEBAQEBCAFRBAEBhQcCjGcnNwYOAQIBAQIBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEBBgWBDhOGTw2GWwIBAxIgAQ0BATcBDwtGMSUGD?=
 =?us-ascii?q?gUigmCCJQQSAzYCAgKmJwGBQAKMV4EBggwBAQYEBNskGGOBZAkJAYFBg3yBc?=
 =?us-ascii?q?oJlAYR9cYR4NoFVRIFKgkQxPoUQhXeDNJlZSAp4HANZLAFVEw0KCwcFgSBDA?=
 =?us-ascii?q?zUMCyoVI0sFLR2BIyEdFxNgPRdAg0kYBmcPBoERGUkCAgIFAkA6gWYGHAYcE?=
 =?us-ascii?q?gIDAQICOlUMgXcCAgSCFX2CCg+IAoEIBS57JwMLGA1IESw3FBtEbgeUHU+ce?=
 =?us-ascii?q?gGvazQHgjiBZ4FeBgyfZxozg3EBk26TC5kGqRUCBAIEBQIQAQEGgX4mgVkzG?=
 =?us-ascii?q?iSDNk8DGQ+SIbxeRDMCOgIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:W0z8qRTS/EkG2aYkK1njNA8veNpsovKeAWYlg6HP9ppQJ/3wt523J
 lfWoO5thQWUA9aT4Kdehu7fo63sHnYN5Z+RvXxRFf4EW0oLk8wLmQwnDsOfT0r9Kf/hdSshG
 8peElRi+iLzKh1OFcLzbEHVuCf34yQbBxP/MgR4PKHyHIvThN6wzOe859jYZAAb4Vj1YeZcN
 hKz/ynYqsREupZoKKs61knsr2BTcutbgEJEd3mUmQrx4Nv1wI97/nZ1mtcMsvBNS777eKJqf
 fl9N3ELI2s17cvkuFz4QA2D62E1fk4WnxFLUG2npBv6C63VlzH7q8F01DKcH9HZdIEZAhSw0
 vZ1Ui/TljkhHGYS62Hqk81+rqRQrA309Hkdi4SBYZmuCsRBXLvdZNoKbDZDXfRbWywCC93nU
 pMfCdQ5D8kA8ZmtoHdN8UWPQiO0H/Ls1A1Gt1bI5pYGyeUTHRnezC4uNNEorF/olM6kbJsMT
 ri7w5vs/W2fMN4N0D6l4rXsY08Fkf+oAZhdNuTryXcpTBmbsm3JkNTmYBnM/fYNqm6mzeZqT
 8Xxk1QNiVkqomaNysgPqouShqsb8VLlzglhwqYOKeyUC2BaTuaZRcgYp2SbLYxwWsQ4XyRyt
 T0nzqFToZegZ3tiIPUPwhfeb7mCb4Gry0i9EuiLKCp+hHVrdaj5ixvhuUSjy+ipTsCvyx4Kt
 StKlNDQq2oAnwLe8MmJS/Zxvw+h1D+D2hqV67RsL1o9iKzbLJAs2Pg3kJ8Sul7EBSj4hAP9i
 6r+Sw==
IronPort-Data: A9a23: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
 t0WgLcKUk0RhQh5TCg=
IronPort-HdrOrdr: A9a23:3svlGq73FpyCJ9nCmgPXwMPXdLJyesId70hD6qkXc20xTiX4rb
 HNoB1173DJYVwqMk3I9ervBEDiexPhHOBOkO8s1N6ZNWGM1QeVxepZjLcKrQeQfBEWjtQttp
 uIHpIObOHNMQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AyYSwKGpeLeO28pOzO/TQWr/mUeV9KCfdwVWKH0b?=
 =?us-ascii?q?mC1ZyD7S7UmCW3Ioxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AVKG4tQ8Rp0g313YXjF0IC7GQf+pBz/+HWUAuqLY?=
 =?us-ascii?q?P45GjEBBIAh2EpzviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="34567501"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaKA26.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:47:56 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:47:54 +0100
Received: from BEUP281CU002.outbound.protection.outlook.com (40.93.77.5) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:47:54 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynK7NVmqET92Hg5tpf9YaJ4ntKJPvHtL/yOgtJeOXy5+K9hnYMQeeI4pn5FCLUdEEUhh7D63dkpFjYCcLZ2GuvX+CevpzfhsohLS2rkV1yMTt8y2I8tlfI9+qfAHKOHzdT03Pr0o1nW7jeek0/1la6vzutrnJPrLLyvmGNqBtT1xJR+oT/rQbXLQdu2d57aEzLNy6ZIq3gEF7KS2TTWXS+/eLoC92JhtdUrNNEkri/iRoo0wvDOS1NK464AHbB+EsAym5LHk24cnYJwb8mh53VNWaBCW63qh/gduQekex2CtZu0mpz3lfXGjbEpinicfOCyJ8muWIxU91BRNTZ9JgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=ZE9F1innOeY8QgGX8UBtk5j+BUeK3kcd+TicdDJiOl2R8D1a8vQyM/mWAFXZBVrux0utI7EX3LRgHuyfzZZduKRIJrO0V0Q01yYJgxh87/Z/SIJ6QmadMfATJf/vQC620Y+NWqmB6YPHDBOfacUoxctm3Qk5HWXQO0qX3LDM85kR+zfTeFB45jbFsRnj/ch4lLLNOuCSue7RQrVJ3xJIb0ReC1FA5c4igD3MxuVj6qjNg9QylCXIRgWFdqoAvku0OhqJ8bdzwfF56XEvxlUs6hXGTJp/aatnPgy7lb1DH31kAtBTB/YqYW72zUBbcpSTM50SVspSmZTOn06ETcqj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=ipSVVWJphqaxA4jkZbdh+a63UpxnVPZG06x8oD+46Y/BpsykvZfYAVSSTriZdppxJfCkNtCTPs90Tvw0fgZLX047E3aa0bULy7LXfL4BE/FRhVn3r6TP1Q0k7B1CzhqnUJdbrO6pRBJ03h6JdgKHj3hAfSjISDpjHSdYD+FIGPU=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 BE0P281MB0177.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Thu, 4 Dec 2025 14:47:53 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:47:53 +0000
From: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
To: <devnull+debug.rivosinc.com@kernel.org>
CC: <Liam.Howlett@oracle.com>, <a.hindborg@kernel.org>,
	<akpm@linux-foundation.org>, <alex.gaynor@gmail.com>,
	<alexghiti@rivosinc.com>, <aliceryhl@google.com>, <alistair.francis@wdc.com>,
	<andybnac@gmail.com>, <aou@eecs.berkeley.edu>, <arnd@arndb.de>,
	<atishp@rivosinc.com>, <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
	<bp@alien8.de>, <brauner@kernel.org>, <broonie@kernel.org>,
	<charlie@rivosinc.com>, <cleger@rivosinc.com>, <conor+dt@kernel.org>,
	<conor@kernel.org>, <corbet@lwn.net>, <dave.hansen@linux.intel.com>,
	<debug@rivosinc.com>, <devicetree@vger.kernel.org>, <ebiederm@xmission.com>,
	<evan@rivosinc.com>, <gary@garyguo.net>, <hpa@zytor.com>, <jannh@google.com>,
	<jim.shu@sifive.com>, <kees@kernel.org>, <kito.cheng@sifive.com>,
	<krzk+dt@kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<lorenzo.stoakes@oracle.com>, <lossin@kernel.org>, <mingo@redhat.com>,
	<ojeda@kernel.org>, <oleg@redhat.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <peterz@infradead.org>,
	<richard.henderson@linaro.org>, <rick.p.edgecombe@intel.com>,
	<robh@kernel.org>, <rust-for-linux@vger.kernel.org>,
	<samitolvanen@google.com>, <shuah@kernel.org>, <tglx@linutronix.de>,
	<tmgross@umich.edu>, <vbabka@suse.cz>, <x86@kernel.org>,
	<zong.li@sifive.com>, Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Subject: Re: [PATCH v23 12/28] riscv: Implements arch agnostic shadow stack prctls
Date: Thu,  4 Dec 2025 15:47:46 +0100
Message-ID: <20251204144746.11545-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-12-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-12-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0336.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::9) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|BE0P281MB0177:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc735ac-7bc7-4b1d-c5d7-08de33441acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iV7K3XZS/4EjEmGRcPbMsRbXm383JBmE5ERkIKiwHbVXKIZRj2jycndqtSpI?=
 =?us-ascii?Q?3Urtm+uEITqK3lUfkSPb+TOHmUfgRjz7NZMGcrxjYir2OKbyht30SHJjaRda?=
 =?us-ascii?Q?q374EnvsP+2T7lwHTR0N4nnqkiaIe/AeTcFOpfJSyR1yZ1kffPgcrSQRdaqG?=
 =?us-ascii?Q?Z3JRissfiKw6Z9/+pwtXPpb2FTdU8AMvu69E0/qTd4wifeQAJzcJGzbWK8pn?=
 =?us-ascii?Q?yP/lbt7dQvhzQSGuqMlOpT94j2INMyeKJaLBo40YmyABf7qHEK0fLkNrp4gc?=
 =?us-ascii?Q?7ajaA6Aj2y3fwwoOAjCXnqDU5bp2jEKG88/fR2LLbvThYchqsTV+m9T0qjrm?=
 =?us-ascii?Q?wbZpsFjQldz2Jh7e3YvJlvypMUibChF4x7kvllqjiZTrZyXV5z3j8X3H50n/?=
 =?us-ascii?Q?xl40AJ7akS0GN9VRbenAuVFvG3kfmyBAkXbasLj56a11+tYhzg5KChQnDVd1?=
 =?us-ascii?Q?P4tGBKhp95VWGK1g1D47DRxhYDNy6oIxJubwtt+SexLJICaxGf+tbR9kjzFw?=
 =?us-ascii?Q?MIYzoyF+KF7CAtOA/R/G4e8vLVH6aAs0urZ9x6EtnwUU7u56fekNtFEl31CU?=
 =?us-ascii?Q?XM06fSovwMdNtiGQLXniWmglEtI3XchA3r7N05xTDVUpIOFytfashdhGda3N?=
 =?us-ascii?Q?3x3+rbOHdNIyamkRAX4iaqK1av49Af9bQU8kgG0+gl4GbACYliMZdHyX29/s?=
 =?us-ascii?Q?mzl/55Rlbw8mH9+VL6IQjOkKF0nbwd5ep+ohEAE4RnjPS3mBj6+wHaHmIxaD?=
 =?us-ascii?Q?10rW5QaY+enXnbFRyqVSERrLskwjHrcfioFUtODLbfsRiEK4F4iHPhNkTypa?=
 =?us-ascii?Q?4U9QWWYGHraj5Yzu9FGnHYongreGpuvzKpcG7+cHhAP4KMKOfCKXolAXwSAU?=
 =?us-ascii?Q?GLAg3kcqjh/NS8/sPEkqVlHi16nuGfgQYokDYZZ1GVB02wmOOMLwXNd8d5Jo?=
 =?us-ascii?Q?P6GHCqw05Q7PL2SXcrFsRpylbKqGsPyiTEnGUTMTjZA3d0vx8hSIWdQYQ2EL?=
 =?us-ascii?Q?jJiw1wmE+GXtAEZrilpEfHL0ghYp/Tyw6dkW7HPHJlPRrtizMYNnfY3uFaV/?=
 =?us-ascii?Q?B0/lEIs5f2oW9PcL6fQ4QP3fPrypHjzVkcPPK4I5ih1YtVZBpJcoErYoTxd/?=
 =?us-ascii?Q?HE3z/B/ZakaE1mopfT8fdZzH6Cqf7/47c0cvUzw9EVy/rxl4e7q3Xz8sO6UH?=
 =?us-ascii?Q?Im14DplIi40xpFccAhNjFtdd2FjgQ7OI11aIfeicCXvtHiAlj4zQ3fP72f78?=
 =?us-ascii?Q?T3IhyyLz+d8SebDHe+YhQ+XQkwb7ZwGg8rpCdJdPQzVDVSV3+X8XthmkJk1l?=
 =?us-ascii?Q?Zri5p+nFTQpWxx4d8mTJKAZ0cXcN1ti+q/uFeU6KbmVHdvLzCCe/BeBYnDjc?=
 =?us-ascii?Q?yKxJ463mdxAVECZtLd4p59cOpos9QM5tj2Ylwky1DPVt8/lLjlJ8p725onVJ?=
 =?us-ascii?Q?miPNps2SE3o0bYvGkHY7IAr2ha4UyrUN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?udOS13GTWICd+L/62HgLl46/GrChPgF/cDDB2A9Cvu9O/ZMldfZsfsZmL3fm?=
 =?us-ascii?Q?7S3EYBBqTATHU6hG1+aWqrVEUZWCNdXYTOxkZ+0oQWcP5Hi7AvEi1QIwSVap?=
 =?us-ascii?Q?wbdmX6LKJOF1Cv9UI3y3fbsvc/QKqhTUTKXZS3el3bcHig/e4a+UHVn5o/XF?=
 =?us-ascii?Q?rkmigM2BpDlJqSf6QIzxMHKEhPJZE8BkZ7t8QRn3+EQZXSlQTzQUPKJqaiMj?=
 =?us-ascii?Q?UyOzeu6WctSQz1zf/bFmeVyx4ceNa4d87iotfunCQ/7eme71q+mpu7Ql0HRq?=
 =?us-ascii?Q?QyNRXNHNBy67Krz2IDn4NV+wQN75170HF4wxVt2s8PAu3lF1om1qpd8EgUsH?=
 =?us-ascii?Q?XUxy+WL2CpHLwkd9SpONddluh7inU8tB+qJbeNiwxENznejZ7wvAZiSP1d56?=
 =?us-ascii?Q?cTDVlvPnw213fRtd9nxQ5FXdNPabPoxSTUUnD394Fj0yea+X/LpJaquEVm4x?=
 =?us-ascii?Q?9OHUkcdBqDzS1VZSvrTx+ADITn+IAkLD5TdlWYYr5CXR5IynPhfLwq0vIPI+?=
 =?us-ascii?Q?dEZUZMHpHXUb6SgVx2aAoMS6/Pi32rHWPAB2i8Q3y06w+Z1UclOUA1StcnHZ?=
 =?us-ascii?Q?LdUr3YO8/FCAcP+N8hR5Yhau5C5EQgjvBpz/BJE88IpVGOzOQhBLc8R46fBr?=
 =?us-ascii?Q?upeKOUAsQSdpdSLD6uD2XlvYGGZFAs77YC925Ps2OCswNoDsmWDTSkE64ljw?=
 =?us-ascii?Q?AKbK+NhwCn8rsDQi6c8kEw1gMin1ZGbNLowURUzQxRCKgaz2SkIETnzZ6tnX?=
 =?us-ascii?Q?gIC1r4PzKozig9cZ2/7qSo1POIbloo5WGt0tllbn+RLMXb44ZClk6T25tn2Y?=
 =?us-ascii?Q?s+TDQCCxZusz/22pSZKSAxbONUFuRWVro+gioL00ERQjpEFueEIY1kXdeOv4?=
 =?us-ascii?Q?hxT3tRpHZRFl+prrjXUIdFQ3bN1/AxJ1dFoBJ0xu3AnN9uctGStB3ry+5hLU?=
 =?us-ascii?Q?UDuYqeHWKeVBC2JHpnW3YfddcvmMthn/72TOKzhLpYCYds75cDQUxtNTGw7S?=
 =?us-ascii?Q?BXaHzmfh+DSTHexZdTe6gjiIEQQ+aoWeOQQBHeJiSB6y5YUBFco4Ecd5ws3T?=
 =?us-ascii?Q?tvQ1tliYx3fEI8JXnwct2+bPxWdAhRWT9ozvzHlbKXvqS23DfqFTO1qAu1GW?=
 =?us-ascii?Q?o+BiSt5QL6tQa+dp6XjdUej1UUdqaVbF6fDZi+IZi28U5mfcWYBhqYjhlBQ/?=
 =?us-ascii?Q?pApH/xntXtGweCVo3NCc4tETreTuR0qfMfR/GzqggJpaJykRs/6k1/zYvW/L?=
 =?us-ascii?Q?py+E/FZSwEoY3FdPGOatgtK5H7dOnON3mbW997o02ckzzbOVsvhwL6R6WDxM?=
 =?us-ascii?Q?sZVBMnvPPRPjIYT2YkudwqHYqsAoDgE6Im75KBPLfBAvlfehXsqW0w07s0BK?=
 =?us-ascii?Q?HzqayWn9UyZIyWawVoI2w5GoZ+YQQyqO+bC9pwmLykCjKt3Ai79D1hZPdxLX?=
 =?us-ascii?Q?lRHENIU8lw4kkJgCFHC5TYstYpl4qn6gjxkc/y1NRo1vB+Dc6s0t2gu93qPU?=
 =?us-ascii?Q?4pFIUiNKWQomusRfcJfJ8oV3LZ2GHGUKpdEOs1LMdLAneej6QvWj+JvIq6mI?=
 =?us-ascii?Q?fjz19v7YNJB4217LNlaYxo0EcFXTVS0l7UNjJo0JEkrsmOPYc9VtG1ACy5Bs?=
 =?us-ascii?Q?MRFplx8jzR3JyxL0W04gNC4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc735ac-7bc7-4b1d-c5d7-08de33441acb
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:47:53.4515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHn/xB/snc0YQRSS62c6TM+pE6E5v1R0ACV4F2TPxsX4/bcib+M7RajFaKoFNRTJ2NC6OmU39tjXBGs4mETc0PnD57aMb8I4SCUcx/SSWZ6NXhR4ABZPeDqGojE+c5tm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE0P281MB0177
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
