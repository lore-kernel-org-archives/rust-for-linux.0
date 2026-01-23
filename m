Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B723A564
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769147202; cv=none; b=mCe5hT/erX1+Vw9nf7HNxi8s+ZexdcTnkNr6SLZa27tMxzI7mdqMd31k9F8wHTAaZpRTQt6ro+DzPEYOVhexmI/wYMP2VrF3zq/Pok8J9tnOvI5nrZKoeHDRAJLkHuhlTe20yPs/L7MCMAo0+EKxyvRE9O//+fMFXNNfXrZtGP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769147202; c=relaxed/simple;
	bh=sdJ1avY9psxoObHs7Jr8Zk7AULEg+hd6YihDSJqaWTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ln21Ft1xya88t3o7huUScxUV1phG0tsk3qLwQfgcrOBiceZinTJakvIupbPcInEIP2uJ0iQFIzjWv6WxOtqj0Km7WV+M9yqxJXOIviOEak5lczsV/+IuCLVJ4yGj64cn7sn0TJPYgIl/bsjCZNTdtGI6WN99aZOw44c0g2GSqqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsUbSkgv; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsUbSkgv"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-894676e6863so24292906d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 21:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769147195; x=1769751995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mlQ4EKsCIweB5taX2JNx5Y9XZH7llb+npb73F1QFPnA=;
        b=XsUbSkgvyTCUNAt+ULNL58zJl2rGYHeHJic+fbHicVlhGJgNRH4dBZ2lmdFkvn+7U5
         acLcf2ErY2vMnFIPF8iLxi0dQGAVoDUNUfV/CIqyAZuunqiW8nVyHyxx1SiBMvGvxTBX
         hEqnlT/RwIireLcEmKiJULVepuWw6nVQwduUmCTLKNVEF1eTajAvzTFrEkvg14oLq2d1
         oZeBsxhVfoSBAYBTFbke8JjEuvF+p1krhku+r73/N6bTivfcFhpN9daN3rerO3aQtrhO
         QJsW6C5ranHllQfBbRlwTnEDkCTKa3RzCcYjsDb5nR9BfXOz7FUW5HE1IchmAL5sjK8T
         c/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769147195; x=1769751995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlQ4EKsCIweB5taX2JNx5Y9XZH7llb+npb73F1QFPnA=;
        b=TnxkL33BfyHgA2LS8x2IXbw1xW7o0NmxSOWTQZUu04LJIXoHfFJ2XLg7Oteoi8Cuav
         I/n4UEc2zgksQhi5HK6gawem/B7xpd/x362vqOj+mhLoNI5qIMDS47oyDf0UCL6DA4+5
         9E26aNcUG6vujM0/26o7mZtYz5MxKXnrreBGNOFb1B5EJz4C2IuuQFuPKQLz8ASIaZWM
         uYef2Jn8hz1O7QWs/PUbbxJJUAYzRTuM1flltcHErRCiJg0AGr+ELuS2s/2fRx//Dxap
         PsbUtrResSsRCw9ya2Pgg8wy2rvRgSghMM/FGvvCsR7ZKDQJDbFpe186dRtsg+DPblY1
         ZC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+eDSs6sb/AcoTsUoNHWQhQYA+tQJNk/yZeF+qDImbl3a+nOOVf1Jn/XdDtDpgW8OCqdolU4zbgETlLFrckw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkgruNUU/pkZMpMICJRVLvk7prQHYADx9auudHFvIqo9Shim/X
	QGvD0g4xVG82Q/r0sOkRJmxji1TbT2+258+jZPC4oFi8q5OF8MLrZWMj5Bj+NQ==
X-Gm-Gg: AZuq6aLr1h3ufkzDgcr3Cylij+CbvAg/B4bwlwT2etjtSPbBx5graq4pwFhvI9jgR9P
	Py/Vyi0w5+c9vI2vwySpSCgfEAKKf/q4uScDfKmtG7mnzmVkYTaziy2U21FCuqqn5X0qcgRl+Bl
	DHDVQzrtqR8Ox2YkSviEfXAXr1eIPRtxTSQh/XLhvBr+Y8t3JUNA0+itZ5vzOwGdf2OD3du69L7
	/ue0YY+SIHECeL62It6h6aROCxBOIr349CaP4l0h4y7N2gFULbUgz/dfotnndfBnl/oAbVwEQJl
	2a1QTMxyg9vpi54GN4T7eMpHjCse+2PXR93su1ZtlidRu+mVs2lfLsFtp5v4PuXmPMnhhnxIJGg
	umSrOS/BwnsKi85VXTLfV18L2dtVpNyjWwCNRhpxfj/6rGpFzXRnZNmxeHImyLwrtknGrgMr64o
	NGxmYy/8SMCdTr9F0wbtVdg34fQa1eefXe5VWzMILYUDkeBlI0Uw6CtfbR4px8Kw0YPRRLeBbUx
	8yJaKoDRiA10mQ=
