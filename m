Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA0E3806B5
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289578; cv=none; b=XMFgze3MKpNpBF3VtAmcTiW6u9C5D7DnlUGHrqFg65zZAymFgqTn9Ux3d8frOvdwOiqODNXk2Cx2uURbXykVUN3h6o8vx0o7bTs0xUG3m4sxrG6fb3z5eNgrYsgzkrinAu8uSxLPukNdJCKpZbIbAVnzf9fEXLy4JmcFGkgTnBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289578; c=relaxed/simple;
	bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWxwdZ82Q0kobu8gLFqLOLgR2wEUSbZ2zeZCDloqIky/ZM2FkDuRJKhy2lPhI+tqMpPsjLkka9f+r+JJ4jCL0KA1pAD6OlTsV0Qb44yVlye8snhfpBXMLKnITBMPBa3sX+kjOuVx2gZj+W+2Z0ReKg2ip7nAGWD7MnYneCobd2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O4kzEA1J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O4kzEA1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781289575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
	b=O4kzEA1JXexFd925wbgThUORB6rn3h57Rr3WKFXYS+NItHJMN4FQCtLD68JHlCtxrwykWo
	guALX0BHOuE52BRpE0n8W92Mn0L+ceFiV6XD1qQec6N5h7qd0Vb5kqkYDVvHmIDF2YlA3L
	ydCN8l2d+8JQPWvJrYuueiJ0IERUv98=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-XP8n3o-aP3KYJkIxP99zog-1; Fri, 12 Jun 2026 14:39:32 -0400
X-MC-Unique: XP8n3o-aP3KYJkIxP99zog-1
X-Mimecast-MFC-AGG-ID: XP8n3o-aP3KYJkIxP99zog_1781289572
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915b3587972so126625985a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 11:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289572; x=1781894372;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
        b=diQSTDYFylEbPJ+OKMT3Mo+V2HUfjgc+nUS3xl8mwbJxLU+7uv5iihltZa6RvSA0ok
         R74VKztbjmt3FA2QVZQVOEBdsvnW0duglQ/Rlaq1on3XVf5e+a8n6da7fO2niFG0y1BK
         o3cnnOEd4D+fD0zbPwOeFDYnLWMWGqKwN3svHHltWlT/7kNEQkrDn9KtCkxJnvkU0T5d
         Skv+xtIU6U/32rZE9KICcmACLaDhPuz9PQCMfC+5RpSVG8WE71ubuOH9M5dqmPWgSz+C
         Wv+g5kAm+gFQMGnKifWduTXEzZ8ty58ZhgtaFZcAPRzSlepCslYEA+Ra5RgzlfROf/g4
         TGGA==
X-Forwarded-Encrypted: i=1; AFNElJ/WEeZ8oZNp1WOTKWXVgfYN3mMLu8bkJjR/lMv/zcd10sXGMWSA5aV+QusZN5QBH1Oomes84PsOi9G1QirlhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcq7x95geyqCZKEiZi20EjPYmDefLUdrJR0cyqsehI1JLnNlAK
	u4aqqZLa1ctjq34U56DjSYUbtYP9eE5Pv99DLxgeRtOqc4UCFZXlgh/hKzBvQWTrIlIf36bwcIt
	paiQGZfPnpeuLoMrGB6Hf/LAGCvdMYJuAcZv1ek910PqvJSDfzeWTbkQElPuBHgATmO2S
X-Gm-Gg: Acq92OGz2ZqQqyhvYIUtCC68M5K5uuC6b/LfbSSjimzjiNbr18fNT3Zw4SUX2Cue1V4
	FpdVmFuNbpP1d27TLq3PLdk4VhhL2h6ufQdXDxYUMMf48dc7SN+HOOnQ7xxLcBEAQj72pmBO8od
	+esXsMS/2kXoWUGKHH7cR3omIJj/FMilDwiUYOHFlHzFRz7FBy7wYj4AbTKjk3ke6LQatOXnAuk
	+bQ1MWmTpRJ8TPGxlWwROaDTQQT/fUiuFUHxgfTqXqfodQ1oLGlXPh7/0bqsPrltYqGch5nX5CE
	GpKaFKJuDBm2yXRTzediSOr8vuVRvyryeacLdpBugbkWK6I9kAQ+TpG0kFyx9u7y6DQGaA5tH6G
	9qqdCIFtqnEJqG3BV4g==
X-Received: by 2002:a05:620a:8012:b0:914:c032:5870 with SMTP id af79cd13be357-9161bd604f9mr617288685a.38.1781289571987;
        Fri, 12 Jun 2026 11:39:31 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:914:c032:5870 with SMTP id af79cd13be357-9161bd604f9mr617282985a.38.1781289571521;
        Fri, 12 Jun 2026 11:39:31 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a03d6fcsm272275585a.35.2026.06.12.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:39:30 -0700 (PDT)
Message-ID: <da0dd5cf287f8739d6b099646b3fb98153670f3b.camel@redhat.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v20 2/4] rust: drm: gem: shmem: Add
 vmap functions
From: lyude@redhat.com
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo	 <gary@garyguo.net>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, driver-core@lists.linux.dev, Miguel Ojeda	
 <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,  Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin
 <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org, Danilo Krummrich
 <dakr@kernel.org>,  Mukesh Kumar Chaurasiya	 <mkchauras@gmail.com>, Asahi
 Lina <lina+kernel@asahilina.net>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Fri, 12 Jun 2026 14:39:29 -0400
In-Reply-To: <airp4AHxiJKWn5tr@um790>
References: <20260610162433.923550-1-lyude@redhat.com>
	 <20260610162433.923550-3-lyude@redhat.com> <airp4AHxiJKWn5tr@um790>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WQZGYX9yde2lmhITGDGZvwjN1NQK_VjzI0VsVYZJVR4_1781289572
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-06-11 at 10:01 -0700, Deborah Brouwer wrote:
>=20
> Hi Lyude, i've got a clippy error here that "into_iter()" is
> redundant
> because it converts a Range<usize> into a Range<usize>.

Yep, that's completely correct! It looks like I was running my kunit
tests without WERROR and CLIPPY by mistake, which would explain how I
missed this :).

Will fix in the next respin in just a moment

