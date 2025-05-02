Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD1E256C88
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202452; cv=none; b=ABkOwR0GdcScRiPkOCvY8Go0H9/PtwV6oFz+s1zAMQjWx3mAFyttNa0ba/Kt71F99YKc6trck1ZZvNv1qDeRSQdteDC9O2GP/GsKmpzcWDfdD6XNYaaJAUph7SnSPmkCSRF1637uXd9/SsMSqw1Xww64TgXIIcBkeWSyMb+7CsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202452; c=relaxed/simple;
	bh=wd5NJqEBXG8kbhJKG845Wcw6QO3aud7KmNkF6CHiQYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CE6bw2hwzNmNX6VlteJYWOH6HnKCLx8kZjglc9SgOtOY4vB/9M/5lGDqIGzPXjuMRJ+v1KJc4HgVHnhrlzI4nd6cceSr48VW2m+fgjwa4QQQFExAmjJuh3EEhHpI/kGTNpt97/74tT7GT1mRBM4SmcdI5UIbwYz5ejhmG2Jgi8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UG/poEc7; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UG/poEc7"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f88f236167so11923a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 09:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746202449; x=1746807249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAKrz6MzSHZjea4snUZwUs0TMb2y7bZD+SefbW7WoH4=;
        b=UG/poEc7VXnK4E8VU/x7trErdjQmzw4EHm9g+EKjRjpL6MkynrEdycSdWh5zz72xy3
         qT6PlpU9IkGtLdupNSPHyNEgR8T/geqfOdGdfsV18dFv9tekq0kYWS4bae4oboIKyk2j
         Lxfjx5KMdicbaVprn3gSx58mmYKDI0VCWViN+ums9rJAnrW8WnaBgmKOo+3ypwfeVqLz
         xHkoObJhLKUV1xwic4BQComL/18+tYG3wQZ2gb18usrBPLEH5avJv4mMoZmKmkRXQrCI
         vCrEvIthr1DspzpChLSgZ+soQJUDpwVq5x5m1fimt/S6dKE04/Vl/oM7UoNlswzH5MFx
         yRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202449; x=1746807249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAKrz6MzSHZjea4snUZwUs0TMb2y7bZD+SefbW7WoH4=;
        b=CWztgvO8MoSW3CtsznMX8UoWAEgvyPv2BrS1EzqQN59fPY1boJs8f05YoaMffOhNBE
         F1zkk9XAXkkqH7ISRIG7KuvN8n8LDrckh0w+t6OyOrNM34FlcRJn4dLEb4Npyd8eIqJs
         B1dlvoSqTlx2V4EUXGTC/OAy81bI0vHGzM6aZxfhonX1IwnqZwXnhwFoaRIba/JzZNSC
         CFW/CAjYh8UgNHlL9bYS/d/fEquC3uEAqyiiVPuipKBHXD67i9g4YIm4vd4mijwHH2Pg
         YHFj4cp+VA6YJ3hvqGv3sS2YTcFl29rRWGYe+SwLA267aArSDMGpZ/NsROjAj45JkORO
         nL+w==
X-Forwarded-Encrypted: i=1; AJvYcCVihDh8fmh6fHewUW2gB2QTe2qiQ17QsQvyuM7mj2fdrnFZPeujFSr2j1BylPfgnQL2+3/72w6pbKy9M64LgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhKSIkbGnE42vfHtVrRCI50G9hyz6BTdwXjA/nntiyEOF0ZI+Y
	QIBj010D2QlztxHRCOfhG6u+oT/t1xNPW3pyUezlgvtdZGW7GbrgvJ9kdLaUOXKGOri/9cfS3ml
	RMJYZ9G5zddIJT97hjTLXXqPv8510C83YJW4V
X-Gm-Gg: ASbGncvlzQSPZGaGskGb7NqeEQPpEM0S1KMjD6h5tVcYypmG9eYko9hsmsMG7urrek+
	eH7TJgeFU1fAA2kVzDS+4Tsn3cPK6Q/s82R86rehdHkMQAjLmot6cwRq5bJIsgWjDKHcZKISV9m
	k/KED4ZXfiS1Uuaqlrwe0fXcelKpuG28yS1WzdBwyuQySJDsxHeLZ1/WUA5TJmCQ0=
X-Google-Smtp-Source: AGHT+IFi+7MV41xClVGr6/UvyV7JjW+2uR5FlCwcaTogmqu5ReKaulioApT3B8FXWgxBll8d1BEr3KWs6Fgt3fGw1R0=
X-Received: by 2002:aa7:d759:0:b0:5dc:5ae8:7e1 with SMTP id
 4fb4d7f45d1cf-5f9146f7d6dmr212014a12.6.1746202448549; Fri, 02 May 2025
 09:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-1-850869fab672@google.com> <aBRoNKjB063QhGZo@pollux>
 <2025050230-browsing-backstab-8de9@gregkh> <aBRutTMBtq-uCnii@pollux>
 <2025050205-reassign-entire-4078@gregkh> <aBR1O6d6YBszgVlU@pollux> <2025050208-jot-evolve-89b6@gregkh>
In-Reply-To: <2025050208-jot-evolve-89b6@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 2 May 2025 09:13:56 -0700
X-Gm-Features: ATxdqUEe1plSV-F0cIzBM7X6Aaw1uhdlDf1jIDZFSFwV4-fGyKmhMPdcOL53ieQ
Message-ID: <CAGSQo00GPnpkzY12udM8QNZpA+Nh+OrNJDH7zd1nVZPrQfOb4A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: debugfs: Bind DebugFS directory creation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 4:55=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 02, 2025 at 09:33:15AM +0200, Danilo Krummrich wrote:
> > On Fri, May 02, 2025 at 09:11:37AM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, May 02, 2025 at 09:05:25AM +0200, Danilo Krummrich wrote:
> > > > On Fri, May 02, 2025 at 09:00:07AM +0200, Greg Kroah-Hartman wrote:
> > > > > On Fri, May 02, 2025 at 08:37:40AM +0200, Danilo Krummrich wrote:
> > > > > > On Thu, May 01, 2025 at 10:47:41PM +0000, Matthew Maurer wrote:
> > > > > > > +/// Handle to a DebugFS directory that will stay alive after=
 leaving scope.