X-Received: by 2002:a05:6214:5297:b0:880:854:908f with SMTP id 6a1803df08f44-894902078a6mr29252006d6.38.1769147194538;
        Thu, 22 Jan 2026 21:46:34 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894919271ecsm10408636d6.41.2026.01.22.21.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 21:46:34 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 98553F40068;
	Fri, 23 Jan 2026 00:46:33 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 23 Jan 2026 00:46:33 -0500
X-ME-Sender: <xms:OQtzaZRBZXPxnAYhmWlPVRrSPasSU_cWN7gZbqBenWBkuJ_dua-j0w>
    <xme:OQtzaZSD5Uwe85NjAV7CNS3b-417y-OPSgxdw_ZBMhPWWmeoMe4kZ-gokFIukzZ4Q
    VwkRyifMshyJeXWNi1UutejOwiV2vslRxhNbNdOJ4No9R-xqBhpBBc>
X-ME-Received: <xmr:OQtzac0ISi_EwdGcZKs8E2AE4MNf1ao6w7P8IWcatFIsfK2vvP78UKTbcUKjPuIarEyALmqDHInbnkfBZl7FAfTK-6hnLUzr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeekvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefghfffvefhhfdvgfejgfekvdelgfekgeevueehlefhiedvgeffjefgteeugfeh
    ieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepthgrmhhirhgusehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhi
    esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
    nhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhosh
    hssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:OQtzaTw5FJdNCwyEnFPAorVzXiKEtH3QXkM_1Uv5rhJ4Yz_YVnsQcw>
    <xmx:OQtzaYwpRsTUIn35-z6m6YQJC5S5tFoRkXmWNE-FJvIF93qmUT9U-Q>
    <xmx:OQtzaf9rCe47M-HPMk-qIYtBarfzOygbMYxJ_o_ttwetwdZOH-IyWw>
    <xmx:OQtzaS9jlUm1HqRaR4W2Y5S3rLCSUtRhv7h5f8LTD6SUyCx-5JbCRw>
    <xmx:OQtzaX68i-1wfea7jcaWXPWcJbV0SAbYNtryMZ3wRu4x2CvlJNDnK3Rr>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jan 2026 00:46:33 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tamir Duberstein <tamird@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL][PATCH 0/1] Fixes for Rust synchronization PR of v7.0
Date: Thu, 22 Jan 2026 21:46:23 -0800
Message-ID: <20260123054624.8226-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aXAnTVnprfDnj7se@tardis-2.local>
References: <aXAnTVnprfDnj7se@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter,

Although we chatted about this over IRC, but I figured it might be
better for me to just send a fix PR for this, so here is it.

Thanks!

Regards,
Boqun

--------------------------------->8
The following changes since commit ccf9e070116a81d29aae30db501d562c8efd1ed8:

  rust: sync: Inline various lock related methods (2026-01-10 10:53:46 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sync-fixes-for-v7.0-pr

for you to fetch changes up to 6583920e15fc567109e1c64ca58c917f52f40736:

  rust: sync: Replace `kernel::c_str!` with C-Strings (2026-01-22 21:36:57 -0800)

----------------------------------------------------------------
Fixes for Rust sync v7.0 PR:

- Remove the usage of `c_str!()` in the example of static_lock_class!()
-----BEGIN PGP SIGNATURE-----

iQFJBAABCAAzFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmlzCUwVHGJvcXVuLmZl
bmdAZ21haWwuY29tAAoJEEl56MO1B/q43YYIAIkVv+YTbNpODC5Kfy2F0/XxeHoB
MbBSKvma6QR2m1Qx0c09o2NKcEU4ZnoPEi4WDhAs1ftfSyyc1CwE6gBApFirBvIu
VzAWcEKJkM16+IiWQDQKPbWssraNmKGw4zeZlXi6q+iry+2r+Hy+6JdikcgCshYn
+BYKjrkAh+mkXrQ1F95PfK0tfiT8fIbJCIeroPi9HlCmNlAYx0dP0i3YvF+5nWhB
a5rU4TmQDKmCXXwyIqVQeOkK4kMme6wPOOSxjd5g4W/srS9hcmM3mYAASl1omm2X
hr/9yyUOxSLUkG9e0x9XIhBkK4YwGS0dLIG6SQCvh//2vX9ek8BzBUvHzE0=
=xOu4
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Tamir Duberstein (1):
      rust: sync: Replace `kernel::c_str!` with C-Strings

 rust/kernel/sync.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)

