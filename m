Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181636;
	b=nMxuXlEQyVQifDFjb1XWGIqU4A0KD0Rvp3fXD1XD5xvUuC4SpEwWSLCJflJWqbe/YiLi
	 IG9QzQR/Z1Q1DvsO13o1LLXL9QbpqtQ0tx6U2DVyncPTeu+CWjuaWub/Z+3UcW35x/eSp
	 3m+shcpagZPf4Lb10HrwzfFV6QF3jfDdvtDDGOGAJnfZ+lzQqbT7n7h4A2UfnftB7J7zr
	 Ue7/qQVA36t214n8Z9k4TaiMek2HXF17abhy2PRDSjLitH09NocQQloLaw7F2DP+/GsI3
	 Nn6PG5VxUWqqxUjo7qzTkIEONvQS9jBCzsk2hm0XGgEBYzFf9brO3psJmSy5qCSIUTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181636;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Date:From:To:Subject:Cc:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=wfuirhHZZ9QJPRJWOnMGOzlKk4xOvsba562QNmUKtyM=;
	b=atTCHU7mKnMyChJagNc1H2uAvFpQF00p0ZZlK5GzxDO2Jx/Z4TJhnFkg+fE9PxTeCrsu
	 vp+9KUTGMiHcb/4apYWNwpt+x9zKZIH1fQNUpqCIRggqEJZsdc3FhOYGrVzy2Cy+9bWPT
	 1HGape3zVRdICcrhvvzYq3LIM06lugKkLFjMrV42PEe8PnurPeHyT+IJSAqTvuc6pjPho
	 VzRG1WT9jraVPGk321prC9M/w6x448zHBcT+S2jmgL3cpyi4Y3P2ktYS33Ro3veLRf+Jj
	 isO54bU0bwidaGLTspxsSev/IOpad7dhZm0V9cRtxCvp14GB4O+ouadCoStZOHeojbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=e16-tech.com;
	spf=pass smtp.mailfrom=e16-tech.com;
	arc=none smtp.remote-ip=115.124.28.41
Received: from out28-41.mail.aliyun.com (out28-41.mail.aliyun.com [115.124.28.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11314606A31C
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Nov 2026 23:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11314606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=e16-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=e16-tech.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.259314|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.00995101-0.000496226-0.989553;FP=15267286480424239006|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=wangyugui@e16-tech.com;NM=1;PH=DS;RN=2;RT=2;SR=0;TI=SMTPD_---.jzdCRGn_1794181624;
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com fp:SMTPD_---.jzdCRGn_1794181624 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 07:47:05 +0800
Date: Mon, 09 Nov 2026 07:47:06 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: rust-for-linux@vger.kernel.org
Subject: build error of rust ordered/unordered sections mismatch
Cc: wangyugui@e16-tech.com
Message-Id: <20261109074705.418E.409509F4@e16-tech.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.83.11 [en]

Hi,

When I build kernel 6.18.60 and 1.68.62(maybe more versions),  a build error
happended.

ld: __patchable_function_entries has both ordered [`__patchable_function_entries'
in rust/core.o] and unordered [`__patchable_function_entries' in
io_uring/fdinfo.o] sections

# rustc -V
rustc 1.92.0 (ded5c06cf 2025-12-08) (Red Hat 1.92.0-1.module+el8.10.0+40191+971f4d77)
# bindgen -V
bindgen 0.72.1
# gcc --version
gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-30)

But kernel 7.4.0-rc1 is built well on this server.

any advice please.

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2026/11/09


