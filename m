Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12151199949
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 06:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780123782; cv=pass; b=ZKeef7UZIxlWMRyVOMWcV0qJe5jgk3yddLlNO1s9ldyOgyqji5xq8ICeQh/MUQHwBrIklbEI7yV8GOC5qJu69Gbgg09RxcpFpe8V6pjHsP0iWvVlJ0M9bRbyTGBEWoreHMmTEyHrS4Dz8lLegGIcX/8G7t4aFf4AL1PACVqz84w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780123782; c=relaxed/simple;
	bh=+bv70p8W2trpBn+eIa8q9/v0zYxELzQYi+51Y29g134=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzvMsq0ROeIOchBxn0vFGTlfDfaWbni0jCR387IlnI9IvWs9GW1JtgQOf1Sy1pJkofcVeNMOvqs0e4pw3bdedjAR1x+b63c+MWg4VfCSSWQCp4JI/fpMu90GTKtUhB1Hh8YqjwaMCtNPbTcGqMphbFUheWr76M/QXnCzof8drsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEs/6Os/; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEs/6Os/"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12db2e9b3bcso529383c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 23:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780123780; cv=none;
        d=google.com; s=arc-20240605;
        b=RkJT4Y3DCyW3MA2kPmfiYIvW7NXVTrvqZPZNO+OjfGZ6Mfb/XRBOFOHlSHokZEi8qO
         qfUeqX6DSG2lCEzo0nTD+AQfyFj6CmsKFKcrqy1gI1YjlGA34SrNvkNPxFHJz3Aii6aW
         5wrGzMFXsrq6yAJ8MzgUQSprGUyQxak9HB9+N67b2mVLJqE4wKol8Xr/L4YKVwQWtIo4
         E4GqJZxQC6zNvgiKMp2bOMomfQ7zFu+JlrRBNMcggVD0MlcSO61lr1jx5R4DsYrhAJGh
         jIBgrEXtSRAmtO4btWrjsinDSCMVDmfqS6Oh6tE0JtRKxa2MHFGh/NMpCixiQv6bBqb7
         hh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+bv70p8W2trpBn+eIa8q9/v0zYxELzQYi+51Y29g134=;
        fh=0B0MEkxPE9j7O/fkuBR4en8Gt9cT32QUZ2F2kjkmofo=;
        b=hDm967jf7KAMAvnITQ3laRMh1ACCuzaZJ+D7C5MsLtRwVM+7F0aXfz+9xa/A50lTnx
         KsYaqabhD0j95il0fIOA+zp1M0W+tc/BUb8kdmS4Mb0h6i2CEbJbV9bM94Z1r1dtkYtm
         Z+U8RazANNaORk0Ame24DqbyAgZRMAdg1fn4fMMn6m1U+/IDmfIU3PNLMIIIhA0nJTwb
         V2+CK32JHMohmKDAGguTpGH0fARUhwb33jSsKym5sSObCDDzKbfvq6hX+a3WR/ldWecL
         WdbwsGyxMuACmXMZNap4+35MeWHbNHFw/6NmptdzH+rd90LQ+sWEOYglAJG7J0ObDa4G
         4eeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780123780; x=1780728580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bv70p8W2trpBn+eIa8q9/v0zYxELzQYi+51Y29g134=;
        b=pEs/6Os/go0lTdevvQXdDRRMN3OLPUhu1XAjq1gAxzq1DWFiwSlIaRcr0+ZSy6kbIG
         gjWWpy8VhGhJYPuPhhZ1VqTuIdynYLu3t4RwoMZ8fl6UImROujqlt8EwyQMUSlp6Q6Dy
         IvqvSOxpLMzxWUBcUZKuU7IQQl8CoC7s645JeXalgDkqnGkpCvEfObn23pedy0xtRLam
         VbNjWfj3Fy20mDquNNnqhzGhvf9S3SBfB6BuSj/R/NDrdht9c96rz45VuCZLOHYvFAcS
         4hqDqnhQXTEE4j/Ho4K6CmI9Ync6S9EUpGZnsTS1brwOGcP53zpwA1DddpdpO6hlvwhZ
         i6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780123780; x=1780728580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+bv70p8W2trpBn+eIa8q9/v0zYxELzQYi+51Y29g134=;
        b=qchzIEE7n7mu+HRwKQP+BFtSfJq2j1NJJvq71cEt4V6dDREX1UzTPHhQsO3XPiyEFc
         E/QyLhdVkVbhyGCUXV+TYngBhEf+4J2RuzWjJBu67M6JU/jTK69w0gWiiaUXDQkWdctD
         iqVRIY+SclVRvceM/nFw6EjCO82BaKg+D4KbdtxvcMo9ukHD59ZY8wKlJobctLAJwC/r
         LJ0klca0Ex8OpX0zqkGeTCma9GdiAxAvVir4QWwTpwk70FTzOJ6tFvM6JYpGFhXxCVvD
         ck1iTWnlZAd52Sz2ogG1iUoXMaMAJDAdZo7U4eJt9riHy+mb1H+5KNh3eNs5oOiJ5Fuc
         nCRw==