> > > > > > > +#[repr(transparent)]
> > > > > > > +pub struct SubDir(ManuallyDrop<Dir>);
> > > > > >
> > > > > > I think it's not very intuitive if the default is that a SubDir=
 still exists
> > > > > > after it has been dropped. I think your first approach being ex=
plicit about this
> > > > > > with keep() consuming the SubDir was much better; please keep t=
his approach.
> > > > >
> > > > > Wait, let's step back.  Why do we care about the difference betwe=
en a
> > > > > "subdir" and a "dir"?  They both are the same thing, and how do y=
ou
> > > > > describe a subdir of a subdir?  :)
> > > >
> > > > We care about the difference, because Dir originally had keep() whi=
ch drops the
> > > > Dir instance without actually removing it. For subdirs this is fine=
, since
> > > > they'll be cleaned up when the parent is removed.
> > >
> > > But does that mean a subdir can not be cleaned up without dropping th=
e
> > > parent first?  For many subsystems, they make a "root" debugfs
> > > directory, and then add/remove subdirs all the time within that.
> >
> > In the following I will call the first top level directory created by a=
 module /
> > driver "root".
> >
> > The logic I propose is that "root" is of type Dir, which means there is=
 no
> > keep() and if dropped the whole tree under root is removed.
> >
> > A subdir created under a Dir is of type SubDir and has the keep() metho=
d and if
> > called consumes the type instance and subsequently can only ever be rem=
oved by
> > dropping root.
> >
> > Alternatively a SubDir can be converted into a Dir, and hence don't has=
 keep()
> > anymore and if dropped will be removed.
> >
> > So, the result is that we still can add / remove subdirs as we want.
> >
> > The advantage is that we don't have keep() for root, which would be a d=
edicated
> > API for driver / modules to create bugs. If a driver / module would cal=
l keep()
> > on the root, it would not only mean that we leak the root directory, bu=
t also
> > all subdirs and files that we called keep() on.
> >
> > This becomes even more problematic if we start attaching data to files.=
 Think of
> > an Arc that is attached to a file, which keeps driver data alive just b=
ecause we
> > leaked the root.
>
> Ok, fair enough, let's try it this way, without keep()
>
> > > > However, we don't want users to be able to call keep() on the direc=
tory that has
> > > > been created first, since if that's done we loose our root anchor t=
o ever free
> > > > the tree, which almost always would be a bug.
> > >
> > > Then do a call to debugfs_lookup_and_remove() which is what I really
> > > recommend doing for any C user anyway.  That way no dentry is ever
> > > "stored" anywhere.
> > >
> > > Anyway, if Dir always has an implicit keep() call in it, then I guess
> > > this is ok.  Let's see how this shakes out with some real-world users=
.
> > > We can always change it over time if it gets unwieldy.
> >
> > I really advise against it, Rust allows us to model such subtile differ=
ences
> > properly (and easily) with the type system to avoid bugs. Let's take ad=
vantage
> > of that.
> >
> > Using debugfs_lookup_and_remove() wouldn't change anything, since we wa=
nt to
> > attach the lifetime of a directory to a corresponding object.
> >
> > (Otherwise we're back to where we are with C, i.e. the user has to reme=
mber to
> > call the correct thing at the correct time, rather than letting the typ=
e system
> > take care instead.)
> >
> > So, instead of debugfs_remove() we'd call debugfs_lookup_and_remove() f=
rom
> > Dir::drop(), which only changes what we store in Dir, i.e. struct dentr=
y pointer
> > vs. CString.
>
> Ok, that's fine, and it gives me an idea of how I can fix up the C api
> over time to get rid of exporting the dentry entirely :)

I've figured out that the SubDir API (and indeed, all patchsets after
v1) have a flaw in them, so I'm wondering if your rework will resolve
this.

If I do:
```
let dir =3D Dir::new(c_str!("foo"));
let subdir =3D dir.subdir(c_str!("bar"));
drop(dir);
// This next line will Oops because subdir is already removed
drop(Dir::from(subdir));
```

Simply removing `Dir::from` from the API won't resolve this - as long
as `SubDir` has any method, accessing it after its parent has been
cleaned up with `remove` will result in an oops.

The options I can see given the existing API are:
A. SubDir needs to be inherently limited to a borrow of another Dir or
SubDir. This will still break if someone uses
`debugfs_lookup_and_remove()` in an antisocial fashion, but we haven't
bound this in Rust, and we don't need to be robust against bad
behavior from C. If we do this, the promotability of subdirectories
back to directories would go away entirely,
B. I can leverage `dget`/`dput` to make it so that the directory I get
back from the APIs are actually owning, and so the dentry will not be
released while the Dir/SubDir exists. I understand this to be
undesired, but putting it out there, since it'd make things safe even
to `debugfs_lookup_and_remove()`.
C. I can limit use of `debugfs_remove` to the builder API (exists in
V1, no longer exists in this version, will be a separate patch soon
for reference). This is the behavior that I had written in V1 before I
started trying to adapt to requests. This means that the subdirectory
handles will remain valid because the non-builder handles will be
`dput` rather than recursively removed. Builder handles can't be
smuggled out due to an existential lifetime. Again, I understand this
is not desired, I'm just trying to lay out all ways to prevent this
class of error.
