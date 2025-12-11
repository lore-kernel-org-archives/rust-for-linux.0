Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E212BE05A;
	Thu, 11 Dec 2025 15:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765466180; cv=none; b=NQXAb680h71WNQB4FF99pZWYBkVqmZUUHaOZugI+5tVhpJwadz37cWi5+lJcPqIsBUaB5llZ2U7xEghBmu09asSVaMh6LPQcUkm2gTMzKL1uiMtMj+N0lbX1ZY8b6LkYpjGF5DQG7YOy3f9vinEJWqo3FQpMADpPHvLuXOdqVAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765466180; c=relaxed/simple;
	bh=XzTJW1Ew6LUzT+m/cScD7hP3Uyd1WFWXXUKVzn1Lp8w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ZJI4GbCy/PVDbPL+FWIJLAlX/YXR1+jMRcFnP+XaO/wlZPpics5zOdkNQIII9Z8tYWsTiDNmlR5fIjDDq/uiQbmZApuXwJUOScLYEeUvWs/hphfZOTSNARpcmUjIEi+AnlCN56bxkQWxVy4IOAoioDN30tCNVs6cZGsYLkNq9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PYocYktF; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PYocYktF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1765466169; bh=JcvaEG9mG86lGsxTrim8B/LdshIs+NrEmIbS5l3P3GM=;
	h=From:To:Cc:Subject:Date;
	b=PYocYktFQGM+QOY5eP7IxilmAKQJnz5tWJV3rDv1im9Qaqs+kdgJ8NX3MnVudvSac
	 H9ZTa7Tnr8ChtseaPWDRi0wo1KrqremEf8OlISe+0c1AVL/axrY48g5XELcbAgTdDc
	 ijWwI8Rr8uClCiixI/f4eQvwaRM+CrlL9Xpy4luQ=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 407836DA; Thu, 11 Dec 2025 23:16:07 +0800
X-QQ-mid: xmsmtpt1765466167tv57b151b
Message-ID: <tencent_08D4DAD1AE568FC79EB11A8109D8926A2309@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNzn0o9QUd2+7+MBK9wrPXeetfGlkanA+N3td/ZhvaQO7H/czzSLym
	 hWx0D+uZ6tPzGb0CpmxIrkyfDyqP3d2iS8ZQ2vcRFcpeSh1yTyBBWoWYeiTco+mXUnRIQvX7Kna7
	 9OsCLxEsaqfPzZB5Ya5FbVVIH5TGA7tDNI06JWcZytdu2x+EOPZMon6076k6LrEecIx+crxcWhBY
	 hi0ACQ9Za7I1RwvmZkVTHww6nUSQ5uIsrpr0NKhzY42NT8aCzZZAomuqjIyqv1gbQdn9ZTxD8sPO
	 l8+mJgIH0kL+wyS4lzMYN3ef8k7nM2XpwO71+eP16i3YeobwBBt14xYF2arPOYEzfwUTqZS/QG1h
	 HcCFwTVoAodzSbxvvod/Tag87UyLd0jC9H1eShIEIeMxONZW7uW07Ys32iT+6SpHxL3lDnN4Cu0U
	 YJrzyGsbzzHKGRtnVvlCPhu7Y9qL4A51yR3x+dQI2IVQR3yLivxAgVeWwzSYaSROIbSbjRQrTZ2l
	 sA4gB7rhDzgDpOfz6VcAI21sHIPt7JhPcSu4WyfjuW9xl3XckQ/L59hV7QosXAocLmDiMRW3b5ym
	 Ya/TpdGmL6N1M0tIybEAeXJyVmHUz7+09HXMumTJ5+NtSrBmT7tKHx5aWvk9pbkRh+Sa9m1imqku
	 +yba55bQpj7QzQd8xDaV7W6q6/LvQp0r0jOLa6J3EITg59tp40FBk7Si9iFmFUln+MduBE3Pzim0
	 9llHlP6Q3M6g3lqa+2Nr1qQrXXSGB2Bpocv5u9FQYNa4m5UF5PsCeAk1hQ2F6Dja5nzEwWEM0jb4
	 z3b3DM1usVztPfY0WjZNPGcwF6h5kLOqW1YhlFhPIrnXAKA8Frh/mtwyRtYXWR8kKtPVYkymjilu
	 he5nl5OeYoO62Kbng1wlIyE1FH1hDb0+GH1U2GTeN9B223M7wPr3PhJ2a9WMu1jO9eEx36GxY8a7
	 Y+ADSylQqgpINos0eR/3sWpeqPtQEOHfR5TMSb4wigN04ZDr7/qu0SQlVqhI6MlXVxVY1UCl1+6i
	 oUS0VAjozMPYq3Sc0VAS7E9q9afJ4wphx7e3PA3jecO4oaeqv8UezZnySCQ4I8t6Czl4Oijw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: yilin <1479826151@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	yilin <1479826151@qq.com>
Subject: [PATCH 0/3] rust: documentation fixes and API consistency improvements
Date: Thu, 11 Dec 2025 23:15:53 +0800
X-OQ-MSGID: <20251211151553.2893838-1-1479826151@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes documentation issues and improves API naming
consistency in the Rust for Linux codebase:

- Patch 1/3 fixes an incorrect type in device_id safety documentation
- Patch 2/3 removes redundant safety documentation in the dma module
- Patch 3/3 renames cpumask methods to follow the constructor pattern

yilin (3):
  rust: device_id: replace possible incorrect word in safety document
  rust: dma: remove incorrect safety documentation
  rust: cpumask: rename methods of Cpumask for clarity and consistency

 rust/kernel/cpumask.rs   | 10 +++++-----
 rust/kernel/device_id.rs |  2 +-
 rust/kernel/dma.rs       |  2 --
 3 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.34.1