X-Forwarded-Encrypted: i=1; AFNElJ+aK5QReMInA+vRYX8LmjAcXEdc2Ob412k3GljdKH54KA2E1SJaTN3GcZEp6ETSALLuCOPZnyEPjqqpvOcU0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv39FSvafJ2mFKx9ne3uo4JVl944ToH9NIJZ1PHJwspM2GiW25
	JnVIZUQRyJEeRLP6bG17HQP/cItiIsYiDhkJX8KIijdNl1M8+wD+FOK2nxv/WiL9j055moYgQOj
	Gso3XMPQ68FnYZ/2H+yG+eq+cHANvwQ0=
X-Gm-Gg: Acq92OGY9gWWvzWJnYpIudjQHAeOXsQgRRf8jX+QF6Fh/vcUVG+/Mp6FuM9l4CCGE3e
	CXmEhyrj/RizgBiwz7FZgPKUN90iQgkIMbiCBdK4IPBkmxmSwgPIJnLJ390Nj5G9yHXDZ/YwqlF
	Oe3mSOofSo3ebj4YKuAvhQuc4jwxGyYtXdpZmB1HAS2wPMxL3wphAKT2/MPNhIHNr7lUxF/0F/t
	8cBMJzJ0FPFfwcPBN8QoxvqOCV/InRuzmtt0CrUsR8+68H6EfMb4gBZFNZqogr5375KZKb76Qc3
	RKBDgngntQxU3is+9aOLchfRprVu0jhJrIJUED27pUeW///4yprNIZFh/0EBTZ0NAhdvE0Euisx
	bkc0Zd71zK1IHivi3i7bwZ2JanDnrFoah12M0ODPc+qOr
X-Received: by 2002:a05:7300:d508:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-304fa30cb81mr629509eec.0.1780123780048; Fri, 29 May 2026
 23:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b70aff9a920cc42110fe5cf454c3099561863519.1780063368.git.royenheart@gmail.com>
In-Reply-To: <b70aff9a920cc42110fe5cf454c3099561863519.1780063368.git.royenheart@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 08:49:27 +0200
X-Gm-Features: AVHnY4JaMKnB48pjUgiM-xBbzD76l6HeLJAfe-AlXb9vBmBPIAHovEQxKsA26aU
Message-ID: <CANiq72=cjwQfkdHs04naLLAo6=O3XCA3eON_gfq4OEqd9Bn1Tg@mail.gmail.com>
Subject: Re: [PATCH rust-fixes v3 1/1] rust: block: fix GenDisk cleanup paths
To: Ren Wei <n05ec@lzu.edu.cn>
Cc: linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, axboe@kernel.dk, tamird@kernel.org, 
	sunke@kylinos.cn, yuantan098@gmail.com, bird@lzu.edu.cn, royenheart@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 8:12=E2=80=AFAM Ren Wei <n05ec@lzu.edu.cn> wrote:
>
> [PATCH rust-fixes v3 1/1] rust: block: fix GenDisk cleanup paths

I think block prefers to take these, but please let me know otherwise.

Cheers,
Miguel
