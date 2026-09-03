Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FCC494821
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Sep 2026 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442729; cv=none; b=D3aZOi2kE8SeEUyXSF1M7nPNvnVddMMJNZxnISBAhKHNLnpRDWmId9O9ccVoBt9vxZCn/G05L1sx/OIHIUdqVzznHcKxvWWOhoC/jyKb/pkcumm4x7SyVvy+yzvJ3MT5FdbM4Jqq08xjIJBesKrafNnlXafZ79BaTW0RHjpTiRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442729; c=relaxed/simple;
	bh=VAVlHTOVxilWHfpFu6TQCRWLzexz/v+YnuWfO3/oHRE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=IEfTb3cjbvqjbWZsrzz444AUkgXXceL1LQqKz0oAVgSqxFnCwNPdVNiBDHi30Ek3koznOJq+sbNjq/oWq8LJlqihWMJ2VN23QWKcXJxe7qwNWss/lYTwQMhwwUWISBtHcjLSTCTwDMJL/ZX3Y5YeiPKht5JArkQoCnw6GVEcr1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=fRKKxfeX; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=gkLjdiMA; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="fRKKxfeX";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="gkLjdiMA"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=fRKKxfeX6kFJq9VstugIX7HKNXJlPdJG8n1jR68yd2fsq18EFT4gmvm2YgDf2kpy7AsTc+drQz1LWpJ4RRqNwFOvaPfJmDvf6xdTggxm5AIDVLl72B19+pHkVjAGtMeNVsPWh+xjqKlz5u6uyzDE39RnQUYzwmckyByMg5K8RThALAIztJXWZmi8KKh69YJHIVb3eeEF5dHqowiDLT2SjdAyewFkZDHeAk4kMVqzGa7GbZ3NbZSC/zSDYWjcZwN15tcDN5EOrz/igdeN85B2QCBDjaPOIhPH5GQtbl/e8JOOtTDDsiUCV8/WAj7SessLY1xdIOkDNWT4ruaCoQXpCg==; s=purelymail3; d=rcpassos.me; v=1; bh=VAVlHTOVxilWHfpFu6TQCRWLzexz/v+YnuWfO3/oHRE=; h=Received:Date:Subject:From:To;
DKIM-Signature: a=rsa-sha256; b=gkLjdiMAZzd5lE4q2jQTd7ELQMar8bCmt8SRIkzkLFXaHYn9tMoDugfHB4C0nPc3asoE2OWMN79BuUkMYxv94NAktPuu+UpBH+6j6cPYJhC3Scp0RZRzMwvRW6qFa3w3P+VDyDYc0cQVoxjsRhkDjmJaZADAtGljQFHqqP8HspZwv1hcSdIZHilIa1h6RpVUubeISjfImvg67ctQihrFTHeS40TKU+KtwUFsFH3MQ85BS82uKC8rVRLTZ/+ec1MLZCAC3YrVfSE5okV8iCPBNagxX2esVudokDUY0E3orfEh25UaYFt7YvJsfKJv1AW+kADRrZJVRxC71/YWj8AFVQ==; s=purelymail3; d=purelymail.com; v=1; bh=VAVlHTOVxilWHfpFu6TQCRWLzexz/v+YnuWfO3/oHRE=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1103024855;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 03 Sep 2026 13:38:32 +0000 (UTC)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 10:40:39 -0300
Message-Id: <DL5Q2PYH8I9M.1H9OOPTEWGRVO@rcpassos.me>
Subject: Re: [PATCH v3] rust_binder: speed up get_node_debug_info using
 lower_bound iter
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, "Brigham Campbell"
 <me@brighamcampbell.com>, "Jori Koolstra" <jkoolstra@xs4all.nl>, "Rafael
 Passos" <rafael@rcpassos.me>
From: "Rafael Passos" <rafael@rcpassos.me>
To: <rust-for-linux@vger.kernel.org>, <aliceryhl@google.com>,
 <gregkh@linuxfoundation.org>, <arve@android.com>, <tkjos@android.com>,
 "Christian Brauner" <brauner@kernel.org>, <cmllamas@google.com>
X-Mailer: aerc 0.22.0
References: <20260814215145.2050599-1-rafael@rcpassos.me>
In-Reply-To: <20260814215145.2050599-1-rafael@rcpassos.me>

Hi!

I'm looking for feedback in this patch.
I believe this is a good time,
since the merge window was just closed.
Maybe this could be ready for 7.4 ?

Thanks,
Rafael Passos
